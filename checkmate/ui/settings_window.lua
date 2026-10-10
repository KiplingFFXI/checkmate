--[[
    The settings window, opened with /checkmate.

    Changes show up right away. Checkboxes, dropdowns and buttons save at once. Sliders, text boxes and
    color pickers save when you let go of them, so dragging or typing doesn't write the settings file
    every frame. You can move and resize the window, and it opens where you left it at the size you
    left it. Its sections sit in two columns when the window is wide enough and stack into one when
    it isn't. Every setting has a (?) that explains it. Its colors, corners, spacing, font and font
    size come from the Appearance tab. Its layout grows and shrinks with the font size.
]]

local imgui       = require('imgui');
local printout    = require('core.printout');
local physical    = require('core.physical');
local aggro       = require('core.aggro');
local drops       = require('core.drops');
local magic       = require('core.magic');
local spells      = require('data.spells');
local wording     = require('core.wording');
local skins       = require('ui.skins');
local profiles    = require('ui.profiles');
local window_font = require('ui.window_font');
local chat_colors = require('ui.chat_colors');
local overlay     = require('ui.overlay');
local search      = require('ui.search');
local dangers     = require('core.dangers');
local ui = { display = require('ui.display'), presets = require('ui.presets'), history = require('ui.history'),
    preview = require('ui.preview'), navigation = require('ui.navigation') };

local settings_window = {};

local WINDOW_FLAGS = bit.bor(ImGuiWindowFlags_NoCollapse, ImGuiWindowFlags_NoSavedSettings,
    ImGuiWindowFlags_NoScrollbar, ImGuiWindowFlags_NoScrollWithMouse);
local COLOR_FLAGS  = bit.bor(ImGuiColorEditFlags_NoInputs, ImGuiColorEditFlags_AlphaBar,
    ImGuiColorEditFlags_NoDragDrop);
local SWATCH_FLAGS = bit.bor(ImGuiColorEditFlags_NoTooltip, ImGuiColorEditFlags_NoDragDrop);
local TABLE_FLAGS  = ImGuiTableFlags_SizingFixedFit;
local STRETCH      = ImGuiTableColumnFlags_WidthStretch;

-- Layout in pixels at Ashita's 18 px font, grown or shrunk with the font size. The second control on a
-- line starts 250 in. A part name wider than PART_WIDTH wraps between words. A tab's sections sit side
-- by side once the window has COLUMN_WIDTH for each. It grows with a bigger font but never shrinks,
-- since the gaps between things stay the same. A tip wraps at TIP_WIDTH.
local BASE_FONT_SIZE = 18;
local SECOND_COLUMN = 250;
local CONTROL_WIDTH = 190;
local LABEL_WIDTH   = 120;
local PART_WIDTH    = 100;
local COLOR_WIDTH   = 190;
local SMALL_WIDTH   = 60;
local CUTOFF_WIDTH  = 150;
local LIST_HEIGHT   = 130;
local COLUMN_WIDTH  = 480;
local TIP_WIDTH     = 360;

-- Pixels that stay the same at every font size. The window pads its inside 14 on each side and its
-- scrollbar takes 14, with 2 more to spare. Two sections sit 24 apart, and the columns of a table
-- inside them 12 apart. ImGui puts 8 between the things on a line and 4 between a box and its label.
local WINDOW_EDGES = 44;
local COLUMN_GAP   = 24;
local CELL_GAP     = 12;
local ITEM_GAP     = 8;
local INNER_GAP    = 4;

-- Tabs and controls wrap when the window narrows.
local MIN_SIZE = { 560, 320 };
local MAX_SIZE = { FLT_MAX, FLT_MAX };

-- Longest label and custom divider, in characters.
local LABEL_MAX     = printout.LABEL_MAX;
local SEPARATOR_MAX = printout.SEPARATOR_MAX;

-- Job links use up to three columns, with room for each job's dropdown.
local JOB_COLUMNS = 3;
local JOB_COMBO_AT       = 60;

-- The job link choice that loads nothing.
local NO_LINK = '(none)';

-- What a (?) shows.
local HELP_MARK = '(?)';

-- The line under the window's title. The version goes after it.
local SUBTITLE = 'Monster details and combat estimates on /check';

-- Style sizes that take the skin's corner roundness.
local ROUNDED = {
    ImGuiStyleVar_WindowRounding, ImGuiStyleVar_ChildRounding, ImGuiStyleVar_FrameRounding,
    ImGuiStyleVar_PopupRounding, ImGuiStyleVar_GrabRounding, ImGuiStyleVar_TabRounding,
    ImGuiStyleVar_ScrollbarRounding,
};

-- The space inside boxes and buttons.
local FRAME_PADDING = { 8, 4 };

-- The space around each table cell. The table that holds a tab's sections pads its cells by half the
-- gap between them.
local CELL_PADDING    = { CELL_GAP / 2, 3 };
local SECTION_PADDING = { COLUMN_GAP / 2, 3 };

-- The space inside the window's edges.
local WINDOW_PADDING = { 14, 12 };

-- Style sizes every skin shares.
local FIXED_SIZES = {
    { ImGuiStyleVar_WindowBorderSize,   1 },
    { ImGuiStyleVar_WindowPadding,      WINDOW_PADDING },
    { ImGuiStyleVar_FramePadding,       FRAME_PADDING },
    { ImGuiStyleVar_CellPadding,        CELL_PADDING },
    { ImGuiStyleVar_TabBarOverlineSize, 2 },
};

-- The chat color swatches, from ui\chat_colors.lua.
local SWATCHES = chat_colors.SWATCHES;
local PALETTE_NAMES = {};
for _, entry in ipairs(printout.PALETTE) do
    PALETTE_NAMES[entry.code] = entry.name;
end
-- The swatch colors by chat color code.
settings_window.SWATCHES = SWATCHES;

settings_window.INFO_SECTIONS = {
    { 'family', 'Family', 'Its family and type from the source.' },
    { 'charm', 'Charm', 'Its listed charm rules. Eligibility is not a success chance.', 'Weaknesses' },
    { 'vitals', 'HP and MP', 'Source HP and MP, with estimates or unknown inputs labeled.' },
    { 'movement', 'Movement', 'Its listed movement speed and movement rules.' },
    { 'pursuit', 'Pursuit', 'How it tracks or follows targets, where the source provides that information.', 'Aggro' },
    { 'spawn', 'Spawn', 'Spawn rules from the source. These are not a live spawn timer.' },
    { 'claim', 'Claim shield', 'Listed claim and help rules. These do not describe its current owner.' },
    { 'dangers', 'Dangers', 'Moves that can inflict debuffs or crit, plus other listed threats. Hover for conditions, or open Target details for the full list. This does not predict the next move. Missing or unresolved moves can leave gaps, so an empty section does not mean the monster is safe.' },
    { 'blue', 'Blue Magic', 'Possible learnable moves from the source, followed by whether your client says each spell is known or not learned. No learnable Blue spells means the resolved move list has none. Unknown means the source list is unresolved; spellbook unknown means your learned-spell list is unavailable. Hover for the reason and any gaps in the lesson list. Learning conditions still apply.', 'Blue Magic' },
    { 'fight', 'Fight rules', 'Known fight rules and script conditions.' },
    { 'traits', 'Traits', 'Listed monster traits and special behavior.' },
    { 'crystal', 'Crystal', 'Its listed crystal. A listed crystal is not a guaranteed drop.' },
    { 'rewards', 'Rewards', 'Source reward rules. Eligibility and server settings can change what you receive.' },
};


-- What each part is called in the parts table, and the reading's row under Difficulty.
local PART_NAMES = {
    difficulty = 'Difficulty', hit = 'Hit rate', offhand = 'Off-hand', ranged = 'Ranged', evade = 'Evade',
    pdif = 'pDIF', offhandpdif = 'Off-hand pDIF', rangedpdif = 'Ranged pDIF',
    block = 'Shield block', parry = 'Parry',
    crit = 'Crit', crittaken = 'Crit taken', job = 'Job', aggro = 'Aggro', links = 'Links', magic = 'Magic',
    weaknesses = 'Weaknesses', effects = 'Effects', drops = 'Drops', steal = 'Steal', pet = 'Pet',
};
for _, section in ipairs(settings_window.INFO_SECTIONS) do
    if (section[1] ~= 'charm') then PART_NAMES[section[1]] = section[2]; end
end
-- Dropdown choices, each the `id` kept in the settings and the `name` shown for it.
local NUMBER_STYLES = { { id = 'range', name = 'Range 64-72%' }, { id = 'midpoint', name = 'Middle ~68%' } };
settings_window.PDIF_MODES = { { id = 'range', name = 'Multiplier range' },
    { id = 'ratio', name = 'Attack/Defense ratio' }, { id = 'both', name = 'Both' } };
local SORTS = { { id = 'chance', name = 'By chance' }, { id = 'name', name = 'By name' } };
local ELEMENT_LOOKS = { { id = 'game', name = 'Game pictures' }, { id = 'badges', name = 'Colored badges' } };

-- The cutoff tables on the Numbers tab, each with its id, its two headers, the tip on its OK sliders and its rows by
-- label and settings key. The second holds the number that's better the lower it is, so its cutoffs go the other way.
local CUTOFFS = {
    { id = '##cutoffs', good = 'Good at or above', ok = 'OK at or above', tip = 'cutoffs',
      rows = { { 'Hit rate', 'hit' }, { 'Evade', 'evade' }, { 'Crit', 'crit' } } },
    { id = '##cutoffs_lower', good = 'Good at or below', ok = 'OK at or below', tip = 'cutoffs_taken',
      rows = { { 'Crit taken', 'crittaken' } } },
};

--[[
    Tips. Each (?) shows one of these.
]]

local TIPS = {
    pdif_mode = 'Show the ordinary noncritical damage multiplier range, the Attack/Defense ratio with its inputs, '
        .. 'or both. This applies to all three pDIF rows. Hover keeps both explanations and any known curve cap. '
        .. 'These are estimates from your retained Attack reply and stored monster Defense, not a damage prediction. '
        .. 'Use /check to refresh Attack, including when only an overlay pDIF row is on.',
    effects       = 'Options for the Effects part, in chat and in the overlay.',
    effects_show  = 'Which effects the part lists. Debuffs and buffs lists what you and others put on the '
        .. 'monster, then the buffs it gave itself, like Protect or Mighty Strikes. Only debuffs or Only buffs '
        .. 'leaves the other kind out.',
    effects_times = 'Shows estimated time left, like Paralyze 1:20. Your timers count the gear and merits '
        .. 'checkmate can read. Other timers use the usual duration from Phoenix. A resist or removal can end '
        .. 'an effect sooner, and hidden bonuses can make it last longer. These are estimates, not the server\'s '
        .. 'remaining times.',
    show_name     = 'Shows the monster\'s name. Turn it off to leave the name, level, ID and PH note out while the '
        .. 'other parts still print.',
    name_label    = 'A word before the name, empty at first. The label divider follows it.',
    show_level    = 'Adds the level after the name, like (Lv 42), or (Lv 38-40) when checkmate only knows the range.',
    show_range    = 'Once the monster\'s exact level is known, adds the levels it can spawn at, like (Lv 42, range '
        .. '40-44). A monster that only spawns at one level just shows its level. It needs Show level on.',
    range_word    = 'The word before that range. Clear it to get (Lv 42, 40-44).',
    show_id       = 'Adds the monster\'s ID after its name and level, like (ID 17199202). It\'s the number the server '
        .. 'knows that monster by, so two with the same name have different IDs.',
    id_word       = 'The word before the ID. Clear it to get (17199202).',
    show_ph       = 'Adds the NM this placeholder can pop, like (PH for Valkurm Emperor). The note only names '
        .. 'the NM. In the overlay, hover it for known lottery rules, or open Monster > Target details. '
        .. 'Those rules do not tell you whether the NM is up or its window is open.',
    ph_word       = 'The word before the NM. Clear it to get (Valkurm Emperor).',
    parts         = 'Parts print after the name, top to bottom, and the arrows move them. Type your own word in a '
        .. 'part\'s Label box, like Acc instead of Hit, or clear it for no label. A label can only use plain '
        .. 'letters, numbers, spaces and symbols. New line starts a new chat line before that part.',
    extras        = 'With this on, combat numbers, Job, Aggro, Links, Magic, Weaknesses, Effects, monster detail rows, '
        .. 'Drops, Steal and Pet never share a line with the name and difficulty. With it off, '
        .. 'they carry on along the same line unless their New line is on.',
    header        = 'Starts each /check line with [checkmate]. checkmate\'s answers to your commands always have it.',
    divider       = 'What goes between parts. It also goes between magic schools and before a count like "+2 more". '
        .. 'The star, diamond, circle, dot, note and arrow are symbols from the game\'s chat font that this window '
        .. 'can\'t draw, so print a sample to see how they look.',
    custom        = 'Your own text between parts. It can only use plain letters, numbers, spaces and symbols, because '
        .. 'the chat log can\'t show anything else.',
    label_divider = 'What goes right after each part\'s label, in the label\'s color, like the colon in "Aggro: '
        .. 'Aggressive". A part with no label doesn\'t get one.',
    custom_label  = 'Your own text right after each label, with a space after it. It can only use plain letters, '
        .. 'numbers, spaces and symbols.',
    number_style  = 'How a range prints for hit rate, off-hand, ranged, evade, shield block, parry, crit, crit taken, '
        .. 'magic, steal and pet numbers: the bounds or their approximate middle. Shield block and Parry keep fractional percentages.',
    replace       = 'Hides the game\'s own line for your /check, and checkmate\'s lines take its place. If none of '
        .. 'your parts would print anything, checkmate still prints the name, level, difficulty and the evasion and '
        .. 'defense reading. With it off, you see the game\'s line too, unless checker is loaded. checker hides '
        .. 'that line either way.',
    sample        = 'Prints a made-up /check in chat with your settings, in the real chat colors.',
    icons         = 'Puts the game\'s own element symbol from the chat font in front of each element name. That\'s '
        .. 'each element in Weaknesses, and the element inside the brackets after a Magic school\'s chance. '
        .. 'This window can\'t draw those symbols. Enable Weaknesses and its Elements component, then print a sample. Chat '
        .. 'can\'t show item or status pictures, so only elements get one. The overlay has its own icons on the '
        .. 'Display tab.',
    icons_only    = 'Shows only the element\'s symbol, without its name. It needs Element icons on.',

    overlay       = 'The overlay is a small panel on your screen that shows what checkmate knows about the monster '
        .. 'you have targeted, as soon as you target it. When you /check that monster, it adds the exact level, the '
        .. 'difficulty and the evasion and defense reading. It never sends anything on its own. You /check '
        .. 'yourself, and it reads the reply.',
    overlay_on    = 'Turns the overlay on. It\'s off by default, and while it\'s off checkmate doesn\'t read your '
        .. 'target at all.',
    overlay_lock  = 'Hold Shift and drag the overlay to move it, or drag its bottom right corner to change its width. '
        .. 'This stops both, so neither happens by accident. Without Shift, or with this on, clicks go through the '
        .. 'overlay to the game.',
    overlay_remember = 'Keeps the level, difficulty and evasion and defense reading from your last /check of each '
        .. 'monster, so they come back when you target it again. They clear when it dies near you, leaves sight or '
        .. 'you zone. Difficulty and the reading also clear when your level changes. The reading uses your accuracy '
        .. 'and attack at that /check, so /check again after changing gear or buffs. A widescan level clears when '
        .. 'the monster dies near you, leaves sight or you zone. With this off, a /check only shows until your target changes.',
    overlay_cursor = 'While you pick a target for a spell or ability, the overlay shows the monster under the cursor '
        .. 'instead of the one you had targeted. It\'s handy for checking what a monster is immune to before you cast.',
    overlay_spot  = 'Puts the overlay back where it starts, near the top left of your screen. You can also type '
        .. '/checkmate overlayspot with the spot you want, or hold Shift and drag it unless it\'s locked.',
    overlay_parts = 'Pick what the overlay shows. It uses the same labels, words and colors as the chat printout, so '
        .. 'change those on the Display, Appearance and Abbreviations tabs, and the options on the Numbers, Aggro, Magic, Drops, '
        .. 'Weaknesses, Blue Magic, Monster and Effects tabs count for it too. The parts after the difficulty go in the same order as the chat '
        .. 'printout. Hit rate, off-hand, ranged and evade use the stat reply from your manual /check. '
        .. 'Check again after changing gear or buffs. The passive overlay never requests stats.',
    overlay_show_level = 'Adds the level after the name, like (Lv 19), or the levels it can spawn at, like (Lv 18-19), '
        .. 'until a widescan or your /check gives the exact one.',
    overlay_show_range = 'Once the monster\'s exact level is known from your /check or a widescan, adds the levels it '
        .. 'can spawn at, like (Lv 19, range 18-19). It needs Show level on.',
    overlay_show_id = 'Adds the monster\'s ID after its name and level, like (ID 17199202).',
    overlay_show_ph= 'Adds the NM this placeholder can pop, like (PH for Valkurm Emperor). Hover the note for '
        .. 'known lottery rules. They do not tell you whether the NM is up or its window is open.',
    overlay_lines = 'Starts each part on a line of its own, with the name, difficulty and reading together on the top '
        .. 'line, whatever order the Display tab has. Links stays on Aggro\'s line when it comes right after it. With '
        .. 'it off, the overlay follows the order, the New line boxes and Put the extras on their own line from the '
        .. 'Display tab.',
    overlay_short = 'Uses abbreviations in the overlay, like A for Aggressive. The words and their abbreviations are on '
        .. 'the Abbreviations tab, where this switch is In the overlay. Chat has its own switch there.',
    overlay_divider = 'What goes between parts that share a line, like the name and the difficulty. It also goes '
        .. 'between magic schools and before a count like "+2 more". The overlay can\'t draw the chat log\'s symbols, '
        .. 'so it has its own list.',
    overlay_custom = 'Your own text between parts. It can only use plain letters, numbers, spaces and symbols.',
    overlay_font  = 'The overlay\'s font. It\'s picked from the same list as this window\'s font, but it\'s a '
        .. 'setting of its own.',
    overlay_font_size = 'The size of the overlay\'s text. Its padding, line spacing and icons grow with it.',
    overlay_opacity = 'How solid the overlay\'s background is. Its color is your skin\'s window background from the '
        .. 'Appearance tab. At 0% there\'s no background, but the border stays unless you turn it off. With no background '
        .. 'the text sits right on the game, so it can be hard to read over bright ground.',
    overlay_border = 'Draws a line around the overlay in your skin\'s border color. Its corners follow the Corner '
        .. 'roundness on the Appearance tab.',
    overlay_wrap  = 'A line wider than this wraps onto the next one. Lists break after a comma or a divider, '
        .. 'without splitting bracketed details like (Sight, Sound). Long source descriptions also wrap between '
        .. 'words. Never keeps each part on one line however wide it gets. You can also hold Shift and drag the '
        .. 'overlay\'s bottom right corner to set this, down to 100 px.',
    overlay_events = 'Hides the overlay while a cutscene or a conversation with an NPC is running.',
    overlay_ui    = 'Hides the overlay while you\'ve hidden the game\'s interface with Scroll Lock.',
    overlay_map   = 'Hides the overlay while the map is open. The widescan list doesn\'t count as the map.',
    overlay_icons = 'Puts a picture before each element in Weaknesses and Magic, each item in Drops and Steal, '
        .. 'each immunity and effect, and each job in the Job part, which gets that job\'s artifact head. Item and status '
        .. 'pictures come from your game client. Weapons uses the bundled BG Wiki damage-type icons at up to 16 pixels. '
        .. 'A missing picture leaves its name. Other pictures follow Font size.',
    overlay_icons_only = 'Leaves the names out, so only the pictures show. A name stays when its picture won\'t load. '
        .. 'When two immunities have the same picture in your game client, they keep their names, like Lullaby, Elegy '
        .. 'and Requiem, and Bind, Stun and Terror, in the game\'s own pictures. Every job\'s head is different there, '
        .. 'but Monk\'s and Paladin\'s look alike when they\'re small, and so do Thief\'s and Ranger\'s. With Tips on '
        .. 'hover on, rest the mouse on one to see which it is. Weapon names and percentages always stay. It needs Show icons on.',
    overlay_element_look = 'Game pictures uses the game\'s own element pictures from your game client. Colored badges '
        .. 'are small squares checkmate draws in the Element badges colors on the Appearance tab, with the element\'s '
        .. 'first letter, or Wi and Wa for wind and water. Their corners follow Corner roundness on the Appearance tab. An '
        .. 'element whose game picture won\'t load gets its badge. It needs Show icons on.',
    overlay_tips  = 'Rest the mouse on overlay text or an icon to see its full name and details. Text tips work '
        .. 'with Show icons off. The name explains where the level came from and how old the reading is. Links '
        .. 'shows up to 20 names; Monster > Target details has the full list. Tips wait a moment before '
        .. 'showing, hide while you hold a mouse button, and let clicks through to the game.',
    sample_colors = 'Prints a made-up /check in chat in the real chat colors. The swatches here are only close to '
        .. 'how they look in game. The overlay uses these exact swatch colors.',
    con_colors    = 'With this on, each con prints in its own color. With it off, every con prints in One color. A '
        .. 'label on Difficulty always uses One color.',
    threat_colors = 'With this on, Aggressive answers print in Threat, and Too weak, Not aggressive and Never '
        .. 'aggressive print in Safe. With it off, they all print in Words.',
    grades        = 'With this on, the hit rate, off-hand, ranged, evade, crit, crit taken and pet numbers use the '
        .. 'Good, OK and Bad colors, going by the cutoffs on the Numbers tab. With it off, they use each part\'s '
        .. 'Number color.',

    cutoffs       = 'The number prints in the Good color at or above the first cutoff, and in the OK color at or '
        .. 'above the second. Anything lower is Bad. A range like 64-72% goes by its middle. The three colors are '
        .. 'on the Appearance tab. Off-hand and Ranged go by the Hit rate row, and the pet part\'s Hit and Evade go by '
        .. 'the Hit rate and Evade rows.',
    cutoffs_taken = 'Crit taken is better the lower it is, so its cutoffs go the other way. It prints in the Good '
        .. 'color at or below the first cutoff, and in the OK color at or below the second. Anything higher is Bad. A '
        .. 'range goes by its middle.',
    crit_merits   = ('Your Critical Hit Rate merits, under Others in the game\'s merit menu. Each one adds %d%% to the '
        .. 'Crit part. Phoenix allows 0 to %d. The server only counts as many as your main level allows: %s. A level '
        .. 'sync counts too, and checkmate follows it. With Fill both in when you zone on, the server\'s merit list '
        .. 'sets it for you.'):format(physical.MERITS.crit_hit_rate.per_merit, physical.MERITS.crit_hit_rate.most,
        physical.merit_steps_text(physical.MERITS.crit_hit_rate.most)),
    enemy_crit_merits = ('Your Enemy Critical Hit Rate merits, under Others in the game\'s merit menu. Each one takes '
        .. '%d%% off the Crit taken part. Phoenix allows 0 to %d. The server only counts as many as your main level '
        .. 'allows: %s. A level sync counts too, and checkmate follows it. With Fill both in when you zone on, the '
        .. 'server\'s merit list sets it for you.'):format(physical.MERITS.enemy_crit_rate.per_merit,
        physical.MERITS.enemy_crit_rate.most, physical.merit_steps_text(physical.MERITS.enemy_crit_rate.most)),
    merit_fill    = 'Sets both sliders from the merit list the server sends when you zone, and one of them when you '
        .. 'change that merit, so they match what you have. You can still drag them, to see what more merits would '
        .. 'do, and what you set holds until you zone or change that merit. Turn this off to keep your own numbers. '
        .. 'Profiles don\'t keep your merits or this switch, since each character has its own.',
    pet           = 'The Pet part shows how often your pet hits the monster you /check and how often that monster '
        .. 'misses your pet. It works for a jug pet, a charmed monster, a wyvern and an automaton, but only one '
        .. 'that\'s out when your /check comes back. For all but a charmed monster, checkmate asks the game with a '
        .. '/checkparam, so the Pet line prints a moment after the rest.',
    pet_name      = 'Shows your pet\'s name at the start of the Pet part. Turn it off to leave its name and level out.',
    pet_level     = 'Adds your pet\'s level after its name, like (Lv 75). The game picks a jug pet\'s level at random '
        .. 'when you call it, so it shows the levels it can be, like (Lv 73-75). A wyvern keeps its level when you '
        .. 'level up, so it can show a range then until you call it again. Its numbers can be a range too.',
    pet_hit_word  = 'The word before how often your pet hits the monster. Clear it to leave the word out.',
    pet_evade_word = 'The word before how often the monster misses your pet. Clear it to leave the word out.',
    ranged_far    = 'The Ranged part shows your hit rate in your weapon\'s sweet spot. You shoot with your full '
        .. 'accuracy from right up close out to the far edge of the sweet spot. Past that edge you hit less the '
        .. 'farther you stand, and past 25 yalms you\'re too far away to shoot. This adds your hit rate at 25 '
        .. 'yalms after it, the lowest it gets before you\'re out of range, like "Ranged: 63% (55% at 25 yalms)".',

    aggressive    = 'checkmate\'s data says whether a monster is aggressive, and your /check says whether it\'s too '
        .. 'weak to aggro you at your level. One that checks Too Weak won\'t aggro you unless you rest or sit. If '
        .. 'a monster is impossible to gauge, checkmate goes by its level from widescan, or else the levels in its '
        .. 'data.',
    detection     = 'Adds how an aggressive monster notices you, like (Sight, Sound). Invisible stops Sight, and '
        .. 'Sneak stops Sound. Magic means it notices you casting a spell that costs MP. Low HP means it notices '
        .. 'you when your HP is under 75%. Ability means it notices your job abilities and weapon skills. Nothing '
        .. 'stops those three. True Sight sees through Invisible and True Sound hears through Sneak. Ambush means '
        .. 'it aggroes you within 3 yalms unless you have Sneak on. Times like 18:00-5:59 are Vana\'diel time.',
    link_how      = 'Adds how each monster it links with joins the fight, like Goblin Thug (Sight). Every one but a '
        .. 'Superlink has to be near a monster in the fight, with nothing in the way. Sight means it sees but '
        .. 'doesn\'t hear, so it also has to be facing that monster. Sound, or Sight, Sound, means it hears and '
        .. 'joins from any side. One that neither sees nor hears says what it notices instead, like (Magic), and '
        .. 'joins from any side too. One that only notices scent gets nothing after its name. Superlink means it '
        .. 'shares a superlink with the monster you checked or with another one in the fight, and joins from '
        .. 'anywhere in the zone. A name can show two when some of its monsters join one way and some the other, '
        .. 'like Fomor Monk (Superlink or Sound). True Sight and True Sound tell you it sees through Invisible or '
        .. 'hears through Sneak, but a link never cares about those. With the names off, it says how they link all '
        .. 'together, like Links (Sight, Sound).',
    link_names    = 'Names every kind of monster that can end up in the fight when you pull it. A monster joins '
        .. 'when it\'s idle and near any monster already in the fight, or from anywhere when it shares that '
        .. 'monster\'s superlink, so one helper can bring in more. If its own name is in the list, others of its kind '
        .. 'help it. With this off, it just says "Links" or "Doesn\'t link", and Show how each one links adds how '
        .. 'they link, like "Links (Sight)".',
    group_families = 'Groups two or more names from the same family when they link in the same way, '
        .. 'like Goblin family (Sight). Names without a matching family and link conditions stay separate. Family labels '
        .. 'cover only the listed names. Hover or open Target details for exact names.',
    max_links     = 'The most entries shown after family grouping. The rest show as "+2 more". All shows every '
        .. 'entry. Hover or open Target details for the exact names.',

    schools       = 'Each school\'s chance is for the spell you pick next to it. A school only prints when you have '
        .. 'skill in it from your main or support job.',
    extra_accuracy= 'With Include known gear and merits on, enter only the magic accuracy bonus checkmate has '
        .. 'not counted, such as food. With it off, enter your full direct bonus from gear, food and merits. '
        .. 'This adds to every school. Skills and attributes are counted separately in either mode.',
    elements      = 'The Elements component of Weaknesses lists the elements a monster is weak to and the ones it resists, like "Weak: '
        .. 'Ice, Thunder" and "Resists: Water (half)". Weak means that element\'s nukes do more damage than the '
        .. 'others, or its spells land more often. Resists means they do less damage or land less often.',
    weak_word     = 'The word before the elements the monster is weak to. Clear it to leave the word out.',
    resist_word   = 'The word before the elements the monster resists. Clear it to leave the word out.',
    weapons       = 'The Weapons component of Weaknesses shows which damage types do more or less damage, like Slashing (+25%) or '
        .. 'Piercing (-50%). Types with no change are left out. These are stored damage-type values, not a '
        .. 'prediction of your final damage. General damage changes and absorb/nullify chances have separate labels. '
        .. 'A ? means these values can change during the fight.',
    weapons_weak_word = 'The word before weapon damage types that do more damage. Clear it to leave the word out.',
    weapons_resist_word = 'The word before weapon damage types that do less damage. Clear it to leave the word out.',
    elementmark   = 'Shows a ? after Elements when scripts can change its stored values. Turning this off hides '
        .. 'only the mark. Hover details still explain that the values can change.',
    strength      = 'Adds how strong each one is, like (half) for half damage, (never lands), (rarely lands), '
        .. '(absorbs) when the spell heals the monster, or (nullifies) when it does nothing. It also adds a note '
        .. 'when every element does more or less damage, like Magic damage -25%. A ? means these values can '
        .. 'change during the fight. checkmate shows the stored values.',

    th            = ('Drop chances use this Treasure Hunter level, for one kill. Phoenix allows 0 to %d.')
        :format(drops.TH_MAX),
    max_items     = 'The most items shown. The rest show as "+2 more". All shows every item.',
    min_chance    = 'Leaves out items under this chance.',
    order         = 'Lists the items by chance, highest first, or by name.',
    th_in_label   = 'Puts your Treasure Hunter in the label, like "Drops (TH 2)".',
    drop_notes    = 'Adds (scripted loot conditions), (only drops if you get EXP), or (conditional) when they '
        .. 'apply. Steal also gets (conditional), since the item must still be available and you must be able '
        .. 'to receive it.',
    immunities    = 'The Immunities component of Weaknesses lists what the monster is immune to, out of the ones you have on here, in '
        .. 'this order and with your labels.',
    immunity      = 'The word the list prints for this immunity. Untick On to leave it out.',

    short_words   = 'Abbreviations shorten checkmate\'s own words, like A for Aggressive or DC for Decent '
        .. 'Challenge, so a line takes less room. Chat and the overlay each have their own switch, so one can be '
        .. 'short while the other stays in full. Every word below has a box with its abbreviation, and you can type '
        .. 'your own. Two words that print in the same place never come with the same one.',
    short_chat    = 'Uses the abbreviations in your /check lines and the sample. With it off, every word prints in full.',
    short_overlay = 'Uses the abbreviations in the overlay. It\'s a switch of its own, so the overlay can be short while '
        .. 'chat stays in full. It\'s the same switch as Abbreviations on the Display tab.',
    short_reset   = 'Puts every box below back to the abbreviation checkmate comes with. The two switches stay as they '
        .. 'are.',

    skin          = 'Sets every window color, the corners and spacing, the colors on the Appearance tab and Color '
        .. 'by difficulty. You can still change any of them after, and the list says Custom once you do. Your font '
        .. 'and font size stay the same.',
    reset_skin    = 'Puts back everything the skin you picked sets.',
    undo          = 'Takes back your last skin pick or Reset to skin. It goes back one step only.',
    font          = 'The font of this window. The chat log\'s font belongs to the game, and no addon can change it.',
    font_size     = 'The size of this window\'s font. The window\'s layout grows and shrinks with it.',
    rounding      = 'How round the corners of the window, its boxes, the overlay and its badges are. At 0 they\'re '
        .. 'square.',
    spacing       = 'The space between rows.',

    profiles      = 'Every character shares the profiles. A profile holds every setting except the job links, your '
        .. 'merits, Fill both in when you zone, visible tabs, where this window and the overlay sit, and this window\'s size. Pick '
        .. 'one in the list to overwrite, load, rename or delete it.',
    profile_name  = 'Type a name here for Save as new or Rename.',
    save_new      = 'Saves your settings as a new profile with the name in the box.',
    overwrite     = 'Saves your settings over the profile you picked.',
    load          = 'Loads the profile you picked.',
    rename        = 'Gives the profile you picked the name in the box.',
    delete        = 'Deletes the profile you picked.',
    job_links     = 'A linked profile loads when you change to that main job and zone. Each character has its own '
        .. 'links.',
};

-- What each row of the parts table prints.
local PART_TIPS = {
    block = 'Your shield block chance against this monster when a block check is allowed. It is a conditional '
        .. 'rate, not the share of all incoming attacks you will block. Numbers has its chat and overlay switches.',
    parry = 'Your parry chance against this monster when a parry check is allowed. It is a conditional rate, '
        .. 'not the share of all incoming attacks you will parry. Numbers has its chat and overlay switches.',
    pdif = 'Your main-hand pDIF: the possible multiplier for normal noncritical hits and the Attack/Defense ratio. '
        .. 'It uses your /checkparam Attack reply and the monster\'s stored Defense. Numbers has the display options. '
        .. 'Critical hits, weapon skills, hit chance and damage-taken rules are separate.',
    offhandpdif = 'The same pDIF estimate for your off-hand weapon, using its own Attack reply. It only appears '
        .. 'when you wield a weapon in each hand. Numbers has the display options.',
    rangedpdif = 'The same pDIF estimate for normal ranged attacks, using your Ranged Attack reply. It appears '
        .. 'when you have a ranged weapon and ammunition. Numbers has the display options.',
    weaknesses = 'Elements, weapon damage types, immunities and Charm on one line. Pick each component on the Weaknesses tab.',
    effects       = 'The effects you have seen land on the monster, with estimated time left. It only knows '
        .. 'the action messages your client received since you zoned or turned this on. Missing observations '
        .. 'and early removals can leave this list incomplete. The Effects tab has its options.',
    difficulty = 'The difficulty from your /check, like Decent Challenge or Very Tough.',
    reading    = 'The evasion and defense reading, in parentheses after the difficulty, like "Very Tough (High '
        .. 'Evasion, Low Defense)", or after the name when Difficulty is off. It\'s left out when both are normal. '
        .. 'Defense first puts defense before evasion.',
    hit        = 'Your chance to hit the monster with your main weapon, from your accuracy in a /checkparam that '
        .. 'checkmate sends after your /check, so its line and the ones under it wait about two seconds for the '
        .. 'answer. To get everything else right away, move Hit rate, Off-hand, Ranged, Evade and Crit to the '
        .. 'bottom and tick New line on this row.',
    offhand    = 'Your chance to hit the monster with your off-hand weapon, from your off-hand accuracy in that same '
        .. '/checkparam, so its line waits for the answer too. It only shows while you have a weapon in each hand. '
        .. 'Hand-to-hand has none, since Hit rate already covers both fists.',
    ranged     = 'Your chance to hit the monster with a ranged attack, from your ranged accuracy in that same '
        .. '/checkparam, so its line waits for the answer too. The number is your hit rate in your weapon\'s '
        .. 'sweet spot, where you shoot with your full accuracy. Past the sweet spot you hit less, and past 25 '
        .. 'yalms you\'re too far away to shoot. It only shows when you can shoot, with a bow, crossbow or gun and '
        .. 'its ammo, or something to throw. The Numbers tab can add your hit rate at 25 yalms.',
    evade      = 'Your chance to dodge the monster\'s attacks, from your evasion in that same /checkparam, so its '
        .. 'line waits for the answer too. It says "with Signet" when Signet raises it.',
    crit          = 'How often your melee hits are critical hits, out of the ones that land. It uses your DEX '
        .. 'against the monster\'s AGI, your merits, supported gear and known effects such as Mighty Strikes. '
        .. 'A ~ marks a known input whose bonus checkmate cannot measure. Ranged attacks use different stats. '
        .. 'It needs no /checkparam, but waits if it shares a line with Hit, Off-hand, Ranged or Evade, or is below it.',
    crittaken  = 'How often the monster\'s hits on you are critical hits, out of the ones that land. It\'s 5%, plus up '
        .. 'to 15% more when its DEX is far enough over your AGI, plus a few monsters\' own crit bonus, less your '
        .. 'Enemy Critical Hit Rate merits from the Numbers tab and the gear that lowers it, like Safety Mantle. Lower '
        .. 'is better, so its grade colors go the other way. It\'s for the monster\'s normal swings and its counters. Its TP moves roll their crits their own way, so '
        .. 'a monster that swings with nothing but TP moves says "(TP moves)", and one that never swings at all, like '
        .. 'the Memory Receptacles, says "(no swings)". One of them that can counter, like Nantina, shows the number '
        .. 'for its counters with the word after it. An observed Mighty Strikes shows ~100% while its estimated timer lasts. It doesn\'t need '
        .. 'the /checkparam, so it only waits when it\'s on the line with hit rate, off-hand, ranged or evade, or a '
        .. 'line under it.',
    job        = 'The monster\'s job from checkmate\'s data, like "Job: DRK/WAR", main job first. The support job '
        .. 'only shows when it\'s a different job, so a DRK with a DRK support job says DRK. On Phoenix a monster\'s '
        .. 'jobs set its stats and traits, and which two-hour it uses if it has one. For most monsters that\'s all '
        .. 'the job means, which is why crabs are PLD. Monsters with the same name can have different jobs, and each '
        .. 'one shows its own. It\'s left out for a monster Phoenix\'s data gives no job, though the server runs it as '
        .. 'a WAR. It\'s also left out for a monster checkmate has no data for, and for the few whose script picks '
        .. 'their job when they spawn, like the Trolls\' automatons.',
    aggro      = 'Whether the monster aggroes you at your level and how it notices you. The Aggro tab has its '
        .. 'options.',
    links      = 'What links with the monster when you pull it and how each one joins the fight, like "Links with '
        .. 'Goblin Thug (Sight)", or "Doesn\'t link". By default it comes right after Aggro, on Aggro\'s line. While '
        .. 'it comes right after Aggro and Aggro is off, it takes Aggro\'s place, so it starts a new line when '
        .. 'Aggro\'s New line is on. The Aggro tab has its options.',
    magic      = 'Your chance with each school you pick on Magic. Blue has its own display row.',
    immunities = 'What the monster is immune to, like Sleep or Bind. The Weaknesses tab picks which ones show.',
    elements   = 'The elements the monster is weak to and the ones it resists. The Weaknesses tab has its options.',
    weapons    = 'Weapon damage types that do more or less damage, with signed percentages. Neutral types stay '
        .. 'out. The Weaknesses tab has its options.',
    drops      = 'What the monster drops and the chance of each, at your Treasure Hunter. The Drops tab has its '
        .. 'options.',
    steal      = 'What Steal can take from the monster and your chance to steal it, like "Steal: Fish Scales (77%)". '
        .. 'The chance is the server\'s own roll: 50%, plus 2% for each point of Steal on your gear, plus 1% for each '
        .. 'of your THF levels, minus 1% for each of the monster\'s levels. Your THF level is your main level with '
        .. 'THF main, or your support level with THF support. On a job without THF, or before THF 5, you can\'t use '
        .. 'Steal, so it only names the item. A monster with a list gives one of them at random. An NM\'s /check '
        .. 'gives no level, so its chance can be a range, like 76-77%. It counts the gear you have on when your '
        .. '/check comes back, and Rogue\'s Ring if your HP was 75% or less and your TP under 100% then. That 75% is '
        .. 'of your max HP before gear and food. Until the server sends that value, or while Level Sync can leave '
        .. 'it out of date, the chance covers both Ring outcomes and gets a ~. It doesn\'t know when someone already '
        .. 'stole from the monster, or when the item is Rare and you already have one.',
    pet        = 'How often your pet hits the monster and how often the monster misses it, with your pet\'s name '
        .. 'and level. Except for a charmed monster, checkmate needs a /checkparam for your pet, so this line '
        .. 'prints about two seconds after your /check, or about three and a half with Hit rate or Evade on, or '
        .. 'Off-hand or Ranged while you have that weapon on. It never holds up the other lines, so if it shares '
        .. 'your /check line, that line prints after the ones under it. The Pets tab has its options.',
};

-- What each row of the overlay's parts table shows.
local OVERLAY_PART_TIPS = {
    hit = 'Your main-hand hit chance from the stat reply after your manual /check. Hover shows the reply age. '
        .. 'Check again after changing gear or buffs; the passive overlay never requests stats.',
    offhand = 'Your off-hand hit chance from the same stat reply, while you wield two weapons. '
        .. 'Check again after changing gear or buffs; the passive overlay never requests stats.',
    ranged = 'Your ranged hit chance in the sweet spot, from the same stat reply. It appears while you can shoot. '
        .. 'Check again after changing gear or buffs; the passive overlay never requests stats.',
    evade = 'The chance the monster\'s normal swings miss you, from the stat reply after your manual /check. '
        .. 'Check again after changing gear or buffs; the passive overlay never requests stats.',
    block = 'Your conditional shield block chance against the selected monster. Hover explains the equipment '
        .. 'requirements and which attacks can reach the block check.',
    parry = 'Your conditional parry chance against the selected monster. Hover explains the weapon '
        .. 'requirements and which attacks can reach the parry check.',
    pdif = 'Your main-hand pDIF from a retained Attack reply and stored monster Defense. A manual /check '
        .. 'refreshes Attack for this row. The passive overlay never requests stats. Hover shows the reply age.',
    offhandpdif = 'Off-hand pDIF from its retained Attack reply. It appears while you wield two weapons. '
        .. 'A manual /check refreshes it. The passive overlay never requests stats, and changed gear or buffs can make the reply stale.',
    rangedpdif = 'Ranged pDIF from a retained Ranged Attack reply, while a ranged weapon and ammunition are '
        .. 'equipped. A manual /check refreshes it. The passive overlay never requests stats; changed gear or buffs can make the reply stale.',
    weaknesses = 'Elements, weapon damage types, immunities and Charm on one line, with separate component choices for the overlay.',
    effects       = 'The effects you have seen land, like the chat\'s Effects part. Their estimated times count '
        .. 'down, and Show icons adds their game pictures. Hover a name or picture for details. A monster with '
        .. 'no bundled data can appear once an effect is observed on it.',
    name       = 'The monster\'s name and its level. Before you /check it, the level is the one your widescan saw, or '
        .. 'else the levels that spot can spawn at from its data, like (Lv 18-19). Turn it off to leave the name, '
        .. 'level, ID and PH note out.',
    difficulty = 'The difficulty from your last /check of this monster, like Decent Challenge. It only shows once '
        .. 'you\'ve checked it.',
    reading    = 'The evasion and defense reading from your last /check of this monster, in parentheses after the '
        .. 'difficulty, like (Low Evasion). It\'s left out when both are normal.',
    crit          = 'How often your melee hits are critical hits, like the chat\'s Crit part. It refreshes when '
        .. 'your stats, gear or buffs change. An unknown monster level gives a range. Hover the number for its '
        .. 'inputs and any known limits.',
    crittaken     = 'How often the monster\'s hits on you are critical hits, like the chat\'s Crit taken part. '
        .. 'It refreshes when your stats, gear, buffs or observed monster effects change. An unknown monster '
        .. 'level gives a range. Hover the number for its inputs and any known limits.',
    job        = 'The monster\'s job, like the chat\'s Job part. It comes from the data, so it shows as soon as you '
        .. 'target the monster. With Show icons on, each job has its artifact head in front, the game\'s own '
        .. 'picture, like the Fighter\'s Mask for WAR.',
    aggro      = 'Whether the monster aggroes you at your level and how it notices you. Before you /check it, it goes '
        .. 'by the monster\'s level against yours, so one at Lv 29-30 can say Aggressive if it\'s level 30 or higher.',
    links      = 'What links with the monster and how each one joins the fight, like the chat\'s Links part. It comes '
        .. 'from the data, so it shows as soon as you target the monster.',
    magic         = 'The chance for each spell you picked on Magic. It refreshes when your skills, '
        .. 'stats, gear, buffs or observed monster effects change. An unknown monster level gives a range. '
        .. 'Hover a school to see the spell, its inputs and what its percentage means.',
    immunities = 'What the monster is immune to, out of the ones you have on in the Weaknesses tab.',
    elements   = 'The elements the monster is weak to and the ones it resists.',
    weapons    = 'Weapon damage types that do more or less damage, with signed percentages. Neutral types stay out.',
    drops      = 'What the monster drops and the chance of each, at your Treasure Hunter on the Drops tab.',
    steal         = 'What you can steal and your chance to take it. It refreshes when your jobs, gear, HP or TP '
        .. 'change. An unknown monster level gives a range. Rogue\'s Ring uses HP before gear and food. If that '
        .. 'base HP is unknown or Level Sync can leave it out of date, the chance covers both Ring outcomes. The chance still '
        .. 'depends on the item being available and your being able to receive it.',

};

for _, section in ipairs(settings_window.INFO_SECTIONS) do
    if (section[1] ~= 'charm') then
        PART_TIPS[section[1]] = section[3];
        OVERLAY_PART_TIPS[section[1]] = section[3];
    end
end
PART_TIPS.blue = PART_TIPS.blue .. ' Its row also shows the optional Blue spell chance.';
OVERLAY_PART_TIPS.blue = PART_TIPS.blue;
OVERLAY_PART_TIPS.pet = 'Your pet estimates from a retained /check or source data for a charmed pet. A manual /check '
    .. 'can refresh its stats. The passive overlay never requests pet stats. An unknown or replaced pet cannot reuse another pet\'s snapshot.';

-- What the overlay does on its own, under its Hide it options. Each note is one short sentence.
local OVERLAY_NOTES = {
    'The overlay also hides while you zone, when your target isn\'t a monster, and when it dies near you.',
    'With this window open, it shows a sample goblin when no monster is targeted.',
    'Unless it\'s locked, hold Shift and drag it to move it, or drag its corner to change its width.',
};

-- What each magic school's row covers.
local SCHOOL_TIPS = {
    elemental  = 'Elemental magic. It uses the element the monster resists least and names it, like (Ice). The '
        .. 'chance is that the nuke isn\'t resisted at all.',
    enfeebling = 'Enfeebling magic. The chance is that the spell you pick lands.',
    dark       = 'Dark magic. For Bio and Drain it\'s the chance they aren\'t resisted at all, and for Stun the '
        .. 'chance it lands.',
    divine     = 'Divine magic. For Banish and Holy it\'s the chance they aren\'t resisted at all, and for Flash the '
        .. 'chance it lands.',
    healing    = 'Cure on an undead monster, which it hurts. It only prints on undead.',
    ninjutsu   = 'Ninjutsu. Elemental Ichi uses the element the monster resists least, and its chance is that it '
        .. 'isn\'t resisted at all. For the others it\'s the chance the effect lands.',
    singing    = 'Songs. The chance is that the song you pick lands.',
    blue       = 'Blue magic, as a magical spell of the element the monster resists least. The chance is that it '
        .. 'isn\'t resisted at all.',
};

-- What an immunity covers, for the ones whose name doesn't say it all.
local IMMUNITY_COVERS = {
    dark_sleep  = 'It covers Sleep, Sleep II, Sleepga, Sleepga II and Soporific. ',
    light_sleep = 'It covers Foe Lullaby, Horde Lullaby, Sheep Song and Yawn. ',
    blind       = 'Flash fails on a monster immune to Blind too. ',
};

-- What each heading on the Abbreviations tab covers.
local WORD_GROUP_TIPS = {
    ['Monster'] = 'The default source-detail labels, including Charm within Weaknesses. Custom row labels stay as typed.',
    ['Weapons'] = 'The four weapon damage type names. Their signed percentages stay with them.',
    ['Effects'] = 'The names of the debuffs in the Effects part, like Paralyze. A monster\'s own buffs, '
        .. 'like Protect, are the game\'s own names and keep their spelling.',
    ['Difficulty']          = 'The difficulty from your /check.',
    ['Evasion and defense'] = 'The reading after the difficulty, like (Lo Eva, Hi Def).',
    ['Numbers']             = 'Unknown stands in for a number checkmate couldn\'t work out, in every part with one, '
        .. 'Steal\'s chance included. With Signet follows evade, and at 25 yalms follows your ranged hit rate outside '
        .. 'the sweet spot. TP moves and no swings stand in for crit taken.',
    ['Aggro']               = 'The aggro answer.',
    ['How it finds you']    = 'How an aggressive monster notices you, and how each monster it links with joins the '
        .. 'fight.',
    ['Aggro notes']         = 'The notes after the aggro answer, each in parentheses, in the same place as how it '
        .. 'finds you.',
    ['Links']               = 'What the Links part says, and the word after a count of names or items it doesn\'t '
        .. 'show, here and in Drops.',
    ['Magic']               = 'The school names, and what a school says when its spell can\'t land.',
    ['Elements']            = 'The element names, here and in a school\'s parentheses, how strong each one is, and the '
        .. 'magic damage note.',
    ['Drops and steal']     = 'The drop notes, and what Steal says when there\'s nothing to steal.',
    ['Can\'t be gauged']    = 'The line for a monster checkmate can\'t gauge, after its name.',
    ['Jobs']                = 'The job letters in the Job part, like DRK in Job: DRK/WAR. They\'re short already, so '
        .. 'each comes as its own letters, and you can type your own, like D.',
};

-- A note at the start of a word's (?) on the Abbreviations tab, for the words that need one.
local WORD_NOTES = {
    aggro_from_level = 'The level and a + go after it, like A if Lv 30+.',
    note_awake       = 'The hours go after it, like awake 6:00-20:59.',
    sense_true_sight = 'An imp\'s night hours go after it, like TS 18:00-5:59.',
    link_links       = 'With the names on, it stands for Links with, like L Goblin Thug.',
    list_more        = 'The word after a count, when Links or Drops has more names or items than it shows.',
    num_unknown      = 'It stands in for a number checkmate couldn\'t work out.',
    num_signet       = 'It follows evade, like 31% w/Sig.',
    num_unavailable  = 'Shield block or Parry when your known job or equipment cannot use that check. Unknown inputs use unknown instead.',
    num_far          = 'It follows your hit rate at 25 yalms, like (55% @25y).',
    pdif_ratio       = 'The raw Attack/Defense ratio in a pDIF row. It is separate from the random multiplier range.',
    pdif_attack      = 'Your Attack input in a pDIF row.',
    pdif_defense     = 'The monster\'s stored Defense input in a pDIF row.',
    num_tp_moves     = 'It stands in for crit taken when the monster swings with nothing but TP moves, like (TP). For '
        .. 'one that can counter, it follows the number.',
    num_no_swings    = 'It stands in for crit taken when the monster never swings, like (no sw). For one that can '
        .. 'counter, it follows the number.',
    str_nullify      = 'A chance follows it when it doesn\'t always, like null 50%.',
    str_absorb       = 'A chance follows it when it doesn\'t always, like abs 50%.',
    str_meva         = 'It means extra magic evasion for that element, so its spells land less often.',
    elem_mdt         = 'The change in magic damage follows it, like MDT -25%.',
    magic_immune     = 'What a school says when the monster is immune to its spell.',
    magic_never      = 'What a school says when its spell never lands.',
    line_cant_gauge  = 'It follows the monster\'s name.',
};

-- A job's (?) starts with the job's full name.
for _, entry in ipairs(wording.LIST) do
    if (entry.name ~= nil) then
        WORD_NOTES[entry.key] = ('%s\'s letters.'):format(entry.name);
    end
end

-- Tips that every hit rate, off-hand, ranged, evade, crit and crit taken color shares.
local LABEL_TIP  = 'The label and the label divider after it.';
local NUMBER_TIP = 'The number while grade colors are off. With them on, the Grades colors paint it.';
local DETAIL_TIP = 'The small extras, like "unknown" and the "?" after a number.';

-- What each chat color paints, by key.
local COLOR_TIPS = {
    pdif_label = LABEL_TIP,
    pdif_number = 'The main-hand pDIF multiplier and ratio. Percentage grade colors do not apply.',
    pdif_detail = 'Main-hand pDIF input labels, Attack and Defense, unknown values and script warnings.',
    offhandpdif_label = LABEL_TIP,
    offhandpdif_number = 'The off-hand pDIF multiplier and ratio. Percentage grade colors do not apply.',
    offhandpdif_detail = 'Off-hand pDIF input labels, Attack and Defense, unknown values and script warnings.',
    rangedpdif_label = LABEL_TIP,
    rangedpdif_number = 'The ranged pDIF multiplier and ratio. Percentage grade colors do not apply.',
    rangedpdif_detail = 'Ranged pDIF input labels, Attack and Defense, unknown values and script warnings.',
    info_label = 'The independent source-detail row labels and their label dividers.',
    info_name = 'The Charm label within Weaknesses.',
    info_value = 'The source-detail values, including Charm within Weaknesses.',
    info_detail = 'The divider between Blue lessons and Spell chance.',
    effects_label     = LABEL_TIP,
    effects_name      = 'The names of the debuffs on the monster, like Paralyze.',
    effects_buff      = 'The names of the buffs the monster gave itself, like Protect.',
    effects_time      = 'The time left on your own effects, like 1:20.',
    effects_guess     = 'The time left on everyone else\'s effects and the monster\'s own. It\'s a guess, since '
        .. 'nothing tells checkmate when they end, so it has its own color.',
    effects_detail    = 'The commas, and the divider between the debuffs and the buffs.',
    tag_brackets      = 'The square brackets of the tag, the [checkmate] at the start of each line.',
    tag_word          = 'The word checkmate inside the tag.',
    line              = 'The dividers between parts, except the one before Links right after Aggro, which is in the '
        .. 'Links Details color. It also paints the "can\'t be gauged" line.',
    replies           = 'checkmate\'s answers to your /checkmate commands.',
    name              = 'The monster\'s name.',
    level             = 'The level after the name, like (Lv 42).',
    level_range       = 'The range after a known level, like "range 40-44".',
    id                = 'The ID after the name and level, like (ID 17199202).',
    ph                = 'The PH note after the name, level and ID, like (PH for Valkurm Emperor).',
    difficulty        = 'Every con while Color by difficulty is off, and a label on Difficulty either way.',
    reading           = 'The evasion and defense words, like High Evasion.',
    reading_detail    = 'The parentheses around the reading and the comma inside them.',
    hit_label         = LABEL_TIP,
    hit_number        = NUMBER_TIP,
    hit_detail        = DETAIL_TIP,
    evade_label       = LABEL_TIP,
    block_label       = LABEL_TIP,
    block_number      = 'The conditional shield block chance. Grade colors do not apply.',
    block_detail      = 'Unknown or unavailable block estimates and script warnings.',
    parry_label       = LABEL_TIP,
    parry_number      = 'The conditional parry chance. Grade colors do not apply.',
    parry_detail      = 'Unknown or unavailable parry estimates and script warnings.',
    evade_number      = NUMBER_TIP,
    evade_detail      = 'The small extras, like "with Signet", "unknown" and the "?" after a number.',
    offhand_label     = LABEL_TIP,
    offhand_number    = NUMBER_TIP,
    offhand_detail    = DETAIL_TIP,
    ranged_label      = LABEL_TIP,
    ranged_number     = NUMBER_TIP,
    ranged_detail     = 'The small extras, like your hit rate at 25 yalms, "unknown" and the "?" after a number.',
    crit_label        = LABEL_TIP,
    crit_number       = NUMBER_TIP,
    crit_detail       = DETAIL_TIP,
    crittaken_label   = LABEL_TIP,
    crittaken_number  = NUMBER_TIP,
    crittaken_detail  = 'The small extras, like "(TP moves)", "(no swings)", "unknown" and the "?" after '
        .. 'a number.',
    job_label         = LABEL_TIP,
    job_name          = 'The job letters, like DRK.',
    job_detail        = 'The slash between the main job and the support job.',
    aggro_label       = LABEL_TIP,
    aggro_words       = 'The answer while Color by threat is off.',
    aggro_detail      = 'How it notices you, like "(Sight, Sound)", and the notes.',
    aggro_threat      = 'Aggressive while Color by threat is on.',
    aggro_safe        = 'Too weak, Not aggressive and Never aggressive while Color by threat is on.',
    links_label       = LABEL_TIP,
    links_words       = '"Links with", "Links", "Doesn\'t link" and the names.',
    links_detail      = 'How the monsters it links with join, like "(Sound)", the commas, the "+2 more" count, and the '
        .. 'divider before Links when it comes right after Aggro on the same line.',
    magic_label       = LABEL_TIP,
    magic_name        = 'The school names, like Elemental.',
    magic_number      = 'Each school\'s chance, like 88%.',
    magic_detail      = 'The small extras, like "(Ice)", "never" and "immune", and the dividers between schools.',
    immunities_label  = LABEL_TIP,
    immunities_name   = 'The immunity names, like Sleep.',
    immunities_detail = 'The commas between them.',
    elements_label    = 'The label, its label divider, and the Weak and Resists words.',
    elements_weak     = 'The elements the monster is weak to.',
    elements_resist   = 'The elements the monster resists.',
    weapons_label    = 'The Weapons label, the Weak and Resists words, and their label dividers.',
    weapons_weak     = 'Damage types that do more damage and their signed percentages.',
    weapons_resist   = 'Damage types that do less damage and their signed percentages.',
    weapons_detail   = 'The commas, the divider between the lists, and the ? when a script can change these values.',
    elements_detail   = 'How strong each one is, like "(half)", the commas, the dividers, the magic damage note and '
        .. 'the "?".',
    drops_label       = LABEL_TIP,
    drops_name        = 'The item names.',
    drops_number      = 'Each item\'s chance.',
    drops_detail      = 'The small extras, like "(TH 2)", the commas, "+2 more" and the drop notes.',
    steal_label       = LABEL_TIP,
    steal_name        = 'The item names.',
    steal_number      = 'Your chance to steal, like 77%.',
    steal_detail      = 'The small extras, like the parentheses around the chance, the commas and "or" between items, '
        .. '"nothing" and "unknown".',
    pet_label         = 'The label, its label divider, and the Hit and Evade words with their label dividers.',
    pet_name          = 'Your pet\'s name.',
    pet_level         = 'Your pet\'s level after its name, like (Lv 75).',
    pet_number        = 'Your pet\'s numbers while grade colors are off. With them on, the Grades colors paint them.',
    pet_detail        = 'The dividers inside the part, "unknown" and the "?" after a number.',
    good              = 'Hit rate, off-hand, ranged, evade, crit and pet numbers at or above the good cutoff on the '
        .. 'Numbers tab, and crit taken at or below its own.',
    ok                = 'Numbers at or above the OK cutoff but under the good one. Crit taken goes the other way.',
    bad               = 'Numbers under the OK cutoff, or crit taken over its OK cutoff.',
};

-- The overlay's element badges.
for _, group in ipairs(printout.COLOR_GROUPS) do
    if (group.name == 'Element badges') then
        for _, color in ipairs(group.colors) do
            COLOR_TIPS[color.key] = ('The %s badge in the overlay. It shows with Element look set to Colored badges '
                .. 'on the Display tab, or when that element\'s game picture won\'t load.'):format(color.label);
        end
    end
end

-- Each con color paints its con while Color by difficulty is on.
for _, group in ipairs(printout.COLOR_GROUPS) do
    for _, color in ipairs(group.colors) do
        if (COLOR_TIPS[color.key] == nil) then
            COLOR_TIPS[color.key] = ('%s while Color by difficulty is on.'):format(color.label);
        end
    end
end

-- What each window color paints, by key.
local WINDOW_COLOR_TIPS = {
    text                    = 'Most of the window\'s text, and the words in the overlay\'s tips.',
    faded_text              = 'The subtitle, the (?) marks and "No profiles yet".',
    headings                = 'The section headings, like SKIN.',
    notes                   = 'The short notes some tabs show, like when a part is off.',
    done_messages           = 'What the Profiles tab says after an action worked.',
    problem_messages        = 'What the Profiles tab says when an action didn\'t work, the note about a font that '
        .. 'won\'t load, and the Abbreviations tab\'s notes about two words that print the same.',
    selected_text           = 'The highlight behind text you select in a text box.',
    text_cursor             = 'The cursor in a text box.',
    background              = 'The window\'s background, and the overlay\'s.',
    border                  = 'The line around the window and the overlay.',
    title_bar               = 'The title bar while you\'re using this window.',
    title_bar_unfocused     = 'The title bar while you\'re using another window.',
    dropdowns               = 'The list a dropdown opens, these tips and the overlay\'s tips.',
    table_headers           = 'The row of names over a table, like the one over the parts.',
    heading_lines           = 'The line under each heading.',
    resize_corner           = 'The corner at the bottom right you drag to resize the window, and the overlay\'s corner '
        .. 'while you hold Shift.',
    resize_corner_hovered   = 'That corner while the mouse is over it.',
    resize_corner_held      = 'That corner while you drag it.',
    scrollbar_track         = 'The scrollbar\'s track.',
    scrollbar               = 'The scrollbar.',
    scrollbar_hovered       = 'The scrollbar while the mouse is over it.',
    scrollbar_held          = 'The scrollbar while you drag it.',
    boxes                   = 'Checkboxes, text boxes, sliders and dropdowns.',
    boxes_hovered           = 'A box while the mouse is over it.',
    boxes_clicked           = 'A box while you hold the mouse button down on it.',
    check_marks             = 'The tick in a checkbox.',
    slider_handles          = 'The handle you drag on a slider.',
    slider_handles_held     = 'A slider\'s handle while you drag it.',
    buttons                 = 'The buttons, like Print a sample.',
    buttons_hovered         = 'A button while the mouse is over it.',
    buttons_pressed         = 'A button while you hold the mouse button down on it.',
    row_picked              = 'The picked row in a list, like the profile you picked.',
    row_hovered             = 'A row while the mouse is over it.',
    row_clicked             = 'A row while you hold the mouse button down on it.',
    tabs                    = 'The tabs you aren\'t on.',
    tabs_hovered            = 'A tab while the mouse is over it.',
    open_tab                = 'The tab you\'re on.',
    open_tab_line           = 'The line over the tab you\'re on.',
    tabs_unfocused          = 'The tabs you aren\'t on, while you\'re using another window.',
    open_tab_unfocused      = 'The tab you\'re on, while you\'re using another window.',
    open_tab_line_unfocused = 'The line over the tab you\'re on, while you\'re using another window.',
};

-- The skin list's tip, with the picked skin's own tip after it when it has one.
local SKIN_TIPS = {};
for _, skin in ipairs(skins.LIST) do
    SKIN_TIPS[skin.id] = (skin.tip ~= nil) and (TIPS.skin .. ' ' .. skin.tip) or TIPS.skin;
end

local open = { false };
local result = { save = false, sample = false, edited = false };
local look = nil;         -- Your window look this frame.
local scale = 1;          -- The font size this frame over BASE_FONT_SIZE.
local window_width = 0;   -- The window's width this frame.
local stacked = true;     -- True while a tab's sections stack in one column.
local place_now = false;  -- True when the next frame moves the window to its saved spot and size.
local help_width = 0;     -- How much a (?) adds after a setting, this frame.

-- Reused one-slot tables for ImGui widgets that edit a value in place.
local number = { 0 };
local flag = { false };
local text = { '' };
local swatch_size = { 0, 0 };

-- Reused sizes and spots that follow the font size, the screen and your look settings, set each frame.
local min_size = { 0, 0 };
local list_size = { -1, 0 };
local item_spacing = { ITEM_GAP, 0 };
local spot = { 0, 0 };
local extent = { 0, 0 };

-- The Profiles tab's name box, the profile picked in its list, and the last action's message.
local profile_name = { '' };
local picked = nil;
local status = nil;
local status_ok = true;

function settings_window.is_open()
    return open[1];
end

-- Opening the window reads profiles.json again, since another character can change it.
function settings_window.set_open(value)
    open[1] = value;
    if (value) then
        profiles.refresh();
        status = nil;
    end
end

--[[
    Style.
]]

local function push_style()
    local colors = 0;
    for _, entry in ipairs(skins.WINDOW_COLORS) do
        local color = look[entry.key];
        if (entry.paints ~= nil and type(color) == 'table') then
            imgui.PushStyleColor(entry.paints, color);
            colors = colors + 1;
        end
    end
    local rounding = tonumber(look.rounding) or 0;
    for _, id in ipairs(ROUNDED) do
        imgui.PushStyleVar(id, rounding);
    end
    for _, entry in ipairs(FIXED_SIZES) do
        imgui.PushStyleVar(entry[1], entry[2]);
    end
    item_spacing[2] = tonumber(look.spacing) or 7;
    imgui.PushStyleVar(ImGuiStyleVar_ItemSpacing, item_spacing);
    return colors, #ROUNDED + #FIXED_SIZES + 1;
end

local function round(value)
    return math.floor(value + 0.5);
end

-- A layout size in pixels, grown or shrunk with the font size.
local function px(size)
    return round(size * scale);
end

-- The width of the widest of `texts` in this frame's font.
local function widest(texts)
    local width = 0;
    for _, each in ipairs(texts) do
        width = math.max(width, (imgui.CalcTextSize(each)));
    end
    return width;
end

--[[
    Sections. A tab's sections sit side by side when the window is wide enough for two, and stack in
    one column when it isn't. That goes by the whole window's width. The room left inside shrinks when
    a scrollbar shows up, and that would flip it back and forth.
]]

-- Starts a tab's sections. Each imgui.TableNextColumn() moves on to the next one.
local function begin_sections(id)
    settings_window.layout_width = nil;
    imgui.PushStyleVar(ImGuiStyleVar_CellPadding, SECTION_PADDING);
    local shown = imgui.BeginTable(id, stacked and 1 or 2, ImGuiTableFlags_SizingStretchSame);
    imgui.PopStyleVar(1);
    return shown;
end

-- How wide one section is, worked out from the window's width.
local function section_width()
    if (settings_window.layout_width ~= nil) then return settings_window.layout_width; end
    local inside = window_width - WINDOW_EDGES;
    if (stacked) then
        return inside;
    end
    return (inside - COLUMN_GAP) / 2;
end

-- The next widget measures its whole row before deciding whether it fits beside this one.
local function beside(at)
    settings_window.pending_row = {
        at = at and px(at) - WINDOW_PADDING[1] or nil,
        left = imgui.GetCursorScreenPos(),
        edge = imgui.GetItemRectMax(),
    };
end

function settings_window.place_control(label, width, tip)
    local pending = settings_window.pending_row;
    settings_window.pending_row, settings_window.joined = nil, false;
    if (pending == nil) then return; end
    local shown = tostring(label or ''):match('^(.-)##') or tostring(label or '');
    local needed = width + (shown ~= '' and (INNER_GAP + imgui.CalcTextSize(shown)) or 0)
        + (tip and help_width or 0);
    local start = math.max(pending.edge + ITEM_GAP, pending.left + (pending.at or 0));
    if (start + needed <= pending.left + section_width() - COLUMN_GAP) then
        imgui.SameLine(0, start - pending.edge);
        settings_window.joined = true;
    end
end

function settings_window.flow_button(label, tip)
    beside();
    settings_window.place_control('', imgui.CalcTextSize(label) + 2 * FRAME_PADDING[1], tip);
end

--[[
    Widgets. Each edits one setting in place, and most take the tip for the (?) after them. A widget
    with `off` set is greyed out, and its (?) still works.
]]

-- A (?) where the cursor is. Hovering it shows the tip, even next to a setting that's greyed out.
local function help_mark(tip)
    imgui.TextDisabled(HELP_MARK);
    if (imgui.IsItemHovered(ImGuiHoveredFlags_AllowWhenDisabled)) then
        imgui.BeginTooltip();
        imgui.PushTextWrapPos(px(TIP_WIDTH));
        imgui.TextUnformatted(tip);
        imgui.PopTextWrapPos();
        imgui.EndTooltip();
    end
end

-- A (?) at the start of a table cell, level with the controls in the row.
local function cell_help(tip)
    search.mark('', tip);
    imgui.AlignTextToFramePadding();
    help_mark(tip);
end

-- A (?) right after the last thing drawn. A nil tip draws nothing.
local function help(tip, label)
    if (tip ~= nil) then
        search.mark(label, tip);
        imgui.SameLine();
        help_mark(tip);
    end
end
settings_window.control_help = help;

local function hover_help(tip)
    if (imgui.IsItemHovered(ImGuiHoveredFlags_AllowWhenDisabled)) then
        imgui.BeginTooltip();
        imgui.PushTextWrapPos(px(TIP_WIDTH));
        imgui.TextUnformatted(tip);
        imgui.PopTextWrapPos();
        imgui.EndTooltip();
    end
end

local function heading(title, tip)
    imgui.Spacing();
    imgui.TextColored(look.headings, title);
    help(tip);
    imgui.Separator();
end

-- Wraps at the edge of its section.
local function note(words, color)
    imgui.PushStyleColor(ImGuiCol_Text, color or look.notes);
    imgui.PushTextWrapPos(0);
    imgui.TextUnformatted(words);
    imgui.PopTextWrapPos();
    imgui.PopStyleColor(1);
end

-- Search opens folded groups until it is cleared, then puts their previous state back.
function settings_window.section_open(title, tip, default_open)
    settings_window.folded = settings_window.folded or {};
    local key = (settings_window.page_name or '') .. '/' .. title;
    local saved = settings_window.folded[key];
    local searching = settings_window.query_text ~= nil and settings_window.query_text ~= '';
    if (searching or saved ~= nil) then imgui.SetNextItemOpen(searching or saved, ImGuiCond_Always); end
    imgui.Spacing();
    imgui.PushStyleColor(ImGuiCol_Text, look.headings);
    local shown = imgui.CollapsingHeader(title, default_open == false and 0 or ImGuiTreeNodeFlags_DefaultOpen);
    imgui.PopStyleColor(1);
    search.mark(title, tip);
    if (tip ~= nil and imgui.IsItemHovered()) then
        imgui.BeginTooltip();
        imgui.PushTextWrapPos(px(TIP_WIDTH));
        imgui.TextUnformatted(tip);
        imgui.PopTextWrapPos();
        imgui.EndTooltip();
    end
    if (not searching) then settings_window.folded[key] = shown; end
    return shown;
end

-- A short note when a part these settings belong to is off in the chat printout, and in the overlay too while
-- that's on.
local function part_off_note(settings, id)
    local o = settings.overlay;
    if (not settings.printout.parts[id].on and not (o.on == true and o.parts[id] == true)) then
        if (o.parts[id] == true and o.on ~= true) then
            note(('%s is selected for the overlay. Turn on the overlay to see it.'):format(PART_NAMES[id]));
        elseif (overlay.is_part(id)) then
            note(('Enable %s in Display to show it.'):format(PART_NAMES[id]));
        else
            note(('Enable %s in Display for chat to show it.'):format(PART_NAMES[id]));
        end
    end
end

-- Text that lines up with the controls beside it.
local function cell_text(words)
    imgui.AlignTextToFramePadding();
    imgui.TextUnformatted(words);
    search.mark(words);
end

-- Saves once a slider, text box or color picker is let go of.
local function save_when_done()
    if (imgui.IsItemDeactivatedAfterEdit()) then
        result.save = true;
    end
end

local function checkbox(label, table_, key, tip, off)
    settings_window.place_control(label, imgui.GetFrameHeight(), tip);
    imgui.BeginDisabled(off == true);
    flag[1] = table_[key] == true;
    if (imgui.Checkbox(label, flag)) then
        table_[key] = flag[1];
        result.save = true;
    end
    imgui.EndDisabled();
    help(tip, label);
end

-- These are the same switches as the Display rows.
local function display_switches(settings, id)
    imgui.PushID(id);
    checkbox('In chat', settings.printout.parts[id], 'on', 'Shows ' .. PART_NAMES[id] .. ' in your /check printout.');
    beside(SECOND_COLUMN);
    checkbox('In overlay', settings.overlay.parts, id, 'Shows ' .. PART_NAMES[id] .. ' while the overlay is on.',
        not overlay.is_part(id));
    imgui.PopID();
end

-- `draw` is imgui.SliderInt or imgui.SliderFloat. `width` is in pixels as drawn, CONTROL_WIDTH by default.
local function slider(draw, label, table_, key, low, high, format, tip, off, width)
    settings_window.place_control(label, width or px(CONTROL_WIDTH), tip);
    imgui.BeginDisabled(off == true);
    number[1] = table_[key];
    imgui.SetNextItemWidth(width or px(CONTROL_WIDTH));
    if (draw(label, number, low, high, format, ImGuiSliderFlags_AlwaysClamp)) then
        table_[key] = number[1];
        result.edited = true;
    end
    save_when_done();
    imgui.EndDisabled();
    help(tip, label);
end

-- A label or custom divider box. Anything outside printable ASCII is dropped as you type.
local function text_box(label, table_, key, width, size, tip, off)
    settings_window.place_control(label, width, tip);
    imgui.BeginDisabled(off == true);
    text[1] = table_[key] or '';
    imgui.SetNextItemWidth(width);
    if (imgui.InputText(label, text, size + 1)) then
        table_[key] = printout.clean_text(text[1]);
        result.edited = true;
    end
    save_when_done();
    imgui.EndDisabled();
    help(tip, label);
end

-- A dropdown of fixed choices.
local function choice(label, table_, key, choices, tip, off)
    settings_window.place_control(label, px(CONTROL_WIDTH), tip);
    imgui.BeginDisabled(off == true);
    local shown = choices[1].name;
    for _, option in ipairs(choices) do
        if (option.id == table_[key]) then
            shown = option.name;
        end
    end
    imgui.SetNextItemWidth(px(CONTROL_WIDTH));
    if (imgui.BeginCombo(label, shown)) then
        for _, option in ipairs(choices) do
            if (imgui.Selectable(option.name, option.id == table_[key])) then
                table_[key] = option.id;
                result.save = true;
            end
        end
        imgui.EndCombo();
    end
    imgui.EndDisabled();
    help(tip, label);
end

local function swatch(id, code)
    imgui.ColorButton(id, SWATCHES[code], SWATCH_FLAGS, swatch_size);
end

-- A chat color from the fixed palette, shown as a swatch and its name. 0, 10 and 13 are never offered.
local function chat_color(label, table_, key, tip)
    local current = printout.safe_color(table_[key]);
    swatch('##swatch' .. label, current);
    imgui.SameLine(0, INNER_GAP);
    imgui.SetNextItemWidth(px(COLOR_WIDTH));
    if (imgui.BeginCombo(label, PALETTE_NAMES[current])) then
        for _, entry in ipairs(printout.PALETTE) do
            swatch('##' .. entry.code, entry.code);
            imgui.SameLine();
            if (imgui.Selectable(entry.name, entry.code == current)) then
                table_[key] = entry.code;
                result.save = true;
            end
        end
        imgui.EndCombo();
    end
    help(tip, label);
end

-- A window color. The picker edits the color table in place.
local function window_color(label, table_, key, tip)
    if (type(table_[key]) == 'table') then
        imgui.ColorEdit4(label, table_[key], COLOR_FLAGS);
        save_when_done();
        help(tip, label);
    end
end

local function sample_button(tip)
    imgui.Spacing();
    if (imgui.Button('Print a sample')) then
        result.sample = true;
    end
    help(tip);
end

--[[
    Display tab.
]]

-- One column puts two controls to a line. Side by side, each section has room for one. A word box is greyed
-- while the chat printout doesn't show its note, and the overlay doesn't either while that's on.
local function draw_name_section(settings)
    local ps, o = settings.printout, settings.overlay;
    local overlay_on = o.on == true;
    heading('NAME AND LEVEL');
    local name = ps.parts.name;
    checkbox('Show the name##name', name, 'on', TIPS.show_name);
    beside(SECOND_COLUMN);
    text_box('Label##name', name, 'label', px(LABEL_WIDTH), LABEL_MAX, TIPS.name_label);
    checkbox('Show level', ps, 'show_level', TIPS.show_level);
    beside(SECOND_COLUMN);
    checkbox('Show its level range too', ps, 'show_range', TIPS.show_range, not ps.show_level);
    -- The range word sits under Show its level range too. The second column counts from the window's
    -- edge, and an indent from inside its padding.
    local indent = settings_window.joined and (px(SECOND_COLUMN) - WINDOW_PADDING[1]) or 0;
    if (indent > 0) then imgui.Indent(indent); end
    text_box('Range word', ps, 'range_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.range_word,
        not (ps.show_level and ps.show_range) and not (overlay_on and o.show_level == true and o.show_range == true));
    if (indent > 0) then imgui.Unindent(indent); end
    checkbox('Show its ID', ps, 'show_id', TIPS.show_id);
    beside(SECOND_COLUMN);
    text_box('ID word', ps, 'id_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.id_word,
        not ps.show_id and not (overlay_on and o.show_id == true));
    checkbox('Show if it\'s a PH', ps, 'show_ph', TIPS.show_ph);
    beside(SECOND_COLUMN);
    text_box('PH word', ps, 'ph_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.ph_word,
        not ps.show_ph and not (overlay_on and o.show_ph == true));
end

-- The Up and Down arrows of one part. The first can't go up and the last can't go down.
local function move_buttons(ps, id, index, count)
    imgui.BeginDisabled(index == 1);
    if (imgui.ArrowButton('##up', ImGuiDir_Up)) then
        ps.order = printout.move(ps.order, id, -1);
        result.save = true;
    end
    imgui.EndDisabled();
    imgui.SameLine();
    imgui.BeginDisabled(index == count);
    if (imgui.ArrowButton('##down', ImGuiDir_Down)) then
        ps.order = printout.move(ps.order, id, 1);
        result.save = true;
    end
    imgui.EndDisabled();
end

local function draw_lines_section(ps)
    heading('LINES');
    checkbox('[checkmate] at the start of each line', ps, 'header', TIPS.header);
    choice('Divider', ps, 'divider', printout.DIVIDERS, TIPS.divider);
    if (ps.divider == 'custom') then
        beside();
        text_box('Custom text', ps, 'separator', px(SMALL_WIDTH), SEPARATOR_MAX, TIPS.custom);
    end
    choice('Label divider', ps, 'label_divider', printout.LABEL_DIVIDERS, TIPS.label_divider);
    if (ps.label_divider == 'custom') then
        beside();
        text_box('Custom text##label', ps, 'label_separator', px(SMALL_WIDTH), SEPARATOR_MAX, TIPS.custom_label);
    end
    choice('Number ranges', ps, 'number_style', NUMBER_STYLES, TIPS.number_style);
    checkbox('Element icons', ps, 'icons', TIPS.icons);
    beside(SECOND_COLUMN);
    checkbox('Icons only', ps, 'icons_only', TIPS.icons_only, ps.icons ~= true);
    checkbox('Replace the game\'s /check line', ps, 'replace_game_line', TIPS.replace);
    sample_button(TIPS.sample);
end

--[[
    Appearance tab. Each heading's colors sit two to a row when they fit, or one to a row when a name is too
    long to share or the section too narrow.
]]

-- Longest color name, in characters, that still fits two to a row, and the narrowest its column gets.
local PAIR_NAME_MAX   = 8;
local PAIR_NAME_WIDTH = 72;

-- The Appearance tab's second section starts at this heading.
local COLORS_SPLIT = 'Aggro';

-- True when every one of a heading's color names is short enough to sit two to a row.
local function fits_two(group)
    for _, color in ipairs(group.colors) do
        if (#color.label > PAIR_NAME_MAX) then
            return false;
        end
    end
    return true;
end

-- The names under the headings that sit two to a row, and every color name. A column of names is as
-- wide as the widest of them, so the headings line up with each other in any font.
local PAIR_NAMES = {};
local COLOR_NAMES = {};
for _, group in ipairs(printout.COLOR_GROUPS) do
    for _, color in ipairs(group.colors) do
        COLOR_NAMES[#COLOR_NAMES + 1] = color.label;
        if (fits_two(group)) then
            PAIR_NAMES[#PAIR_NAMES + 1] = color.label;
        end
    end
end

-- The switch above a heading's colors, by heading. Each is its label, settings section, key and tip.
local COLOR_SWITCHES = {
    ['Difficulty'] = { 'Color by difficulty', 'printout', 'con_colors', TIPS.con_colors },
    ['Aggro']      = { 'Color by threat', 'aggro', 'threat_colors', TIPS.threat_colors },
    ['Grades']     = { 'Color by grade', 'grades', 'on', TIPS.grades },
};

-- A short note under a heading, by heading.
local COLOR_NOTES = {
    ['Element badges'] = 'Only the overlay draws these, as its colored badges. They never print in chat.',
};

-- How wide a color's swatch, list and (?) are, with a gap after them so the next color's name stands
-- apart from the (?).
local function color_column_width()
    return swatch_size[1] + INNER_GAP + px(COLOR_WIDTH) + help_width + CELL_GAP;
end

-- True when two colors fit side by side in a section, each with its name, swatch, list and (?).
local function colors_pair_up(pair_width)
    return section_width() >= 2 * (pair_width + color_column_width()) + 3 * CELL_GAP;
end

local function color_group(settings, group, pair_up, pair_width, name_width)
    if (not settings_window.section_open(group.name:upper())) then return; end
    local switch = COLOR_SWITCHES[group.name];
    if (switch ~= nil) then
        checkbox(switch[1], settings[switch[2]], switch[3], switch[4]);
    end
    if (COLOR_NOTES[group.name] ~= nil) then
        note(COLOR_NOTES[group.name]);
    end
    local per_row = (pair_up and fits_two(group)) and 2 or 1;
    local width = (per_row == 2) and pair_width or name_width;
    if (imgui.BeginTable('##' .. group.name, per_row * 2, TABLE_FLAGS)) then
        for _ = 1, per_row do
            imgui.TableSetupColumn('', ImGuiTableColumnFlags_WidthFixed, width);
            imgui.TableSetupColumn('', ImGuiTableColumnFlags_WidthFixed, color_column_width());
        end
        for _, color in ipairs(group.colors) do
            imgui.TableNextColumn();
            cell_text(color.label);
            imgui.TableNextColumn();
            chat_color('##' .. color.key, settings.colors, color.key, COLOR_TIPS[color.key]);
        end
        imgui.EndTable();
    end
end

local function draw_colors_tab(settings)
    settings_window.layout_width = nil;
    local pair_width = math.max(px(PAIR_NAME_WIDTH), widest(PAIR_NAMES));
    local name_width = widest(COLOR_NAMES);
    local pair_up = colors_pair_up(pair_width);
    if (begin_sections('##color_sections')) then
        imgui.TableNextColumn();
        for _, group in ipairs(printout.COLOR_GROUPS) do
            if (group.name == COLORS_SPLIT) then
                imgui.TableNextColumn();
            end
            color_group(settings, group, pair_up, pair_width, name_width);
        end
        sample_button(TIPS.sample_colors);
        imgui.EndTable();
    end
end

--[[
    Numbers tab.
]]

-- Each cutoff table's name column is as wide as the widest name in both, so their sliders line up.
local function draw_cutoffs_section(settings)
    local grades = settings.grades;
    heading('CUTOFFS');
    local off = not grades.on;
    if (off) then
        note('Grade colors are off, so turn them on in the Appearance tab to use these.');
    end
    local name_width = 0;
    for _, each in ipairs(CUTOFFS) do
        for _, row in ipairs(each.rows) do
            name_width = math.max(name_width, (imgui.CalcTextSize(row[1])));
        end
    end
    for _, each in ipairs(CUTOFFS) do
        if (imgui.BeginTable(each.id, 3, TABLE_FLAGS)) then
            imgui.TableSetupColumn('', ImGuiTableColumnFlags_WidthFixed, name_width);
            imgui.TableSetupColumn(each.good);
            imgui.TableSetupColumn(each.ok);
            imgui.TableHeadersRow();
            for _, row in ipairs(each.rows) do
                local good, ok = row[2] .. '_good', row[2] .. '_ok';
                imgui.TableNextRow();
                imgui.TableNextColumn();
                cell_text(row[1]);
                imgui.TableNextColumn();
                slider(imgui.SliderInt, '##' .. good, grades, good, 0, printout.CUTOFF_MAX, '%d%%', nil, off,
                    px(CUTOFF_WIDTH));
                imgui.TableNextColumn();
                slider(imgui.SliderInt, '##' .. ok, grades, ok, 0, printout.CUTOFF_MAX, '%d%%', TIPS[each.tip], off,
                    px(CUTOFF_WIDTH));
            end
            imgui.EndTable();
        end
    end
end

local function draw_pet_section(settings)
    local p = settings.pet;
    heading('PET', TIPS.pet);
    display_switches(settings, 'pet');
    checkbox('Show its name', p, 'show_name', TIPS.pet_name);
    beside(SECOND_COLUMN);
    checkbox('Show its level', p, 'show_level', TIPS.pet_level, not p.show_name);
    text_box('Hit word', p, 'hit_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.pet_hit_word);
    beside();
    text_box('Evade word', p, 'evade_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.pet_evade_word);
end

local function draw_ranged_section(settings)
    heading('RANGED');
    part_off_note(settings, 'ranged');
    checkbox('Show it outside the sweet spot too', settings.ranged, 'show_far', TIPS.ranged_far);
    checkbox('Show current distance', settings.ranged, 'show_distance',
        'Adds your distance when the /check reply arrived, in yalms. The hit chance still uses the sweet spot, '
        .. 'not a rate measured at that distance.');
end

function settings_window.draw_pdif_section(settings)
    heading('PDIF', PART_TIPS.pdif);
    display_switches(settings, 'pdif');
    choice('pDIF display', settings.pdif, 'mode', settings_window.PDIF_MODES, TIPS.pdif_mode);
    note('Normal noncritical hits only. The multiplier range is separate from the Attack/Defense ratio.');
    heading('OFF-HAND PDIF', PART_TIPS.offhandpdif);
    display_switches(settings, 'offhandpdif');
    heading('RANGED PDIF', PART_TIPS.rangedpdif);
    display_switches(settings, 'rangedpdif');
end

local function draw_numbers_tab(settings)
    if (settings_window.section_open('OFFENSE')) then
        for _, id in ipairs({ 'hit', 'offhand', 'ranged', 'crit' }) do
            heading(PART_NAMES[id]:upper(), PART_TIPS[id]);
            display_switches(settings, id);
        end
        draw_ranged_section(settings);
        settings_window.draw_pdif_section(settings);
    end
    if (settings_window.section_open('DEFENSE')) then
        for _, id in ipairs({ 'evade', 'crittaken', 'block', 'parry' }) do
            heading(PART_NAMES[id]:upper(), PART_TIPS[id]);
            display_switches(settings, id);
        end
    end
    if (settings_window.section_open('ADVANCED', 'Grade cutoffs and your critical-hit merit inputs.', false)) then
        local m = settings.merits;
        draw_cutoffs_section(settings);
        heading('CRITICAL HIT RATE');
        slider(imgui.SliderInt, '##crit_merits', m, 'crit_hit_rate', 0, physical.MERITS.crit_hit_rate.most,
            (m.crit_hit_rate == 1) and '%d merit' or '%d merits', TIPS.crit_merits);
        heading('ENEMY CRITICAL HIT RATE');
        slider(imgui.SliderInt, '##enemy_crit_merits', m, 'enemy_crit_rate', 0, physical.MERITS.enemy_crit_rate.most,
            (m.enemy_crit_rate == 1) and '%d merit' or '%d merits', TIPS.enemy_crit_merits);
        checkbox('Fill both in when you zone', m, 'fill_in', TIPS.merit_fill);
    end
end

--[[
    Aggro tab.
]]


local function draw_aggro_tab(settings)
    local a, links = settings.aggro, settings.links;
    if (begin_sections('##aggro_sections')) then
        imgui.TableNextColumn();
        heading('AGGRESSIVE', TIPS.aggressive);
        part_off_note(settings, 'aggro');
        checkbox('Show how it finds you', a, 'detection', TIPS.detection);
        heading('PURSUIT');
        display_switches(settings, 'pursuit');
        note('Pursuit has its own display row. Detection describes how it first notices you.');
        imgui.TableNextColumn();
        heading('LINKS');
        part_off_note(settings, 'links');
        -- First, so it sits next to Show how it finds you.
        checkbox('Show how each one links', links, 'link_how', TIPS.link_how);
        checkbox('Show the names it links with', links, 'link_names', TIPS.link_names);
        checkbox('Group names by family', links, 'group_families', TIPS.group_families, not links.link_names);
        slider(imgui.SliderInt, 'Most entries shown', links, 'max_links', 0, aggro.MAX_LINKS,
            links.max_links == 0 and 'All' or '%d', TIPS.max_links, not links.link_names);
        imgui.EndTable();
    end
end

--[[
    Magic tab.
]]

local function draw_schools_section(settings, blue_only)
    local m = settings.magic;
    heading(blue_only and 'SPELL CHANCE' or 'SCHOOLS', TIPS.schools);
    part_off_note(settings, blue_only and 'blue' or 'magic');
    if (imgui.BeginTable('##schools', 2, TABLE_FLAGS)) then
        imgui.TableSetupColumn('School');
        imgui.TableSetupColumn('Stand-in spell', STRETCH);
        imgui.TableHeadersRow();
        for _, id in ipairs(spells.SCHOOL_ORDER) do
            if ((id == 'blue') == (blue_only == true)) then
                imgui.PushID(id);
                imgui.TableNextRow();
                imgui.TableNextColumn();
                checkbox(spells.schools[id].label, m.schools[id], 'on');
                imgui.TableNextColumn();
                -- The stand-in spell. A school with one spell has nothing to pick.
                local list = spells.schools[id].spells;
                choice('##spell', m.schools[id], 'spell', list, SCHOOL_TIPS[id], #list == 1);
                imgui.PopID();
            end
        end
        imgui.EndTable();
    end

    if (blue_only) then
        note('This is your spell chance, not a chance to learn a spell. It appears in the Blue Magic row.');
        note('The extra magic accuracy settings on Magic apply here too.');
        return;
    end

    heading('EXTRA MAGIC ACCURACY');
    checkbox('Include known gear and merits', m, 'known_inputs',
        'Includes the direct magic accuracy bonuses checkmate can read from supported gear and merits. '
        .. 'With this on, enter only your remaining bonus below. With it off, enter your entire direct bonus. '
        .. 'Skills and attributes are counted either way.');
    slider(imgui.SliderInt, '##extra_accuracy', m, 'extra_accuracy', 0, magic.EXTRA_ACCURACY_MAX, '+%d',
        TIPS.extra_accuracy);
    note(m.known_inputs and 'Enter only the bonus not already counted from known gear and merits.'
        or 'Enter your entire direct magic accuracy bonus.');
end

local function draw_elements_section(settings)
    local e = settings.elements;
    heading('ELEMENTS', TIPS.elements);

    text_box('Weak word', e, 'weak_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.weak_word);
    beside();
    text_box('Resists word', e, 'resist_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.resist_word);
    checkbox('Show how strong each one is', e, 'strength', TIPS.strength);
    checkbox('Show script warning', e, 'script_mark', TIPS.elementmark);
end

local function draw_magic_tab(settings)
    draw_schools_section(settings);
    note('Blue Magic has its own tab.');
end

--[[
    Blue Magic and Monster tabs.
]]


function settings_window.draw_blue_tab(settings)
    heading('BLUE MAGIC');
    display_switches(settings, 'blue');
    note('Possible lessons and the optional spell chance share this row. Choose each for chat and overlay.');
    if (imgui.BeginTable('##blue_components', 3, TABLE_FLAGS)) then
        imgui.TableSetupColumn('Component', STRETCH);
        imgui.TableSetupColumn('Chat');
        imgui.TableSetupColumn('Overlay');
        imgui.TableHeadersRow();
        imgui.PushID('components');
        for _, item in ipairs({ { 'lessons', 'Learnable spells', PART_TIPS.blue },
            { 'chance', 'Spell chance', SCHOOL_TIPS.blue } }) do
            imgui.PushID(item[1]);
            imgui.TableNextRow(); imgui.TableNextColumn(); cell_text(item[2]);
            imgui.TableNextColumn(); checkbox('##chat', settings.blue.chat, item[1], item[3]);
            imgui.TableNextColumn(); checkbox('##overlay', settings.blue.overlay, item[1], item[3]);
            imgui.PopID();
        end
        imgui.PopID();
        imgui.EndTable();
    end
    checkbox('Only unlearned spells', settings.blue, 'only_unlearned',
        'Hides lessons your client says you already know. Unknown spellbook entries stay visible. Spell chance is unchanged.');
    checkbox('Show learning requirements', settings.blue, 'requirements',
        'Shows the required Blue Magic skill and the job, skill, HP and distance read with the result. '
        .. 'Find them in hover help and Target details. Conditions are checked again on defeat.');
    checkbox('Show observed move use', settings.blue, 'seen',
        'Marks a move when checkmate sees this monster finish using it. Not observed means it may have happened out of view. '
        .. 'The marker clears when the monster disappears. It does not confirm learning eligibility.');
    heading('STAND-IN SPELL');
    choice('Spell', settings.magic.schools.blue, 'spell', spells.schools.blue.spells, SCHOOL_TIPS.blue,
        #spells.schools.blue.spells == 1);
    note('The extra magic accuracy settings on Magic apply here too. Spell chance is not a learning chance.');
    require('ui.blue_finder').draw(settings);
end

function settings_window.draw_monster_tab(settings)
    note('Each category has its own row, label, order and line break in Display.');
    if (imgui.BeginTable('##monster_sections', 3, TABLE_FLAGS)) then
        imgui.TableSetupColumn('Category', STRETCH);
        imgui.TableSetupColumn('Chat');
        imgui.TableSetupColumn('Overlay');
        imgui.TableHeadersRow();
        for _, section in ipairs(settings_window.INFO_SECTIONS) do
            if (section[4] == nil) then
                imgui.PushID(section[1]);
                imgui.TableNextRow(); imgui.TableNextColumn();
                imgui.AlignTextToFramePadding();
                note(section[2]);
                help(section[3], section[2]);
                imgui.TableNextColumn();
                checkbox('##chat', settings.printout.parts[section[1]], 'on', 'Shows ' .. section[2] .. ' in your /check printout.');
                imgui.TableNextColumn();
                checkbox('##overlay', settings.overlay.parts, section[1], 'Shows ' .. section[2] .. ' while the overlay is on.');
                imgui.PopID();
            end
        end
        imgui.EndTable();
    end
    note('Pursuit is on Aggro, Charm is on Weaknesses, and Blue Magic has its own tab.');
    heading('DANGERS DISPLAY');
    if (begin_sections('##danger_filters')) then
        for _, id in ipairs(dangers.CATEGORIES) do
            imgui.TableNextColumn();
            checkbox(dangers.LABELS[id], settings.dangers, id,
                'Shows matching moves in chat, the overlay and Target details. A move with several categories stays visible '
                .. 'if any of them is selected. Copy details keeps every listed move.');
        end
        imgui.EndTable();
    end
    slider(imgui.SliderInt, 'Most danger moves shown', settings.dangers, 'max_moves', 0, dangers.MAX_MOVES,
        settings.dangers.max_moves == 0 and 'All' or '%d',
        'Limits the moves in chat and the overlay, followed by + more. Zero shows all matching moves. '
        .. 'Target details keeps every move and its conditions.');
    settings_window.draw_target_details(settings);
end

local function draw_drops_tab(settings)
    local d = settings.drops;
    if (begin_sections('##drops_sections')) then
        imgui.TableNextColumn();
        heading('TREASURE HUNTER');
        part_off_note(settings, 'drops');
        slider(imgui.SliderInt, '##th', d, 'th', 0, drops.TH_MAX, 'TH %d', TIPS.th);
        imgui.TableNextColumn();
        heading('LIST');
        slider(imgui.SliderInt, 'Most items shown', d, 'max_items', 0, drops.MAX_ITEMS,
            d.max_items == 0 and 'All' or '%d', TIPS.max_items);
        slider(imgui.SliderFloat, 'Hide items under', d, 'min_chance', 0, drops.MIN_CHANCE_MAX, '%.1f%%',
            TIPS.min_chance);
        choice('Order', d, 'sort', SORTS, TIPS.order);
        checkbox('Treasure Hunter in the label', d, 'th_in_label', TIPS.th_in_label);
        checkbox('Drop notes', d, 'notes', TIPS.drop_notes);
        imgui.EndTable();
    end
end

--[[
    Weaknesses and Effects tabs.
]]

-- The immunity's tip, after what it covers when its name doesn't say it all.
do
local IMMUNITY_TIPS = {};
for _, entry in ipairs(printout.IMMUNITIES) do
    IMMUNITY_TIPS[entry.id] = (IMMUNITY_COVERS[entry.id] or '') .. TIPS.immunity;
end

-- The Effects part's Show choices.
local EFFECT_SHOWS = { { id = 'both', name = 'Debuffs and buffs' }, { id = 'debuffs', name = 'Only debuffs' },
    { id = 'buffs', name = 'Only buffs' } };

-- What the Effects section says under its controls.
local EFFECTS_NOTE = 'The times are estimates. A wear-off message clears your timer early.';

settings_window.draw_effects_tab = function (settings)
    local e = settings.effects;
    heading('EFFECTS', TIPS.effects);
    part_off_note(settings, 'effects');
    choice('Show', e, 'show', EFFECT_SHOWS, TIPS.effects_show);
    checkbox('Time left', e, 'times', TIPS.effects_times);
    checkbox('Mark estimated times with ~', e, 'estimate_mark',
        'Adds ~ before every shown timer. Even your own timer is an estimate until a removal message arrives.',
        e.times ~= true);
    checkbox('Say when none were observed', e, 'show_empty',
        'Shows No effects observed, or no buffs or debuffs for your filter. This means checkmate has no matching '
        .. 'observations; it does not mean the monster has no effects.');
    note(EFFECTS_NOTE);
    note('Everyone else\'s count down from how long they usually last.');
end

local function draw_immunities_section(settings)
    heading('IMMUNITIES', TIPS.immunities);

    if (imgui.BeginTable('##immunities', 3, TABLE_FLAGS)) then
        imgui.TableSetupColumn('On');
        imgui.TableSetupColumn('Immunity');
        imgui.TableSetupColumn('Label', STRETCH);
        imgui.TableHeadersRow();
        -- The label box leaves room for its (?).
        local box_width = -help_width;
        for _, entry in ipairs(printout.IMMUNITIES) do
            local shown = settings.immunities[entry.id];
            imgui.PushID(entry.id);
            imgui.TableNextRow();
            imgui.TableNextColumn();
            checkbox('##on', shown, 'on');
            imgui.TableNextColumn();
            cell_text(entry.label);
            imgui.TableNextColumn();
            text_box('##label', shown, 'label', box_width, LABEL_MAX, IMMUNITY_TIPS[entry.id]);
            imgui.PopID();
        end
        imgui.EndTable();
    end
end

settings_window.draw_weaknesses_tab = function (settings)
    heading('WEAKNESSES');
    display_switches(settings, 'weaknesses');
    note('One line combines the components you choose for each display.');
    if (imgui.BeginTable('##weakness_components', 3, TABLE_FLAGS)) then
        imgui.TableSetupColumn('Component', STRETCH);
        imgui.TableSetupColumn('Chat');
        imgui.TableSetupColumn('Overlay');
        imgui.TableHeadersRow();
        imgui.PushID('components');
        for _, item in ipairs({ { 'elements', 'Elements', TIPS.elements }, { 'weapons', 'Weapons', TIPS.weapons },
            { 'immunities', 'Immunities', TIPS.immunities }, { 'charm', 'Charm', 'Its listed charm rules. Eligibility is not a success chance.' } }) do
            imgui.PushID(item[1]);
            imgui.TableNextRow(); imgui.TableNextColumn(); cell_text(item[2]);
            imgui.TableNextColumn();
            checkbox('##chat', settings.weaknesses.chat, item[1], item[3]);
            imgui.TableNextColumn();
            checkbox('##overlay', settings.weaknesses.overlay, item[1], item[3]);
            imgui.PopID();
        end
        imgui.PopID();
        imgui.EndTable();
    end
    if (begin_sections('##weaknesses_sections')) then
        imgui.TableNextColumn();
        draw_elements_section(settings);
        heading('WEAPONS', TIPS.weapons);
        text_box('Weapon weak word', settings.weapons, 'weak_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.weapons_weak_word);
        beside();
        text_box('Weapon resists word', settings.weapons, 'resist_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.weapons_resist_word);
        note('Damage changes always show as signed percentages. Neutral types stay out.');
        imgui.TableNextColumn();
        draw_immunities_section(settings);
        text_box('Immune word', settings.weaknesses, 'immune_word', px(LABEL_WIDTH), LABEL_MAX,
            'The word before the immunity list. Clear it to leave the word out.');
        imgui.EndTable();
    end
end
end

--[[
    Abbreviations tab. Its first section has the switches, then the words in groups under a heading for each part. Each
    word is its name, a box for its abbreviation and a (?), two to a row when the section has room for both, like
    the Appearance tab. The groups from SHORT_SPLIT on go in the second section once the window is wide enough for two.
]]

-- How wide an abbreviation's box is at 18 px, room for 12 letters like A if resting at every font size, and the least
-- room a word's name gets before two words share a row. A longer name wraps between words.
local SHORT_WIDTH   = 150;
local PAIR_WORD_MIN = 150;

-- The Abbreviations tab's second section starts at this heading.
local SHORT_SPLIT = 'Effects';

-- The notes under the switches about the words that have their own boxes elsewhere, and the ones while neither
-- display uses abbreviations. Each note is one short sentence.
local LABELS_NOTES = {
    'Part and immunity labels and the range, ID, PH, Weak, Resists and pet words stay as you set them.',
    'Change them on the Display, Weaknesses and Pets tabs.',
};
local OFF_NOTES = {
    'Abbreviations are off, so turn them on above to change the boxes below.',
    'The overlay\'s switch only counts while the overlay is on.',
};

-- Each word's heading and what the tab calls it, for the notes about two words that print the same, and the short
-- forms each group comes with, for how wide its boxes are.
local GROUP_OF, NAME_OF, SHORTS_OF = {}, {}, {};
for _, group in ipairs(wording.GROUPS) do
    SHORTS_OF[group] = {};
    for _, entry in ipairs(group.words) do
        GROUP_OF[entry.key], NAME_OF[entry.key] = group, entry.label or entry.full;
        SHORTS_OF[group][#SHORTS_OF[group] + 1] = entry.short;
    end
end

-- A word's (?): the row's own note first, then what it does, what it comes as and its name in commands.
local WORD_TIPS = {};
for _, entry in ipairs(wording.LIST) do
    local comes = entry.bare and 'It comes empty, so it prints just "+2", and you can type a word for it.'
        or ('It comes as "%s", and an empty box prints the full word.'):format(wording.example(entry, entry.short));
    WORD_TIPS[entry.key] = ('%sPrints in place of "%s" while abbreviations are on. %s In commands it\'s %s.')
        :format(WORD_NOTES[entry.key] and (WORD_NOTES[entry.key] .. ' ') or '', NAME_OF[entry.key], comes, entry.key);
end

-- The words that print the same, from printout.clashes. It's worked out again only after an abbreviation changes.
local clashes = nil;

-- True when two words fit side by side in a section, each with its name, its box and its (?), with a gap
-- between them so the second word's name stands apart from the first one's (?).
local function words_pair_up()
    return section_width() >= 2 * (px(PAIR_WORD_MIN) + px(SHORT_WIDTH) + help_width) + 4 * CELL_GAP;
end

local function word_group(settings, group, per_row, off)
    if (not settings_window.section_open(group.name:upper(), WORD_GROUP_TIPS[group.name])) then return; end
    -- A group that comes with an abbreviation too long for the usual box, like the can't be gauged line, gets boxes
    -- wide enough to show it, one word to a row.
    local box_width = math.max(px(SHORT_WIDTH), widest(SHORTS_OF[group]) + 2 * FRAME_PADDING[1]);
    if (box_width > px(SHORT_WIDTH)) then
        per_row = 1;
    end
    if (imgui.BeginTable('##short ' .. group.name, per_row * 2, TABLE_FLAGS)) then
        -- The first word's box column ends in a gap, so the next word's name stands apart from its (?).
        for column = 1, per_row do
            imgui.TableSetupColumn('', STRETCH);
            imgui.TableSetupColumn('', ImGuiTableColumnFlags_WidthFixed,
                box_width + help_width + (column < per_row and CELL_GAP or 0));
        end
        for _, entry in ipairs(group.words) do
            imgui.PushID(entry.key);
            imgui.TableNextColumn();
            imgui.PushTextWrapPos(0);
            cell_text(NAME_OF[entry.key]);
            imgui.PopTextWrapPos();
            imgui.TableNextColumn();
            text_box('##short', settings.short, entry.key, box_width, LABEL_MAX, WORD_TIPS[entry.key], off);
            imgui.PopID();
        end
        imgui.EndTable();
    end
    -- A note for each two words that print the same, under the heading of each of them.
    for _, clash in ipairs(clashes) do
        if (GROUP_OF[clash.first] == group or GROUP_OF[clash.second] == group) then
            note(('"%s" and "%s" both print as "%s".'):format(NAME_OF[clash.first], NAME_OF[clash.second],
                clash.text), look.problem_messages);
        end
    end
end

local function draw_abbreviations_section(settings, off)
    if (not settings_window.section_open('ABBREVIATIONS', TIPS.short_words)) then return; end
    checkbox('In chat', settings.printout, 'short_words', TIPS.short_chat);
    beside(SECOND_COLUMN);
    checkbox('In the overlay', settings.overlay, 'short_words', TIPS.short_overlay);
    imgui.BeginDisabled(off);
    if (imgui.Button('Reset every abbreviation')) then
        wording.reset(settings.short);
        result.save = true;
    end
    imgui.EndDisabled();
    help(TIPS.short_reset);
    for _, words in ipairs(LABELS_NOTES) do
        note(words);
    end
    if (off) then
        for _, words in ipairs(OFF_NOTES) do
            note(words);
        end
    end
    sample_button(TIPS.sample);
end

local function draw_abbreviations_tab(settings)
    settings_window.layout_width = nil;
    local o = settings.overlay;
    -- Greyed while neither display uses them, like the other word boxes.
    local off = not settings.printout.short_words and not (o.on == true and o.short_words == true);
    clashes = clashes or printout.clashes(settings);
    local per_row = words_pair_up() and 2 or 1;
    if (begin_sections('##short_sections')) then
        imgui.TableNextColumn();
        draw_abbreviations_section(settings, off);
        for _, group in ipairs(wording.GROUPS) do
            if (group.name == SHORT_SPLIT) then
                imgui.TableNextColumn();
            end
            word_group(settings, group, per_row, off);
        end
        imgui.EndTable();
    end
    -- A box or a Reset changed an abbreviation, so the notes are worked out again on the next frame.
    if (result.edited or result.save) then
        clashes = nil;
    end
end

-- Your settings changed outside the window, by a command, a reset or a profile, so the Abbreviations tab works out its
-- notes again.
function settings_window.changed()
    clashes = nil;
    settings_window.preview_cache = nil;
end

--[[
    Appearance tab.
]]

-- The Appearance tab's second section starts at this heading.
local LOOK_SPLIT = 'Scrollbar colors';

-- Every window color's name.
local WINDOW_COLOR_NAMES = {};
for _, entry in ipairs(skins.WINDOW_COLORS) do
    WINDOW_COLOR_NAMES[#WINDOW_COLOR_NAMES + 1] = entry.label;
end

-- True when two window colors fit side by side in a section, each with its swatch, name and (?).
local function window_colors_pair_up()
    local one = swatch_size[1] + INNER_GAP + widest(WINDOW_COLOR_NAMES) + help_width;
    return section_width() >= 2 * one + CELL_GAP;
end

-- A dropdown of the skins. It shows the one you picked, or Custom once you change anything it set.
-- Picking the one you already have does nothing, so it can't replace what Undo would put back.
local function skin_picker(settings)
    local current = skins.current(settings);
    imgui.SetNextItemWidth(px(CONTROL_WIDTH));
    if (imgui.BeginCombo('##skin', current and current.name or 'Custom')) then
        for _, skin in ipairs(skins.LIST) do
            if (imgui.Selectable(skin.name, skin == current) and skin ~= current) then
                skins.apply(settings, skin.id);
                result.save = true;
            end
        end
        imgui.EndCombo();
    end
    help(SKIN_TIPS[settings.look.skin] or TIPS.skin);
end

local function draw_skin_section(settings)
    heading('SKIN');
    skin_picker(settings);
    settings_window.flow_button('Reset to skin', TIPS.reset_skin);
    if (imgui.Button('Reset to skin')) then
        if (not skins.apply(settings, settings.look.skin)) then
            skins.apply(settings, skins.LIST[1].id);
        end
        result.save = true;
    end
    help(TIPS.reset_skin);
    settings_window.flow_button('Undo', TIPS.undo);
    imgui.BeginDisabled(not skins.can_undo());
    if (imgui.Button('Undo')) then
        skins.undo(settings);
        result.save = true;
    end
    imgui.EndDisabled();
    help(TIPS.undo);
end

local function draw_font_section(look_settings)
    heading('FONT');
    choice('Font', look_settings, 'font', window_font.LIST, TIPS.font);
    -- The size slider keeps one width, so dragging it never moves it under the mouse.
    slider(imgui.SliderInt, 'Font size', look_settings, 'font_size', window_font.SIZE_MIN, window_font.SIZE_MAX,
        '%d px', TIPS.font_size, nil, CONTROL_WIDTH);
    if (window_font.failed(look_settings.font)) then
        note(('%s isn\'t in %s or won\'t load, so this window uses Ashita\'s font.')
            :format(window_font.find(look_settings.font).name, window_font.FOLDER), look.problem_messages);
    end
end

local function window_color_group(window_look, group, per_row)
    if (not settings_window.section_open(group.name:upper())) then return; end
    if (imgui.BeginTable('##' .. group.name, per_row, ImGuiTableFlags_SizingStretchSame)) then
        for _, entry in ipairs(group.colors) do
            imgui.TableNextColumn();
            window_color(entry.label .. '##' .. entry.key, window_look, entry.key, WINDOW_COLOR_TIPS[entry.key]);
        end
        imgui.EndTable();
    end
end

local function draw_look_tab(settings)
    settings_window.layout_width = nil;
    local window_look = settings.look.imgui;
    local per_row = window_colors_pair_up() and 2 or 1;
    if (begin_sections('##look_sections')) then
        imgui.TableNextColumn();
        draw_skin_section(settings);
        draw_font_section(settings.look);
        heading('SHAPE');
        slider(imgui.SliderInt, 'Corner roundness', window_look, 'rounding', 0, skins.ROUNDING_MAX, '%d px',
            TIPS.rounding);
        slider(imgui.SliderInt, 'Spacing', window_look, 'spacing', skins.SPACING_MIN, skins.SPACING_MAX, '%d px',
            TIPS.spacing);
        for _, group in ipairs(skins.WINDOW_COLOR_GROUPS) do
            if (group.name == LOOK_SPLIT) then
                imgui.TableNextColumn();
            end
            window_color_group(window_look, group, per_row);
        end
        imgui.EndTable();
    end
end

function settings_window.draw_tab_visibility(settings)
    if (not settings_window.section_open('TABS')) then return; end
    note('Hide tabs you do not use. Their features keep working.');
    note('Appearance always stays available.');
    local nav = require('ui.navigation');
    settings.window.tabs = nav.normalize(settings.window.tabs);
    local columns = math.max(1, math.min(4, math.floor((window_width - WINDOW_EDGES) / px(230))));
    if (imgui.BeginTable('##tab_visibility', columns, ImGuiTableFlags_SizingStretchSame)) then
        imgui.PushID('tabs');
        for _, name in ipairs(nav.TAB_NAMES) do
            if (name ~= 'Appearance') then
                imgui.TableNextColumn();
                checkbox(name, settings.window.tabs, name,
                    'Shows the ' .. name .. ' tab. Hiding it does not turn off any feature.');
            end
        end
        imgui.PopID();
        imgui.EndTable();
    end
    if (imgui.Button('Restore all tabs')) then
        settings.window.tabs = nav.normalize({});
        result.save = true;
    end
    help('Shows every settings tab again. Your feature settings stay as they are.');
end

local function draw_appearance_tab(settings)
    settings_window.draw_tab_visibility(settings);
    if (settings_window.section_open('WINDOW STYLE')) then draw_look_tab(settings); end
    imgui.Spacing();
    if (settings_window.section_open('CHAT COLORS')) then draw_colors_tab(settings); end
    if (settings_window.section_open('OVERLAY APPEARANCE')) then
        imgui.PushID('overlay_appearance');
        settings_window.draw_overlay_appearance(settings.overlay);
        imgui.PopID();
    end
end

--[[
    Profiles tab. Each action returns true or false and the message to show under the buttons.
]]

local function file_problem()
    if (not profiles.file_ok()) then
        return 'The profiles.json file can\'t be read, so profiles won\'t work until you fix or remove it. You\'ll '
            .. 'find it in config\\addons\\checkmate in your Ashita folder.';
    end
    return 'Couldn\'t write profiles.json.';
end

local function save_as_new(settings)
    local name = profiles.clean_name(profile_name[1]);
    if (name == '') then
        return false, 'Type a name for the new profile first.';
    elseif (profiles.exists(name)) then
        return false, ('There is already a profile called "%s". Pick it and use Overwrite.'):format(name);
    elseif (not profiles.save(settings, name)) then
        return false, file_problem();
    end
    picked = name;
    result.save, result.label = true, 'Save profile ' .. name;
    return true, ('Saved your settings as "%s".'):format(name);
end

local function overwrite_picked(settings)
    if (not profiles.save(settings, picked)) then
        return false, file_problem();
    end
    result.save, result.label = true, 'Overwrite profile ' .. picked;
    return true, ('Saved your settings over "%s".'):format(picked);
end

local function load_picked(settings)
    if (not profiles.load(settings, picked)) then
        return false, ('The profile "%s" isn\'t there anymore.'):format(picked);
    end
    result.save, result.label = true, 'Load profile ' .. picked;
    return true, ('Loaded "%s".'):format(picked);
end

local function rename_picked(settings)
    local name = profiles.clean_name(profile_name[1]);
    if (name == '') then
        return false, 'Type the new name first.';
    elseif (profiles.exists(name)) then
        return false, ('There is already a profile called "%s".'):format(name);
    elseif (not profiles.rename(settings, picked, name)) then
        return false, file_problem();
    end
    local old = picked;
    picked = name;
    result.save = true;
    return true, ('Renamed "%s" to "%s".'):format(old, name);
end

local function delete_picked(settings)
    if (not profiles.delete(settings, picked)) then
        return false, file_problem();
    end
    local old = picked;
    picked = nil;
    result.save = true;
    return true, ('Deleted "%s".'):format(old);
end

function settings_window.undo_profile_delete(settings)
    local ok, reason = profiles.undo_delete(settings);
    if (not ok) then
        if (reason == 'exists') then return false, 'That profile name is already in use. Nothing was replaced.'; end
        if (reason == 'none') then return false, 'There is no deleted profile to restore.'; end
        return false, file_problem();
    end
    picked, result.save = reason, true;
    return true, ('Restored "%s".'):format(reason);
end

-- A button for the profile picked in the list, greyed out until one is picked.
local function profile_button(label, tip, action, settings)
    imgui.BeginDisabled(picked == nil);
    if (imgui.Button(label)) then
        status_ok, status = action(settings);
    end
    imgui.EndDisabled();
    help(tip);
end

-- Profile names are literal text, including ImGui's usual ## and ### markers.
function settings_window.profile_choice(name, selected, index)
    if (not name:find('##', 1, true)) then return imgui.Selectable(name, selected); end
    imgui.PushID(tostring(index));
    local x, y = imgui.GetCursorScreenPos();
    local picked = imgui.Selectable('##profile', selected);
    local left, top = imgui.GetItemRectMin();
    local right, bottom = imgui.GetItemRectMax();
    local list = imgui.GetWindowDrawList();
    list:PushClipRect({ left, top }, { right, bottom }, true);
    list:AddText({ x, y }, imgui.GetColorU32(look.text), name);
    list:PopClipRect();
    imgui.PopID();
    return picked;
end

local function draw_profile_list()
    local names = profiles.names();
    if (picked ~= nil and not profiles.exists(picked)) then
        picked = nil;
    end
    list_size[2] = px(LIST_HEIGHT);
    if (imgui.BeginListBox('##profiles', list_size)) then
        if (#names == 0) then
            imgui.TextColored(look.faded_text, 'No profiles yet.');
        end
        for index, name in ipairs(names) do
            if (settings_window.profile_choice(name, name == picked, index)) then
                picked = name;
                profile_name[1] = name;
            end
        end
        imgui.EndListBox();
    end
end

local function draw_profiles_section(settings)
    heading('PROFILES', TIPS.profiles);
    draw_profile_list();
    imgui.SetNextItemWidth(px(CONTROL_WIDTH));
    imgui.InputText('Name', profile_name, profiles.NAME_MAX + 1);
    help(TIPS.profile_name);

    if (imgui.Button('Save as new')) then
        status_ok, status = save_as_new(settings);
    end
    help(TIPS.save_new);
    settings_window.flow_button('Overwrite', TIPS.overwrite);
    profile_button('Overwrite', TIPS.overwrite, overwrite_picked, settings);
    profile_button('Load', TIPS.load, load_picked, settings);
    settings_window.flow_button('Rename', TIPS.rename);
    profile_button('Rename', TIPS.rename, rename_picked, settings);
    settings_window.flow_button('Delete', TIPS.delete);
    profile_button('Delete', TIPS.delete, delete_picked, settings);
    imgui.BeginDisabled(profiles.deleted_name() == nil);
    if (imgui.Button('Undo delete')) then status_ok, status = settings_window.undo_profile_delete(settings); end
    imgui.EndDisabled();
    help((profiles.deleted_name() and ('Restores ' .. profiles.deleted_name() .. '. ') or '')
        .. 'Restores the last profile deleted in this session without replacing a profile with the same name. '
        .. 'Your removed job links return only if they are still empty.');
    settings_window.flow_button('Undo overwrite', true);
    imgui.BeginDisabled(profiles.overwritten_name() == nil);
    if (imgui.Button('Undo overwrite')) then
        local ok, reason = profiles.undo_overwrite();
        status_ok = ok;
        status = ok and ('Restored the saved profile "' .. reason .. '". Your current settings stay as they are.')
            or (reason == 'changed' and 'That profile changed again. Nothing was replaced.' or file_problem());
        profiles.changed(settings);
    end
    imgui.EndDisabled();
    help('Restores the previous saved version after Overwrite. It leaves your current settings alone.');
    if (status ~= nil) then
        note(status, status_ok and look.done_messages or look.problem_messages);
    end
    if (not profiles.file_ok()) then
        note(file_problem(), look.problem_messages);
    end
end

local function job_link(settings, job)
    local linked = settings.job_links[job];
    local shown = linked or NO_LINK;
    if (linked ~= nil and not profiles.exists(linked)) then
        shown = '(gone) ' .. linked;
    end
    imgui.SetNextItemWidth(-1);
    local literal = shown:find('##', 1, true) ~= nil;
    local x, y, width, frame;
    if (literal) then
        x, y = imgui.GetCursorScreenPos();
        width, frame = imgui.GetContentRegionAvail(), imgui.GetFrameHeight();
    end
    if (imgui.BeginCombo('##' .. job, literal and '' or shown)) then
        if (imgui.Selectable(NO_LINK, linked == nil)) then
            settings.job_links[job] = nil;
            result.save = true;
        end
        for index, name in ipairs(profiles.names()) do
            if (settings_window.profile_choice(name, name == linked, index)) then
                settings.job_links[job] = name;
                result.save = true;
            end
        end
        imgui.EndCombo();
    end
    if (literal) then
        local list = imgui.GetWindowDrawList();
        list:PushClipRect({ x, y }, { x + width - frame, y + frame }, true);
        list:AddText({ x + FRAME_PADDING[1], y + FRAME_PADDING[2] }, imgui.GetColorU32(look.text), shown);
        list:PopClipRect();
    end
end

local function draw_job_links(settings)
    heading('JOB LINKS', TIPS.job_links);
    local columns = math.max(1, math.min(JOB_COLUMNS, math.floor(section_width() / px(210))));
    if (imgui.BeginTable('##job_links', columns, ImGuiTableFlags_SizingStretchSame)) then
        for _, job in ipairs(profiles.JOBS) do
            imgui.TableNextColumn();
            cell_text(job);
            imgui.SameLine(px(JOB_COMBO_AT));
            job_link(settings, job);
        end
        imgui.EndTable();
    end
end

local function draw_profiles_tab(settings)
    settings_window.draw_presets(settings);
    if (begin_sections('##profile_sections')) then
        imgui.TableNextColumn();
        draw_profiles_section(settings);
        imgui.TableNextColumn();
        draw_job_links(settings);
        imgui.EndTable();
    end
end

function settings_window.draw_presets(settings)
    heading('STARTER PRESETS', 'Pick a starting layout, preview it, then apply it. Your saved profiles stay as they are.');
    settings_window.preset = settings_window.preset or { id = 'minimal' };
    settings_window.preset_list = settings_window.preset_list or ui.presets.list();
    local previous = settings_window.preset.id;
    local save_before = result.save;
    choice('Preset', settings_window.preset, 'id', settings_window.preset_list,
        'Choose a starter layout. Review its changes and preview before applying it.');
    -- Picking a preset only changes the preview selection.
    if (previous ~= settings_window.preset.id) then
        settings_window.preview_cache = nil;
        result.save = save_before;
    end
    local preset = ui.presets.find(settings_window.preset.id);
    note(preset.description);
    for _, words in ipairs(preset.changes) do note('- ' .. words); end
    if (imgui.Button('Preview preset')) then
        settings_window.preview_open, settings_window.preview_preset = true, preset.id;
        settings_window.preview_cache = nil;
    end
    help('Shows this preset using sample data. Your settings stay as they are until you apply it.');
    settings_window.flow_button('Apply preset', true);
    if (imgui.Button('Apply preset')) then
        ui.presets.apply(settings, preset.id);
        profiles.mark_preset(settings, preset.id);
        result.save, result.label = true, 'Apply ' .. preset.name;
        settings_window.preview_preset, settings_window.preview_cache = nil, nil;
        status_ok, status = true, 'Applied ' .. preset.name .. '. Undo last change restores the previous layout.';
    end
    help('Applies the listed changes and enables the overlay. It does not save over a profile.');
    imgui.Spacing();
end

function settings_window.draw_toolbar(settings)
    local source = profiles.status(settings);
    if (source.name and source.name ~= '') then
        note((source.modified and 'Modified from ' or 'Using ') .. source.label
            .. (source.missing and ' (no longer available)' or ''));
    end
    if (imgui.Button(settings_window.details_open and 'Back to settings' or 'Target details##toolbar')) then
        settings_window.details_open = not settings_window.details_open;
    end
    hover_help(settings_window.details_open and 'Returns to your settings tab.'
        or 'Shows the current target or latest saved check, with its full inputs, lists and notes.');
    settings_window.flow_button('Preview', false);
    if (imgui.Button('Preview##toolbar')) then
        settings_window.preview_open = not settings_window.preview_open;
        settings_window.preview_preset = nil;
        settings_window.details_open = false;
    end
    hover_help('Shows Chat or Overlay using sample data or the current result. Previewing sends no requests.');
    settings_window.flow_button('Undo last change', true);
    imgui.BeginDisabled(ui.history.status(settings) == nil);
    if (imgui.Button('Undo last change')) then result.undo = true; end
    imgui.EndDisabled();
    help(ui.history.status(settings) or 'No settings change to undo in this session.');
    if (not settings_window.details_open) then
        settings_window.flow_button('Reset this section', true);
        if (imgui.Button('Reset this section')) then result.reset_section = ui.navigation.current(); end
        help('Resets this tab to its defaults. Keeps your manual combat inputs, labels and window positions. '
            .. 'Appearance resets styling; Abbreviations resets custom words; Profiles clears job links. '
            .. 'Saved profile files stay as they are. Undo last change restores these settings.');
    end
    imgui.Separator();
end

function settings_window.draw_preview(settings)
    if (not settings_window.preview_open) then return; end
    local options = settings_window.preview_options or { display = 'chat', source = 'sample' };
    settings_window.preview_options = options;
    imgui.PushID('inline_preview');
    local save_before = result.save;
    choice('View', options, 'display', { { id = 'chat', name = 'Chat' }, { id = 'overlay', name = 'Overlay' } });
    choice('Data', options, 'source', { { id = 'sample', name = 'Sample' }, { id = 'current', name = 'Current target' } });
    result.save = save_before;
    local preset_id = settings_window.preview_preset;
    local cache = settings_window.preview_cache;
    if (cache == nil or cache.settings ~= settings or cache.preset ~= preset_id or result.edited or result.save) then
        local shown = preset_id and ui.presets.preview(settings, preset_id) or settings;
        cache = { settings = settings, preset = preset_id, shown = shown,
            sample = settings_window.sample_provider and settings_window.sample_provider(shown) };
        settings_window.preview_cache = cache;
    end
    if (preset_id) then
        note('Previewing ' .. ui.presets.find(preset_id).name .. '. Apply it in Profiles to use it.');
        if (imgui.Button('Use my settings')) then
            settings_window.preview_preset, settings_window.preview_cache = nil, nil;
        end
    end
    local data = cache.sample;
    if (options.source == 'current') then data = settings_window.current_preview; end
    ui.preview.draw(cache.shown, data, { display = options.display, source = options.source,
        height = 140, id = '##preview', default_font = settings_window.preview_default_font, revision = cache });
    if (imgui.Button('Close preview')) then settings_window.preview_open = false; end
    imgui.Separator();
    imgui.PopID();
end

--[[
    Display tab.
]]

local function draw_overlay_section(settings)
    local o = settings.overlay;
    heading('OVERLAY', TIPS.overlay);
    checkbox('Show the overlay', o, 'on', TIPS.overlay_on);
    checkbox('Lock it in place', o, 'locked', TIPS.overlay_lock);
    checkbox('Remember each monster\'s /check', o, 'remember', TIPS.overlay_remember);
    checkbox('Follow the cursor while you pick a target', o, 'follow_cursor', TIPS.overlay_cursor);
    -- Shift and drag is the spot's other control.
    if (imgui.Button('Move it back')) then
        overlay.move_back(settings);
        result.save = true;
    end
    help(TIPS.overlay_spot);
end

local function draw_overlay_parts_section(settings)
    local o = settings.overlay;
    checkbox('Show level', o, 'show_level', TIPS.overlay_show_level);
    beside(SECOND_COLUMN);
    checkbox('Show its level range too', o, 'show_range', TIPS.overlay_show_range, o.show_level ~= true);
    checkbox('Show its ID', o, 'show_id', TIPS.overlay_show_id);
    beside(SECOND_COLUMN);
    checkbox('Show if it\'s a PH', o, 'show_ph', TIPS.overlay_show_ph);
    checkbox('Put each part on its own line', o, 'own_lines', TIPS.overlay_lines);
    checkbox('Abbreviations', o, 'short_words', TIPS.overlay_short);
    choice('Divider', o, 'divider', overlay.DIVIDERS, TIPS.overlay_divider);
    if (o.divider == 'custom') then
        beside();
        text_box('Custom text', o, 'separator', px(SMALL_WIDTH), SEPARATOR_MAX, TIPS.overlay_custom);
    end
end

local function draw_overlay_look_section(o)
    heading('OVERLAY STYLE');
    choice('Font', o, 'font', window_font.LIST, TIPS.overlay_font);
    slider(imgui.SliderInt, 'Font size', o, 'font_size', window_font.SIZE_MIN, window_font.SIZE_MAX, '%d px',
        TIPS.overlay_font_size);
    if (window_font.failed(o.font)) then
        note(('%s isn\'t in %s or won\'t load, so the overlay uses Ashita\'s font.')
            :format(window_font.find(o.font).name, window_font.FOLDER), look.problem_messages);
    end
    slider(imgui.SliderInt, 'Background', o, 'opacity', 0, overlay.OPACITY_MAX, '%d%%', TIPS.overlay_opacity);
    checkbox('Border', o, 'border', TIPS.overlay_border);
    slider(imgui.SliderInt, 'Wrap lines wider than', o, 'wrap', 0, overlay.WRAP_MAX,
        o.wrap == 0 and 'Never' or '%d px', TIPS.overlay_wrap);
end

local function draw_overlay_icons_section(o)
    heading('ICONS');
    checkbox('Show icons', o, 'icons', TIPS.overlay_icons);
    beside(SECOND_COLUMN);
    checkbox('Icons only', o, 'icons_only', TIPS.overlay_icons_only, o.icons ~= true);
    choice('Element look', o, 'element_look', ELEMENT_LOOKS, TIPS.overlay_element_look, o.icons ~= true);
    checkbox('Tips on hover', o, 'tips', TIPS.overlay_tips);
end

local function draw_overlay_hide_section(o)
    heading('HIDE IT');
    checkbox('In cutscenes and NPC talk', o, 'hide_in_events', TIPS.overlay_events);
    checkbox('While the game\'s interface is hidden', o, 'hide_with_ui', TIPS.overlay_ui);
    checkbox('While the map is open', o, 'hide_on_map', TIPS.overlay_map);
    for _, words in ipairs(OVERLAY_NOTES) do
        note(words);
    end
end

function settings_window.draw_display_tab(settings)
    heading('DISPLAY', 'Choose what goes into chat and the overlay. Both use the same row order and labels.');
    ui.display.draw(settings, {
        names = PART_NAMES, tips = PART_TIPS, overlay_tips = OVERLAY_PART_TIPS,
        checkbox = checkbox, text_box = text_box, help = help, note = note, move = move_buttons,
        label_max = LABEL_MAX, changed = function () result.save = true; end,
        options = function (id)
            local pages = { name = 'Display', reading = 'Display', difficulty = 'Display',
                aggro = 'Aggro', links = 'Aggro', pursuit = 'Aggro', magic = 'Magic', blue = 'Blue Magic',
                weaknesses = 'Weaknesses', pet = 'Pets', effects = 'Effects', drops = 'Drops', steal = 'Drops' };
            local page = pages[id];
            if (page == nil) then
                page = ({ hit = true, offhand = true, ranged = true, evade = true, crit = true, crittaken = true,
                    pdif = true, offhandpdif = true, rangedpdif = true, block = true, parry = true })[id]
                    and 'Numbers' or 'Monster';
            end
            settings_window.go_to(page, settings);
            if (page == 'Display') then settings_window.jump_chat_format = true; end
        end,
    });
    if (settings_window.section_open('CHAT FORMAT', nil, false)) then
        if (settings_window.jump_chat_format) then
            imgui.SetScrollHereY(0.05);
            settings_window.jump_chat_format = nil;
        end
        imgui.PushID('chat_format');
        draw_name_section(settings);
        checkbox('Defense first', settings.printout, 'defense_first', PART_TIPS.reading);
        checkbox('Put the extras on their own line', settings.printout, 'extras_own_line', TIPS.extras);
        draw_lines_section(settings.printout);
        imgui.PopID();
    end
    if (settings_window.section_open('OVERLAY OPTIONS', nil, false)) then
        imgui.PushID('overlay_options');
        draw_overlay_section(settings);
        draw_overlay_parts_section(settings);
        draw_overlay_icons_section(settings.overlay);
        draw_overlay_hide_section(settings.overlay);
        imgui.PopID();
    end
end

settings_window.draw_overlay_appearance = draw_overlay_look_section;

--[[
    The window.
]]

-- Search narrows the tabs by their controls and help, without hiding controls within a matching tab.
(function ()
    local query = { '' };
    local copied = nil;
    local target_details, details_text = nil, nil;
    local details_groups, details_stamp, details_query = nil, nil, { '' };
    local details_filter = nil;
    local terms = {
        Printout = 'name level range id ph placeholder difficulty evasion defense reading parts labels new line '
            .. 'order arrows divider separator header replace game line number ranges midpoint icons sample',
        Overlay = 'show overlay lock remember check follow cursor target position move distance name level range id ph '
            .. 'parts lines abbreviations font size opacity border wrap icons only element look badges tips hover hide '
            .. 'cutscenes npc map scroll lock interface',
        Appearance = 'tabs tab visibility show hide Restore all tabs skin phoenix classic minimal contrast ember mint lavender light purple colorblind font size window colors headings text '
            .. 'notes buttons checkboxes border background opacity rounding undo reset window style chat colors '
            .. 'color difficulty threat safe grades good ok bad number label words details chat swatches sample '
            .. 'your times others times estimate badges',
        Numbers = 'hit off-hand ranged evade shield block parry guard defensive skill equipment crit critical hit taken merits fill zone cutoffs good ok bad pdif multiplier attack defense ratio cap '
            .. 'sweet spot outside 25 yalms current distance',
        Pets = 'pet name level hit word evade word jug charmed wyvern automaton accuracy evasion',
        Aggro = 'aggro aggressive detection sight sound true magic low hp ability ambush night awake form hate '
            .. 'links names superlink how each most max limit pursuit scent tracking follows',
        Magic = 'magic schools stand-in spell elemental enfeebling divine dark singing ninjutsu accuracy '
            .. 'extra known gear merits direct bonus chance',
        ['Blue Magic'] = 'blue magic learn lessons known spellbook unknown spell chance skill accuracy observed move use seen '
            .. 'spell finder find lesson monster zone places unlearned',
        Weaknesses = 'weakness resistance resists elemental strength rank damage weapons slashing piercing '
            .. 'blunt impact hand-to-hand immunity immune sleep bind silence stun gravity poison paralysis '
            .. 'petrify amnesia blind charm',
        Monster = 'monster info family hp mp vitals movement spawn claim dangers fight traits crystal rewards '
            .. 'source conditions estimates target details full links ph rules copy debuff critical hits buff removal drains most danger moves shown filters',
        Drops = 'drops treasure hunter th label chance minimum limit most notes scripted exp experience '
            .. 'conditions surviving steal items availability',
        Effects = 'effects buffs debuffs observed timers duration estimate estimated time left mark ~ none empty',
        Abbreviations = 'abbreviations abbreviated forms chat overlay reset clashes full words',
        Profiles = 'profiles name save new overwrite load rename delete undo job links shared character',
    };
    for _, group in ipairs(printout.COLOR_GROUPS) do
        terms.Appearance = terms.Appearance .. ' ' .. group.name;
        for _, each in ipairs(group.colors or {}) do terms.Appearance = terms.Appearance .. ' ' .. (each.label or each.key); end
    end
    for _, group in ipairs(wording.GROUPS) do terms.Abbreviations = terms.Abbreviations .. ' ' .. group.name; end
    for _, entry in ipairs(wording.LIST) do
        terms.Abbreviations = terms.Abbreviations .. ' ' .. entry.full .. ' ' .. (entry.label or '');
    end
    for id, school in pairs(spells.schools) do
        local tab = id == 'blue' and 'Blue Magic' or 'Magic';
        for _, spell in ipairs(school.spells) do terms[tab] = terms[tab] .. ' ' .. spell.name; end
    end
    local tip_groups = {
        Printout = { 'show_name', 'name_label', 'show_level', 'show_range', 'range_word', 'show_id', 'id_word',
            'show_ph', 'ph_word', 'parts', 'extras', 'header', 'divider', 'custom', 'label_divider', 'custom_label',
            'number_style', 'replace', 'sample', 'icons', 'icons_only' },
        Overlay = { 'overlay', 'overlay_on', 'overlay_lock', 'overlay_remember', 'overlay_cursor', 'overlay_spot',
            'overlay_parts', 'overlay_show_level', 'overlay_show_range', 'overlay_show_id', 'overlay_show_ph',
            'overlay_lines', 'overlay_short', 'overlay_divider', 'overlay_custom', 'overlay_font', 'overlay_font_size',
            'overlay_opacity', 'overlay_border', 'overlay_wrap', 'overlay_events', 'overlay_ui', 'overlay_map',
            'overlay_icons', 'overlay_icons_only', 'overlay_element_look', 'overlay_tips' },
        Appearance = { 'sample_colors', 'con_colors', 'threat_colors', 'grades', 'skin', 'reset_skin', 'undo',
            'font', 'font_size', 'rounding', 'spacing' },
        Numbers = { 'cutoffs', 'cutoffs_taken', 'crit_merits', 'enemy_crit_merits', 'merit_fill', 'ranged_far', 'pdif_mode' },
        Pets = { 'pet', 'pet_name', 'pet_level', 'pet_hit_word', 'pet_evade_word' },
        Aggro = { 'aggressive', 'detection', 'link_how', 'link_names', 'max_links' },
        Magic = { 'schools', 'extra_accuracy' },
        ['Blue Magic'] = { 'schools' },
        Weaknesses = { 'elements', 'weak_word', 'resist_word', 'strength', 'weapons',
            'weapons_weak_word', 'weapons_resist_word', 'elementmark', 'immunities', 'immunity' },
        Drops = { 'th', 'max_items', 'min_chance', 'order', 'th_in_label', 'drop_notes' },
        Effects = { 'effects', 'effects_show', 'effects_times' },
        Abbreviations = { 'short_words', 'short_chat', 'short_overlay', 'short_reset' },
        Profiles = { 'profiles', 'profile_name', 'save_new', 'overwrite', 'load', 'rename', 'delete', 'job_links' },
    };
    for tab, keys in pairs(tip_groups) do
        for _, key in ipairs(keys) do terms[tab] = terms[tab] .. ' ' .. (TIPS[key] or ''); end
    end
    local more_tips = {
        Printout = PART_TIPS, Overlay = OVERLAY_PART_TIPS, Appearance = COLOR_TIPS, Pets = { pet = PART_TIPS.pet },
        Weaknesses = IMMUNITY_TIPS, Abbreviations = WORD_TIPS,
    };
    for tab, entries in pairs(more_tips) do
        for _, words in pairs(entries) do terms[tab] = terms[tab] .. ' ' .. words; end
    end
    for _, words in pairs(WINDOW_COLOR_TIPS) do terms.Appearance = terms.Appearance .. ' ' .. words; end
    for id, words in pairs(SCHOOL_TIPS) do
        local tab = id == 'blue' and 'Blue Magic' or 'Magic';
        terms[tab] = terms[tab] .. ' ' .. words;
    end
    for _, section in ipairs(settings_window.INFO_SECTIONS) do
        local tab = section[4] or 'Monster';
        terms[tab] = terms[tab] .. ' ' .. section[2] .. ' ' .. section[3];
    end
    local controls = {
        Printout = 'Show the name Label Show level Show its level range too Range word Show its ID ID word '
            .. 'Show if it is a PH PH word Defense first Put the extras on their own line '
            .. '[checkmate] at the start of each line Element icons',
        Overlay = 'Lock it in place Background Divider In cutscenes and NPC talk While the map is open '
            .. 'While the game interface is hidden Wrap lines wider than',
        Appearance = 'Color by difficulty Color by grade Color by threat Print a sample Corner roundness Spacing Reset to skin',
        Numbers = 'Show current distance Show it outside the sweet spot too Fill both in when you zone pDIF display '
            .. 'In chat In overlay Multiplier range Attack/Defense ratio Both',
        Aggro = 'Most entries shown Group names by family Show how it finds you Show how each one links Show the names it links with Pursuit In chat In overlay',
        Magic = 'Healing Include known gear and merits',
        ['Blue Magic'] = 'In chat In overlay Component Chat Overlay Learnable spells Spell chance Stand-in spell Only unlearned spells Show learning requirements eligibility '
            .. 'Find a Blue spell Unlearned spells only Monsters in this zone Find a monster or zone Copy places Clear',
        Weaknesses = 'In chat In overlay Component Chat Overlay Elements Weapons Immunities Charm Immune word Resists word Weak word Show how strong each one is Show script warning',
        Pets = 'In chat In overlay Show its name Show its level Hit word Evade word',
        Monster = 'Category Chat Overlay Find target details Copy details Copy shown Clear details Target details',
        Drops = 'Hide items under Most items shown Order Treasure Hunter in the label Drop notes',
        Effects = 'Show Say when none were observed Mark estimated times with ~ Time left',
        Abbreviations = 'Print a sample Reset every abbreviation',
        Profiles = 'Save as new',
    };
    for tab, labels in pairs(controls) do terms[tab] = terms[tab] .. ' ' .. labels; end
    terms.Appearance = terms.Appearance .. ' ' .. table.concat(require('ui.navigation').TAB_NAMES, ' ');
    for _, color in ipairs(skins.WINDOW_COLORS) do terms.Appearance = terms.Appearance .. ' ' .. color.label; end
    terms.Display = terms.Printout .. ' ' .. terms.Overlay .. ' Enabled only Options Label New line Order Chat format Overlay options';
    terms.Printout, terms.Overlay = nil, nil;
    terms.Numbers = terms.Numbers .. ' Offense Defense Advanced';
    terms.Profiles = terms.Profiles .. ' Starter presets Minimal Melee Mage Ranged Tank Blue Mage Pet Job Thief Preview Apply';
    terms.Appearance = terms.Appearance .. ' ' .. (TIPS.overlay_font or '') .. ' Overlay appearance Font size Background Border Wrap lines wider than';
    for name, words in pairs(terms) do terms[name] = (name .. ' ' .. words):lower(); end

    function settings_window.search_tabs(value)
        local out = {};
        for name, words in pairs(terms) do
            local match = true;
            for token in tostring(value or ''):lower():gmatch('%S+') do
                if (not words:find(token, 1, true)) then match = false; break; end
            end
            if (match) then out[name] = true; end
        end
        return out;
    end

    function settings_window.draw_search()
        imgui.SetNextItemWidth(px(260));
        local changed = imgui.InputText('Find settings', query, 128);
        help('Finds tabs by control names and help, highlights matching controls, and scrolls to the first match. '
            .. 'Every word must match; clear it to show your visible tabs.');
        if (query[1] ~= '') then
            settings_window.flow_button('Clear', true);
            if (imgui.Button('Clear##search')) then query[1], changed = '', true; end
            help('Clears the search and shows your visible tabs.');
        end
        if (query[1] ~= '') then
            local current, total = search.status(ui.navigation.current());
            settings_window.flow_button('Previous match', false);
            imgui.BeginDisabled(total == 0);
            if (imgui.Button('Previous match')) then search.step(-1, ui.navigation.current()); end
            settings_window.flow_button('Next match', false);
            if (imgui.Button('Next match')) then search.step(1, ui.navigation.current()); end
            imgui.EndDisabled();
            note(('%d of %d matches on this tab'):format(current, total));
        end
        settings_window.query_text = query[1];
        search.query(query[1], look.accent);
        return settings_window.search_tabs(query[1]), changed;
    end

    function settings_window.go_to(page, settings)
        query[1], settings_window.query_text = '', '';
        search.query('', look and look.accent);
        settings_window.details_open = false;
        if (settings.window.tabs[page] == false) then settings.window.tabs[page], result.save = true, true; end
        ui.navigation.select(page);
        if (page == 'Display') then
            settings_window.folded = settings_window.folded or {};
            settings_window.folded['Display/CHAT FORMAT'] = true;
        end
    end

    function settings_window.set_target_details(value)
        settings_window.current_preview = value;
        if (value ~= target_details) then
            target_details, details_text, details_groups, copied = value, nil, nil, nil;
            details_filter = nil;
        end
    end

    function settings_window.draw_detail_header()
        local title, state = require('ui.tips').detail_header(target_details);
        note(title, look.headings);
        if (imgui.Button('Target details')) then settings_window.jump_details = true; end
        imgui.SameLine();
        help_mark('Scrolls this page to the full target details. The target name and reading age stay above the page.');
        if (state ~= nil) then
            beside(); settings_window.place_control(state, 0, nil); note(state);
        end
        imgui.Separator();
    end

    local function lines(value)
        for line in (value .. '\n'):gmatch('(.-)\n') do
            if (line ~= '') then note(line); else imgui.Spacing(); end
        end
    end

    function settings_window.draw_target_details(settings)
        heading('TARGET DETAILS');
        if (settings_window.jump_details) then
            imgui.SetScrollHereY(0);
            settings_window.jump_details = nil;
        end
        if (target_details ~= nil) then
            local keys = { tostring(settings.printout.number_style), tostring((settings.pdif or {}).mode) };
            for _, id in ipairs(dangers.CATEGORIES) do keys[#keys + 1] = tostring(settings.dangers[id]); end
            keys[#keys + 1] = tostring(settings.dangers.max_moves);
            for _, id in ipairs(printout.PARTS) do
                keys[#keys + 1] = tostring(settings.printout.parts[id].on);
                keys[#keys + 1] = tostring(settings.overlay.parts[id]);
            end
            for _, display in ipairs({ 'chat', 'overlay' }) do
                keys[#keys + 1] = tostring(settings.blue[display].lessons);
                keys[#keys + 1] = tostring(settings.blue[display].chance);
                for _, id in ipairs({ 'elements', 'weapons', 'immunities', 'charm' }) do
                    keys[#keys + 1] = tostring(settings.weaknesses[display][id]);
                end
            end
            local stamp = table.concat(keys, ':');
            if (details_groups == nil or stamp ~= details_stamp) then
                details_stamp = stamp;
                details_groups = require('ui.tips').detail_groups(settings, target_details);
                local all = {};
                for _, group in ipairs(details_groups) do all[#all + 1] = group.text; end
                details_text = table.concat(all, '\n\n');
            end
        end
        if (target_details == nil) then
            note('Check a monster, or turn on the overlay and select one, to see its details here.');
            if (imgui.Button('Copy details')) then
                local ok = pcall(function () imgui.SetClipboardText('No monster selected.'); end);
                copied = ok and 'Copied: no monster selected.' or 'Copy is unavailable.';
            end
            help('Copies No monster selected while no target details are available. It does not reuse a previous monster.');
            if (copied ~= nil) then note(copied); end
        else
            if ((target_details.provenance or {}).chat_snapshot) then
                note('Your latest /check: ' .. printout.clean_text(target_details.name) .. '. These are the inputs read for that result.');
                if (settings.blue.seen) then note('Observed Blue Magic move use updates as moves finish. The saved inputs stay as they were.'); end
            else
                note('These details were read when the target or its inputs changed. Hover the overlay for their current age.');
            end
            imgui.SetNextItemWidth(px(260));
            if (imgui.InputText('Find target details', details_query, 128)) then copied = nil; end
            help('Finds matching sections and individual danger moves by their names, effects and notes. Copy details keeps the full list.');
            if (details_query[1] ~= '') then
                settings_window.flow_button('Clear', true);
                if (imgui.Button('Clear##details')) then details_query[1], copied = '', nil; end
                help('Clears the target-details search. Danger category filters stay as you set them.');
            end
            if (details_filter == nil or details_filter.groups ~= details_groups or details_filter.query ~= details_query[1]) then
                local shown, hidden, active = {}, 0, {};
                for _, id in ipairs(dangers.CATEGORIES) do
                    if (settings.dangers[id] ~= false) then active[#active + 1] = dangers.LABELS[id]; end
                end
                for _, group in ipairs(details_groups or {}) do
                    if (group.danger_entry ~= nil and not dangers.matches(group.danger_entry, settings.dangers)) then
                        hidden = hidden + 1;
                    elseif (search.matches(group.label .. ' ' .. group.text, details_query[1])) then
                        shown[#shown + 1] = group;
                    end
                end
                details_filter = { groups = details_groups, query = details_query[1], shown = shown, hidden = hidden, active = active };
            end
            local shown, hidden, active = details_filter.shown, details_filter.hidden, details_filter.active;
            note(('Showing %d of %d sections.'):format(#shown, #(details_groups or {})));
            if (#active < #dangers.CATEGORIES) then
                note('Danger filters: ' .. (#active > 0 and table.concat(active, ', ') or 'none')
                    .. ('. %d move%s hidden.'):format(hidden, hidden == 1 and '' or 's'));
            end
            if (details_query[1] ~= '') then note('Search is active. Clear it to show other matching sections.'); end
            if (imgui.Button('Copy shown')) then
                local values = {};
                for _, group in ipairs(shown) do values[#values + 1] = group.text; end
                local report = #values > 0 and table.concat(values, '\n\n') or 'No matching target details.';
                local ok = pcall(function () imgui.SetClipboardText(report); end);
                copied = ok and 'Copied shown.' or 'Copy is unavailable. The details are shown below.';
            end
            help('Copies sections matching the search and danger categories, including matching sections folded closed.');
            settings_window.flow_button('Copy details', true);
            if (imgui.Button('Copy details')) then
                local ok = pcall(function () imgui.SetClipboardText(details_text or 'No monster selected.'); end);
                copied = ok and 'Copied all details.' or 'Copy is unavailable. The details are shown below.';
            end
            help('Copies all enabled target details, including danger moves hidden by filters, sections hidden by the search or folded closed.');
            if (copied ~= nil) then note(copied); end
            imgui.Spacing();
            for _, group in ipairs(shown) do
                if (details_query[1] ~= '') then imgui.SetNextItemOpen(true, ImGuiCond_Always); end
                if (imgui.CollapsingHeader(group.label .. '##detail_' .. group.id, ImGuiTreeNodeFlags_DefaultOpen)) then
                    lines(group.text);
                end
            end
            if (#shown == 0) then note('No matching target details. Clear the search or change the danger filters.'); end
        end
    end
end)();

-- The tabs in order, each drawn by its function.
local TABS = {
    { 'Display',    settings_window.draw_display_tab },
    { 'Numbers',    draw_numbers_tab },
    { 'Aggro',      draw_aggro_tab },
    { 'Magic',      draw_magic_tab },
    { 'Blue Magic', settings_window.draw_blue_tab },
    { 'Weaknesses', settings_window.draw_weaknesses_tab },
    { 'Pets',       draw_pet_section },
    { 'Monster',    settings_window.draw_monster_tab },
    { 'Drops',      draw_drops_tab },
    { 'Effects',    settings_window.draw_effects_tab },
    { 'Abbreviations', draw_abbreviations_tab },
    { 'Appearance', draw_appearance_tab },
    { 'Profiles',   draw_profiles_tab },
};

-- The settings were reset or another character logged in. The window moves to their spot and size on
-- the next frame, even while it's open.
function settings_window.place_again()
    place_now = true;
end

--[[
    Where the window opens. It's where you left it, at the size you left it. A size saved on a bigger
    screen is cut down to fit this one, and a window left hanging off an edge is pulled back so all of
    it shows. Tabs wrap at the saved width. The minimum is cut down to fit a small screen too.
]]
local function place_window(window)
    local screen = imgui.GetIO().DisplaySize;
    min_size[1] = math.min(px(MIN_SIZE[1]), screen.x);
    min_size[2] = math.min(px(MIN_SIZE[2]), screen.y);
    extent[1] = math.max(min_size[1], math.min(window.width, screen.x));
    extent[2] = math.max(min_size[2], math.min(window.height, screen.y));
    spot[1] = math.max(0, math.min(window.x, screen.x - extent[1]));
    spot[2] = math.max(0, math.min(window.y, screen.y - extent[2]));
    local when = place_now and ImGuiCond_Always or ImGuiCond_Appearing;
    place_now = false;
    imgui.SetNextWindowPos(spot, when);
    imgui.SetNextWindowSize(extent, when);
    imgui.SetNextWindowSizeConstraints(min_size, MAX_SIZE);
end

-- Keeps where you moved the window and the size you gave it, and saves them once you let go.
local function remember_window(window)
    local x, y = imgui.GetWindowPos();
    local width, height = imgui.GetWindowSize();
    x, y, width, height = round(x), round(y), round(width), round(height);
    local moved = x ~= window.x or y ~= window.y or width ~= window.width or height ~= window.height;
    if (moved and not imgui.IsMouseDown(ImGuiMouseButton_Left)) then
        window.x, window.y, window.width, window.height = x, y, width, height;
        result.save = true;
    end
end

--[[
    Draws the window while it's open. Returns { save, sample, edited }. `save` means write the settings
    file, `sample` means print the sample printout, and `edited` means a slider or text box changed a
    setting it hasn't saved yet.
]]
function settings_window.draw_page(tab, settings)
    search.begin_tab(tab[1]);
    settings_window.page_name = tab[1];
    settings_window.pending_row, settings_window.layout_width = nil, window_width - WINDOW_EDGES;
    if (imgui.BeginChild('##page', { 0, 0 }, 0, ImGuiWindowFlags_NoSavedSettings)) then
        settings_window.draw_preview(settings);
        tab[2](settings);
        search.finish_tab();
    end
    imgui.EndChild();
end

function settings_window.draw(settings, version, sample_provider)
    result.save, result.sample, result.edited = false, false, false;
    result.undo, result.reset_section, result.label = nil, nil, nil;
    settings_window.sample_provider = sample_provider or settings_window.sample_provider;
    if (not open[1]) then
        return result;
    end

    look = settings.look.imgui;
    settings_window.overlay_own_lines = settings.overlay.own_lines == true;
    local colors, sizes = push_style();
    settings_window.preview_default_font = imgui.GetFont();
    -- A font that failed to load draws in Ashita's own font at your size.
    imgui.PushFont(window_font.face(settings.look.font) or imgui.GetFont(), settings.look.font_size);
    scale = imgui.GetFontSize() / BASE_FONT_SIZE;
    local frame = imgui.GetFrameHeight();
    swatch_size[1], swatch_size[2] = frame, frame;
    help_width = ITEM_GAP + (imgui.CalcTextSize(HELP_MARK));

    place_window(settings.window);
    if (imgui.Begin('checkmate##settings', open, WINDOW_FLAGS)) then
        remember_window(settings.window);
        window_width = imgui.GetWindowSize();
        stacked = window_width < 2 * math.max(COLUMN_WIDTH, px(COLUMN_WIDTH)) + COLUMN_GAP + WINDOW_EDGES;
        -- The version goes on its own line when the subtitle doesn't fit, so it never breaks at a dot.
        local subtitle = ('%s  |  v%s'):format(SUBTITLE, version);
        if (imgui.CalcTextSize(subtitle) > imgui.GetContentRegionAvail()) then
            subtitle = ('%s\nv%s'):format(SUBTITLE, version);
        end
        note(subtitle, look.faded_text);
        search.begin_tab(nil);
        settings_window.pending_row, settings_window.layout_width = nil, window_width - WINDOW_EDGES;
        settings_window.draw_toolbar(settings);
        if (settings_window.details_open) then
            settings_window.draw_detail_header();
            if (imgui.BeginChild('##details_page', { 0, 0 }, 0, ImGuiWindowFlags_NoSavedSettings)) then
                settings_window.draw_target_details(settings);
            end
            imgui.EndChild();
        else
            local matches, search_changed = settings_window.draw_search();
            if (next(matches) == nil) then note('No matching settings. Try level, effects, links, or colors.'); end
            if (ui.navigation.draw(settings, TABS, matches, search_changed, settings_window.draw_page,
                { width = window_width - WINDOW_EDGES, searching = settings_window.query_text ~= '' })) then
                result.save = true;
            end
        end
    end
    imgui.End();
    imgui.PopFont();
    imgui.PopStyleVar(sizes);
    imgui.PopStyleColor(colors);
    if (result.edited) then
        settings_window.preview_cache = nil;
        profiles.changed(settings);
    end
    return result;
end

return settings_window;
