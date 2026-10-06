--[[
    The settings window, opened with /checkmate.

    Changes show up right away. Checkboxes, dropdowns and buttons save at once. Sliders, text boxes and
    color pickers save when you let go of them, so dragging or typing doesn't write the settings file
    every frame. You can move and resize the window, and it opens where you left it at the size you
    left it. Its sections sit in two columns when the window is wide enough and stack into one when
    it isn't. Every setting has a (?) that explains it. Its colors, corners, spacing, font and font
    size come from the Look tab. Its layout grows and shrinks with the font size.
]]

local imgui       = require('imgui');
local printout    = require('core.printout');
local aggro       = require('core.aggro');
local drops       = require('core.drops');
local magic       = require('core.magic');
local spells      = require('data.spells');
local skins       = require('ui.skins');
local profiles    = require('ui.profiles');
local window_font = require('ui.window_font');

local settings_window = {};

local WINDOW_FLAGS = bit.bor(ImGuiWindowFlags_NoCollapse, ImGuiWindowFlags_NoSavedSettings);
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

-- The window can shrink to this at Ashita's font size.
local MIN_SIZE = { 700, 320 };
local MAX_SIZE = { FLT_MAX, FLT_MAX };

-- Longest label and custom divider, in characters.
local LABEL_MAX     = printout.LABEL_MAX;
local SEPARATOR_MAX = printout.SEPARATOR_MAX;

-- Job links sit in three columns, or two when the window is wide enough for two sections. Each
-- dropdown starts 60 in from its job's name.
local JOB_COLUMNS        = 3;
local JOB_COLUMNS_BESIDE = 2;
local JOB_COMBO_AT       = 60;

-- The job link choice that loads nothing.
local NO_LINK = '(none)';

-- What a (?) shows.
local HELP_MARK = '(?)';

-- The line under the window's title. The version goes after it.
local SUBTITLE = 'Hit, evade, crit, aggro, magic, immunities, elements and drops on /check';

-- Style sizes that take the skin's corner roundness.
local ROUNDED = {
    ImGuiStyleVar_WindowRounding, ImGuiStyleVar_ChildRounding, ImGuiStyleVar_FrameRounding,
    ImGuiStyleVar_PopupRounding, ImGuiStyleVar_GrabRounding, ImGuiStyleVar_TabRounding,
    ImGuiStyleVar_ScrollbarRounding,
};

-- The space inside boxes and buttons. Tabs take less either side of their names, so all nine fit
-- across the smallest window.
local FRAME_PADDING = { 8, 4 };
local TAB_PADDING   = { 5, 4 };

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

--[[
    Screen colors for the chat color swatches. Each is the CSS color libs\chat.lua names the code
    after. 104 and 106 are chat.lua's warning and message colors and have no CSS name, so a pale
    yellow and a cream stand in. 102 has no name there either, and a light blue stands in. The game's
    own shades differ, and "Print a sample" shows the real ones.
]]
local CHAT_RGB = {
    [1]  = 'ffffff', [2]  = '7cfc00', [3]  = '7b68ee', [5]  = 'ff00ff', [6]   = '00ffff', [7]   = 'ffe4b5',
    [8]  = 'ff7f50', [65] = '696969', [67] = '808080', [68] = 'fa8072', [69]  = 'ffff00', [71]  = '4169e1',
    [72] = '8b008b', [73] = 'ee82ee', [76] = 'ff6347', [77] = 'ffe4e1', [78]  = 'eee8aa', [79]  = '00ff00',
    [80] = '98fb98', [81] = '9932cc', [82] = '00ffff', [83] = '00ff7f', [85]  = 'e9967a', [88]  = '00fa9a',
    [89] = '9370db', [90] = 'f0ffff', [92] = 'e0ffff', [96] = 'fafad2', [102] = 'add8e6', [104] = 'ffff80',
    [105] = 'dda0dd', [106] = 'ffefc2',
};

local SWATCHES = {};
local PALETTE_NAMES = {};
for _, entry in ipairs(printout.PALETTE) do
    SWATCHES[entry.code] = skins.hex(CHAT_RGB[entry.code] or 'ffffff');
    PALETTE_NAMES[entry.code] = entry.name;
end
-- The swatch colors by chat color code, for the colorblind check in the tests.
settings_window.SWATCHES = SWATCHES;

-- What each part is called in the parts table, and the reading's row under Difficulty.
local PART_NAMES = {
    difficulty = 'Difficulty', hit = 'Hit rate', evade = 'Evade', crit = 'Crit', aggro = 'Aggro', magic = 'Magic',
    immunities = 'Immunities', elements = 'Elements', drops = 'Drops', pet = 'Pet',
};
local READING_NAME = 'Evasion and defense';

-- Every word in those names. The Part column is always as wide as the widest, so a name only breaks
-- between words, whatever the font.
local PART_WORDS = {};
for _, name in pairs(PART_NAMES) do
    for word in name:gmatch('%S+') do
        PART_WORDS[#PART_WORDS + 1] = word;
    end
end
for word in READING_NAME:gmatch('%S+') do
    PART_WORDS[#PART_WORDS + 1] = word;
end

-- Dropdown choices, each the `id` kept in the settings and the `name` shown for it.
local NUMBER_STYLES = { { id = 'range', name = 'Range 64-72%' }, { id = 'midpoint', name = 'Middle ~68%' } };
local SORTS = { { id = 'chance', name = 'By chance' }, { id = 'name', name = 'By name' } };

-- The cutoff rows on the Numbers tab, by label and settings key.
local CUTOFFS = { { 'Hit rate', 'hit' }, { 'Evade', 'evade' }, { 'Crit', 'crit' } };

--[[
    Tips. Each (?) shows one of these.
]]

local TIPS = {
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
    show_ph       = 'Adds the NM a placeholder can pop after its level and ID, like (PH for Valkurm Emperor). It only '
        .. 'says the monster is a PH, not when the NM can pop again, the chance it pops or whether it\'s up.',
    ph_word       = 'The word before the NM. Clear it to get (Valkurm Emperor).',
    parts         = 'Parts print after the name, top to bottom, and the arrows move them. Type your own word in a '
        .. 'part\'s Label box, like Acc instead of Hit, or clear it for no label. A label can only use plain '
        .. 'letters, numbers, spaces and symbols. New line starts a new chat line before that part.',
    extras        = 'With this on, hit, evade, crit, aggro, magic, immunities, elements, drops and pet never share a '
        .. 'line with the name and difficulty. With it off, they carry on along the same line unless their New line '
        .. 'is on.',
    header        = 'Starts each /check line with [checkmate]. checkmate\'s answers to your commands always have it.',
    divider       = 'What goes between parts. It also goes between magic schools, between the aggro answer and its '
        .. 'links, and before a count like "+2 more". The star, diamond, circle, dot, note and arrow are symbols '
        .. 'from the game\'s chat font that this window can\'t draw, so print a sample to see how they look.',
    custom        = 'Your own text between parts. It can only use plain letters, numbers, spaces and symbols, because '
        .. 'the chat log can\'t show anything else.',
    label_divider = 'What goes right after each part\'s label, in the label\'s color, like the colon in "Aggro: '
        .. 'Aggressive". A part with no label doesn\'t get one.',
    custom_label  = 'Your own text right after each label, with a space after it. It can only use plain letters, '
        .. 'numbers, spaces and symbols.',
    number_style  = 'How a range prints for hit rate, evade, crit, magic and the pet numbers, as 64-72% or as its '
        .. 'middle, ~68%.',
    replace       = 'Hides the game\'s own line for your /check, and checkmate\'s lines take its place. If none of '
        .. 'your parts would print anything, checkmate still prints the name, level, difficulty and the evasion and '
        .. 'defense reading. With it off, you see the game\'s line too, unless checker is loaded. checker hides '
        .. 'that line either way.',
    sample        = 'Prints a made-up /check in chat with your settings, in the real chat colors.',

    sample_colors = 'Prints a made-up /check in chat in the real chat colors. The swatches here are only close to '
        .. 'how they look in game.',
    con_colors    = 'With this on, each con prints in its own color. With it off, every con prints in One color. A '
        .. 'label on Difficulty always uses One color.',
    threat_colors = 'With this on, Aggressive answers print in Threat, and Too weak, Not aggressive and Never '
        .. 'aggressive print in Safe. With it off, they all print in Words.',
    grades        = 'With this on, the hit rate, evade, crit and pet numbers use the Good, OK and Bad colors, going '
        .. 'by the cutoffs on the Numbers tab. With it off, they use each part\'s Number color.',

    cutoffs       = 'The number prints in the Good color at or above the first cutoff, and in the OK color at or '
        .. 'above the second. Anything lower is Bad. A range like 64-72% goes by its middle. The three colors are '
        .. 'on the Colors tab. The pet part\'s Hit and Evade go by the Hit rate and Evade rows.',
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
    max_links     = 'The most link names shown. The rest show as "+2 more". All shows every name, and a Dynamis '
        .. 'monster can link with over 150 kinds.',

    schools       = 'Each school\'s chance is for the spell you pick next to it. A school only prints when you have '
        .. 'skill in it from your main or support job.',
    extra_accuracy = 'Your magic accuracy from gear, food and merits, since checkmate can\'t see it. It counts for '
        .. 'every school.',
    elements      = 'The Elements part lists the elements a monster is weak to and the ones it resists, like "Weak: '
        .. 'Ice, Thunder" and "Resists: Water (half)". Weak means that element\'s nukes do more damage than the '
        .. 'others, or its spells land more often. Resists means they do less damage or land less often.',
    weak_word     = 'The word before the elements the monster is weak to. Clear it to leave the word out.',
    resist_word   = 'The word before the elements the monster resists. Clear it to leave the word out.',
    strength      = 'Adds how strong each one is, like (half) for half damage, (never lands), (rarely lands), '
        .. '(absorbs) when the spell heals the monster, or (nullifies) when it does nothing. It also adds a note '
        .. 'when every element does more or less damage, like Magic damage -25%.',

    th            = ('Drop chances use this Treasure Hunter level, for one kill. Phoenix allows 0 to %d.')
        :format(drops.TH_MAX),
    max_items     = 'The most items shown. The rest show as "+2 more". All shows every item.',
    min_chance    = 'Leaves out items under this chance.',
    order         = 'Lists the items by chance, highest first, or by name.',
    th_in_label   = 'Puts your Treasure Hunter in the label, like "Drops (TH 2)".',
    drop_notes    = 'Adds "(plus scripted drops)" when a script can drop more, and "(only drops if you get EXP)" '
        .. 'when it only drops for a kill that gives EXP.',

    immunities    = 'The Immunities part lists what the monster is immune to, out of the ones you have on here, in '
        .. 'this order and with your labels.',
    immunity      = 'The word the list prints for this immunity. Untick On to leave it out.',

    skin          = 'Sets every window color, the corners and spacing, the chat colors on the Colors tab and Color '
        .. 'by difficulty. You can still change any of them after, and the list says Custom once you do. Your font '
        .. 'and font size stay the same.',
    reset_skin    = 'Puts back everything the skin you picked sets.',
    undo          = 'Takes back your last skin pick or Reset to skin. It goes back one step only.',
    font          = 'The font of this window. The chat log\'s font belongs to the game, and no addon can change it.',
    font_size     = 'The size of this window\'s font. The window\'s layout grows and shrinks with it.',
    rounding      = 'How round the corners of the window and its boxes are. At 0 they\'re square.',
    spacing       = 'The space between rows.',

    profiles      = 'Every character shares the profiles. A profile holds every setting except the job links and '
        .. 'where this window sits and its size. Pick one in the list to overwrite, load, rename or delete it.',
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
    difficulty = 'The difficulty from your /check, like Decent Challenge or Very Tough.',
    reading    = 'The evasion and defense reading, in parentheses after the difficulty, like "Very Tough (High '
        .. 'Evasion, Low Defense)", or after the name when Difficulty is off. It\'s left out when both are normal. '
        .. 'Defense first puts defense before evasion.',
    hit        = 'Your chance to hit the monster with your main weapon, from your accuracy in a /checkparam that '
        .. 'checkmate sends after your /check, so its line and the ones under it wait about two seconds for the '
        .. 'answer. To get everything else right away, move Hit rate, Evade and Crit to the bottom and tick New '
        .. 'line on this row.',
    evade      = 'Your chance to dodge the monster\'s attacks, from your evasion in that same /checkparam, so its '
        .. 'line waits for the answer too. It says "with Signet" when Signet raises it.',
    crit       = 'Your chance of a critical hit on the monster, from your DEX against its AGI. It doesn\'t need the '
        .. '/checkparam, so it only waits when it\'s on the line with hit rate or evade, or a line under it.',
    aggro      = 'Whether the monster aggroes you at your level, how it notices you and what it links with. The '
        .. 'Aggro tab has its options.',
    magic      = 'Your chance with each school you pick on the Magic tab.',
    immunities = 'What the monster is immune to, like Sleep or Bind. The Immunities tab picks which ones show.',
    elements   = 'The elements the monster is weak to and the ones it resists. The Magic tab has its options.',
    drops      = 'What the monster drops and the chance of each, at your Treasure Hunter. The Drops tab has its '
        .. 'options.',
    pet        = 'How often your pet hits the monster and how often the monster misses it, with your pet\'s name '
        .. 'and level. Except for a charmed monster, checkmate needs a /checkparam for your pet, so this line '
        .. 'prints about two seconds after your /check, or about three and a half with Hit rate or Evade on. It '
        .. 'never holds up the other lines, so if it shares your /check line, that line prints after the ones '
        .. 'under it. The Numbers tab has its options.',
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

-- Tips that every hit rate, evade and crit color shares.
local LABEL_TIP  = 'The label and the label divider after it.';
local NUMBER_TIP = 'The number while grade colors are off. With them on, the Grades colors paint it.';
local DETAIL_TIP = 'The small extras, like "unknown" and the "?" after a number.';

-- What each chat color paints, by key.
local COLOR_TIPS = {
    tag_brackets      = 'The square brackets of the tag, the [checkmate] at the start of each line.',
    tag_word          = 'The word checkmate inside the tag.',
    line              = 'The dividers between parts. It also paints the "can\'t be gauged" line.',
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
    evade_number      = NUMBER_TIP,
    evade_detail      = 'The small extras, like "with Signet", "unknown" and the "?" after a number.',
    crit_label        = LABEL_TIP,
    crit_number       = NUMBER_TIP,
    crit_detail       = DETAIL_TIP,
    aggro_label       = LABEL_TIP,
    aggro_words       = 'The answer while Color by threat is off, and "Links with", "Links", "Doesn\'t link" and the '
        .. 'names.',
    aggro_detail      = 'How it notices you, like "(Sight, Sound)", how the monsters it links with join, like '
        .. '"(Sound)", the notes, the commas, the dividers and the "+2 more" count.',
    aggro_threat      = 'Aggressive while Color by threat is on.',
    aggro_safe        = 'Too weak, Not aggressive and Never aggressive while Color by threat is on.',
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
    elements_detail   = 'How strong each one is, like "(half)", the commas, the dividers, the magic damage note and '
        .. 'the "?".',
    drops_label       = LABEL_TIP,
    drops_name        = 'The item names.',
    drops_number      = 'Each item\'s chance.',
    drops_detail      = 'The small extras, like "(TH 2)", the commas, "+2 more" and the drop notes.',
    pet_label         = 'The label, its label divider, and the Hit and Evade words with their label dividers.',
    pet_name          = 'Your pet\'s name.',
    pet_level         = 'Your pet\'s level after its name, like (Lv 75).',
    pet_number        = 'Your pet\'s numbers while grade colors are off. With them on, the Grades colors paint them.',
    pet_detail        = 'The dividers inside the part, "unknown" and the "?" after a number.',
    good              = 'Hit rate, evade, crit and pet numbers at or above the good cutoff on the Numbers tab.',
    ok                = 'Numbers at or above the OK cutoff but under the good one.',
    bad               = 'Numbers under the OK cutoff.',
};

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
    text                    = 'Most of the window\'s text.',
    faded_text              = 'The subtitle, the (?) marks and "No profiles yet".',
    headings                = 'The section headings, like SKIN.',
    notes                   = 'The short notes some tabs show, like when a part is off.',
    done_messages           = 'What the Profiles tab says after an action worked.',
    problem_messages        = 'What the Profiles tab says when an action didn\'t work, and the note about a font that '
        .. 'won\'t load.',
    selected_text           = 'The highlight behind text you select in a text box.',
    text_cursor             = 'The cursor in a text box.',
    background              = 'The window\'s background.',
    border                  = 'The line around the window.',
    title_bar               = 'The title bar while you\'re using this window.',
    title_bar_unfocused     = 'The title bar while you\'re using another window.',
    dropdowns               = 'The list a dropdown opens, and these tips.',
    table_headers           = 'The row of names over a table, like the one over the parts.',
    heading_lines           = 'The line under each heading.',
    resize_corner           = 'The corner at the bottom right you drag to resize the window.',
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
local result = { save = false, sample = false };
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
    imgui.PushStyleVar(ImGuiStyleVar_CellPadding, SECTION_PADDING);
    local shown = imgui.BeginTable(id, stacked and 1 or 2, ImGuiTableFlags_SizingStretchSame);
    imgui.PopStyleVar(1);
    return shown;
end

-- How wide one section is, worked out from the window's width.
local function section_width()
    local inside = window_width - WINDOW_EDGES;
    if (stacked) then
        return inside;
    end
    return (inside - COLUMN_GAP) / 2;
end

-- Keeps the next control on this line, `at` pixels in, while the sections stack. Side by side, a
-- section is too narrow for both, so the control starts a line of its own.
local function beside(at)
    if (stacked) then
        imgui.SameLine(at and px(at) or 0);
    end
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
    imgui.AlignTextToFramePadding();
    help_mark(tip);
end

-- A (?) right after the last thing drawn. A nil tip draws nothing.
local function help(tip)
    if (tip ~= nil) then
        imgui.SameLine();
        help_mark(tip);
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

-- A short note when a part these settings belong to is off.
local function part_off_note(settings, id)
    if (not settings.printout.parts[id].on) then
        note(('The %s part is off, so turn it on in the Printout tab.'):format(PART_NAMES[id]));
    end
end

-- Text that lines up with the controls beside it.
local function cell_text(words)
    imgui.AlignTextToFramePadding();
    imgui.TextUnformatted(words);
end

-- Saves once a slider, text box or color picker is let go of.
local function save_when_done()
    if (imgui.IsItemDeactivatedAfterEdit()) then
        result.save = true;
    end
end

local function checkbox(label, table_, key, tip, off)
    imgui.BeginDisabled(off == true);
    flag[1] = table_[key] == true;
    if (imgui.Checkbox(label, flag)) then
        table_[key] = flag[1];
        result.save = true;
    end
    imgui.EndDisabled();
    help(tip);
end

-- `draw` is imgui.SliderInt or imgui.SliderFloat. `width` is in pixels as drawn, CONTROL_WIDTH by default.
local function slider(draw, label, table_, key, low, high, format, tip, off, width)
    imgui.BeginDisabled(off == true);
    number[1] = table_[key];
    imgui.SetNextItemWidth(width or px(CONTROL_WIDTH));
    if (draw(label, number, low, high, format, ImGuiSliderFlags_AlwaysClamp)) then
        table_[key] = number[1];
    end
    save_when_done();
    imgui.EndDisabled();
    help(tip);
end

-- A label or custom divider box. Anything outside printable ASCII is dropped as you type.
local function text_box(label, table_, key, width, size, tip, off)
    imgui.BeginDisabled(off == true);
    text[1] = table_[key] or '';
    imgui.SetNextItemWidth(width);
    if (imgui.InputText(label, text, size + 1)) then
        table_[key] = printout.clean_text(text[1]);
    end
    save_when_done();
    imgui.EndDisabled();
    help(tip);
end

-- A dropdown of fixed choices.
local function choice(label, table_, key, choices, tip, off)
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
    help(tip);
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
    help(tip);
end

-- A window color. The picker edits the color table in place.
local function window_color(label, table_, key, tip)
    if (type(table_[key]) == 'table') then
        imgui.ColorEdit4(label, table_[key], COLOR_FLAGS);
        save_when_done();
        help(tip);
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
    Printout tab.
]]

-- One column puts two controls to a line. Side by side, each section has room for one.
local function draw_name_section(ps)
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
    local indent = px(SECOND_COLUMN) - WINDOW_PADDING[1];
    if (stacked) then
        imgui.Indent(indent);
    end
    text_box('Range word', ps, 'range_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.range_word,
        not (ps.show_level and ps.show_range));
    if (stacked) then
        imgui.Unindent(indent);
    end
    checkbox('Show its ID', ps, 'show_id', TIPS.show_id);
    beside(SECOND_COLUMN);
    text_box('ID word', ps, 'id_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.id_word, not ps.show_id);
    checkbox('Show if it\'s a PH', ps, 'show_ph', TIPS.show_ph);
    beside(SECOND_COLUMN);
    text_box('PH word', ps, 'ph_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.ph_word, not ps.show_ph);
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

-- The parts table's columns. The last holds each row's (?).
local PART_COLUMNS = 6;
local TIP_COLUMN = 5;

local function part_row(ps, id, index, count)
    local part = ps.parts[id];
    imgui.PushID(id);
    imgui.TableNextRow();
    imgui.TableNextColumn();
    checkbox('##on', part, 'on');
    imgui.TableNextColumn();
    imgui.PushTextWrapPos(0);
    cell_text(PART_NAMES[id] or id);
    imgui.PopTextWrapPos();
    imgui.TableNextColumn();
    text_box('##label', part, 'label', -1, LABEL_MAX);
    imgui.TableNextColumn();
    checkbox('##new_line', part, 'new_line');
    imgui.TableNextColumn();
    move_buttons(ps, id, index, count);
    imgui.TableNextColumn();
    cell_help(PART_TIPS[id]);
    imgui.PopID();
end

-- The evasion and defense reading's row. It sits under Difficulty, which it rides on, and has no
-- label, New line or arrows.
local function reading_row(ps)
    imgui.PushID('reading');
    imgui.TableNextRow();
    imgui.TableNextColumn();
    checkbox('##on', ps.parts.reading, 'on');
    imgui.TableNextColumn();
    imgui.PushTextWrapPos(0);
    cell_text(READING_NAME);
    imgui.PopTextWrapPos();
    imgui.TableNextColumn();
    checkbox('Defense first', ps, 'defense_first');
    imgui.TableSetColumnIndex(TIP_COLUMN);
    cell_help(PART_TIPS.reading);
    imgui.PopID();
end

local function draw_parts_section(ps)
    heading('PARTS', TIPS.parts);
    local ids = {};
    for id in ps.order:gmatch('%S+') do
        if (ps.parts[id] ~= nil) then
            ids[#ids + 1] = id;
        end
    end
    if (imgui.BeginTable('##parts', PART_COLUMNS, TABLE_FLAGS)) then
        imgui.TableSetupColumn('On');
        imgui.TableSetupColumn('Part', ImGuiTableColumnFlags_WidthFixed,
            math.max(px(PART_WIDTH), widest(PART_WORDS)));
        imgui.TableSetupColumn('Label', STRETCH);
        imgui.TableSetupColumn('New line');
        imgui.TableSetupColumn('Move');
        imgui.TableSetupColumn('');
        imgui.TableHeadersRow();
        for index, id in ipairs(ids) do
            part_row(ps, id, index, #ids);
            if (id == 'difficulty') then
                reading_row(ps);
            end
        end
        imgui.EndTable();
    end
    checkbox('Put the extras on their own line', ps, 'extras_own_line', TIPS.extras);
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
    checkbox('Replace the game\'s /check line', ps, 'replace_game_line', TIPS.replace);
    sample_button(TIPS.sample);
end

local function draw_printout_tab(settings)
    local ps = settings.printout;
    if (begin_sections('##printout_sections')) then
        imgui.TableNextColumn();
        draw_name_section(ps);
        draw_parts_section(ps);
        imgui.TableNextColumn();
        draw_lines_section(ps);
        imgui.EndTable();
    end
end

--[[
    Colors tab. Each heading's colors sit two to a row when they fit, or one to a row when a name is too
    long to share or the section too narrow.
]]

-- Longest color name, in characters, that still fits two to a row, and the narrowest its column gets.
local PAIR_NAME_MAX   = 8;
local PAIR_NAME_WIDTH = 72;

-- The Colors tab's second section starts at this heading.
local COLORS_SPLIT = 'Crit';

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
    ['Grades']     = { 'Color the hit, evade, crit and pet numbers', 'grades', 'on', TIPS.grades },
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
    heading(group.name:upper());
    local switch = COLOR_SWITCHES[group.name];
    if (switch ~= nil) then
        checkbox(switch[1], settings[switch[2]], switch[3], switch[4]);
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

local function draw_cutoffs_section(settings)
    local grades = settings.grades;
    heading('CUTOFFS');
    local off = not grades.on;
    if (off) then
        note('Grade colors are off, so turn them on in the Colors tab to use these.');
    end
    if (imgui.BeginTable('##cutoffs', 3, TABLE_FLAGS)) then
        imgui.TableSetupColumn('');
        imgui.TableSetupColumn('Good at or above');
        imgui.TableSetupColumn('OK at or above');
        imgui.TableHeadersRow();
        for _, row in ipairs(CUTOFFS) do
            local good, ok = row[2] .. '_good', row[2] .. '_ok';
            imgui.TableNextRow();
            imgui.TableNextColumn();
            cell_text(row[1]);
            imgui.TableNextColumn();
            slider(imgui.SliderInt, '##' .. good, grades, good, 0, printout.CUTOFF_MAX, '%d%%', nil, off,
                px(CUTOFF_WIDTH));
            imgui.TableNextColumn();
            slider(imgui.SliderInt, '##' .. ok, grades, ok, 0, printout.CUTOFF_MAX, '%d%%', TIPS.cutoffs, off,
                px(CUTOFF_WIDTH));
        end
        imgui.EndTable();
    end
end

local function draw_pet_section(settings)
    local p = settings.pet;
    heading('PET', TIPS.pet);
    part_off_note(settings, 'pet');
    checkbox('Show its name', p, 'show_name', TIPS.pet_name);
    beside(SECOND_COLUMN);
    checkbox('Show its level', p, 'show_level', TIPS.pet_level, not p.show_name);
    text_box('Hit word', p, 'hit_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.pet_hit_word);
    beside();
    text_box('Evade word', p, 'evade_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.pet_evade_word);
end

local function draw_numbers_tab(settings)
    if (begin_sections('##numbers_sections')) then
        imgui.TableNextColumn();
        draw_cutoffs_section(settings);
        imgui.TableNextColumn();
        draw_pet_section(settings);
        imgui.EndTable();
    end
end

--[[
    Aggro tab.
]]

local function draw_aggro_tab(settings)
    local a = settings.aggro;
    if (begin_sections('##aggro_sections')) then
        imgui.TableNextColumn();
        heading('AGGRESSIVE', TIPS.aggressive);
        part_off_note(settings, 'aggro');
        checkbox('Show how it finds you', a, 'detection', TIPS.detection);
        imgui.TableNextColumn();
        heading('LINKS');
        -- First, so it sits next to Show how it finds you.
        checkbox('Show how each one links', a, 'link_how', TIPS.link_how);
        checkbox('Show the names it links with', a, 'link_names', TIPS.link_names);
        slider(imgui.SliderInt, 'Most names shown', a, 'max_links', 0, aggro.MAX_LINKS,
            a.max_links == 0 and 'All' or '%d', TIPS.max_links, not a.link_names);
        imgui.EndTable();
    end
end

--[[
    Magic tab.
]]

local function draw_schools_section(settings)
    local m = settings.magic;
    heading('SCHOOLS', TIPS.schools);
    part_off_note(settings, 'magic');
    if (imgui.BeginTable('##schools', 2, TABLE_FLAGS)) then
        imgui.TableSetupColumn('School');
        imgui.TableSetupColumn('Stand-in spell', STRETCH);
        imgui.TableHeadersRow();
        for _, id in ipairs(spells.SCHOOL_ORDER) do
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
        imgui.EndTable();
    end

    heading('EXTRA MAGIC ACCURACY');
    slider(imgui.SliderInt, '##extra_accuracy', m, 'extra_accuracy', 0, magic.EXTRA_ACCURACY_MAX, '+%d',
        TIPS.extra_accuracy);
end

local function draw_elements_section(settings)
    local e = settings.elements;
    heading('ELEMENTS', TIPS.elements);
    part_off_note(settings, 'elements');
    text_box('Weak word', e, 'weak_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.weak_word);
    beside();
    text_box('Resists word', e, 'resist_word', px(LABEL_WIDTH), LABEL_MAX, TIPS.resist_word);
    checkbox('Show how strong each one is', e, 'strength', TIPS.strength);
end

local function draw_magic_tab(settings)
    if (begin_sections('##magic_sections')) then
        imgui.TableNextColumn();
        draw_schools_section(settings);
        imgui.TableNextColumn();
        draw_elements_section(settings);
        imgui.EndTable();
    end
end

--[[
    Drops tab.
]]

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
    Immunities tab.
]]

-- The immunity's tip, after what it covers when its name doesn't say it all.
local IMMUNITY_TIPS = {};
for _, entry in ipairs(printout.IMMUNITIES) do
    IMMUNITY_TIPS[entry.id] = (IMMUNITY_COVERS[entry.id] or '') .. TIPS.immunity;
end

local function draw_immunities_tab(settings)
    heading('IMMUNITIES', TIPS.immunities);
    part_off_note(settings, 'immunities');
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

--[[
    Look tab.
]]

-- The Look tab's second section starts at this heading.
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
    beside();
    if (imgui.Button('Reset to skin')) then
        if (not skins.apply(settings, settings.look.skin)) then
            skins.apply(settings, skins.LIST[1].id);
        end
        result.save = true;
    end
    help(TIPS.reset_skin);
    imgui.SameLine();
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
    heading(group.name:upper());
    if (imgui.BeginTable('##' .. group.name, per_row, ImGuiTableFlags_SizingStretchSame)) then
        for _, entry in ipairs(group.colors) do
            imgui.TableNextColumn();
            window_color(entry.label .. '##' .. entry.key, window_look, entry.key, WINDOW_COLOR_TIPS[entry.key]);
        end
        imgui.EndTable();
    end
end

local function draw_look_tab(settings)
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
    return true, ('Saved your settings as "%s".'):format(name);
end

local function overwrite_picked(settings)
    if (not profiles.save(settings, picked)) then
        return false, file_problem();
    end
    return true, ('Saved your settings over "%s".'):format(picked);
end

local function load_picked(settings)
    if (not profiles.load(settings, picked)) then
        return false, ('The profile "%s" isn\'t there anymore.'):format(picked);
    end
    result.save = true;
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

-- A button for the profile picked in the list, greyed out until one is picked.
local function profile_button(label, tip, action, settings)
    imgui.BeginDisabled(picked == nil);
    if (imgui.Button(label)) then
        status_ok, status = action(settings);
    end
    imgui.EndDisabled();
    help(tip);
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
        for _, name in ipairs(names) do
            if (imgui.Selectable(name, name == picked)) then
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
    imgui.SameLine();
    profile_button('Overwrite', TIPS.overwrite, overwrite_picked, settings);
    profile_button('Load', TIPS.load, load_picked, settings);
    imgui.SameLine();
    profile_button('Rename', TIPS.rename, rename_picked, settings);
    imgui.SameLine();
    profile_button('Delete', TIPS.delete, delete_picked, settings);
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
    if (imgui.BeginCombo('##' .. job, shown)) then
        if (imgui.Selectable(NO_LINK, linked == nil)) then
            settings.job_links[job] = nil;
            result.save = true;
        end
        for _, name in ipairs(profiles.names()) do
            if (imgui.Selectable(name, name == linked)) then
                settings.job_links[job] = name;
                result.save = true;
            end
        end
        imgui.EndCombo();
    end
end

local function draw_job_links(settings)
    heading('JOB LINKS', TIPS.job_links);
    local columns = stacked and JOB_COLUMNS or JOB_COLUMNS_BESIDE;
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
    if (begin_sections('##profile_sections')) then
        imgui.TableNextColumn();
        draw_profiles_section(settings);
        imgui.TableNextColumn();
        draw_job_links(settings);
        imgui.EndTable();
    end
end

--[[
    The window.
]]

-- The tabs in order, each drawn by its function.
local TABS = {
    { 'Printout',   draw_printout_tab },
    { 'Colors',     draw_colors_tab },
    { 'Numbers',    draw_numbers_tab },
    { 'Aggro',      draw_aggro_tab },
    { 'Magic',      draw_magic_tab },
    { 'Drops',      draw_drops_tab },
    { 'Immunities', draw_immunities_tab },
    { 'Look',       draw_look_tab },
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
    it shows. The smallest size is cut down to fit a small screen too.
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
    Draws the window while it's open. Returns { save, sample }. `save` means write the settings file
    and `sample` means print the sample printout.
]]
function settings_window.draw(settings, version)
    result.save, result.sample = false, false;
    if (not open[1]) then
        return result;
    end

    look = settings.look.imgui;
    local colors, sizes = push_style();
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
        -- The tab bar lays its tabs out with the tab padding, and each tab's page draws with the usual one.
        imgui.PushStyleVar(ImGuiStyleVar_FramePadding, TAB_PADDING);
        if (imgui.BeginTabBar('##checkmate_tabs', ImGuiTabBarFlags_DrawSelectedOverline)) then
            for _, tab in ipairs(TABS) do
                if (imgui.BeginTabItem(tab[1])) then
                    imgui.PushStyleVar(ImGuiStyleVar_FramePadding, FRAME_PADDING);
                    tab[2](settings);
                    imgui.PopStyleVar(1);
                    imgui.EndTabItem();
                end
            end
            imgui.EndTabBar();
        end
        imgui.PopStyleVar(1);
    end
    imgui.End();
    imgui.PopFont();
    imgui.PopStyleVar(sizes);
    imgui.PopStyleColor(colors);
    return result;
end

return settings_window;
