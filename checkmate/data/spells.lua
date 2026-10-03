--[[
    The spell that stands in for each magic school, and the tables the magic math needs.

    Every value comes from the Phoenix server source (phoenix/live). The element is the spell's
    element in sql/spell_list.sql. The stat and the bonus magic accuracy come from the spell's
    helper table. The rank, immunity, resist trait, effect evasion and resist state come from the
    effect's row in scripts/data/status_effect_tables.lua.

    `id` is the short name kept in your settings and `name` is what the settings window shows. `stat`
    is the stat compared with the monster's (int, mnd or chr) and `bonus` is the spell's own bonus
    magic accuracy. `element` is the spell's element, or `elements` for the "weakest element" spells.
    `rank` is the effect's own resistance rank, when it has one. The element's rank is used otherwise.
    `immune` is the immunity that stops it outright and `trait` is the resist trait that can stop it
    ("Resist!"). `effect` names the effect's own magic evasion. `state` is how many resist steps still
    land. Damage spells have none and show the full damage chance.
]]

local spells = {};

-- How each element prints after a school's chance, like "Elemental 88% (Ice)".
spells.ELEMENT_NAMES = {
    fire = 'Fire', ice = 'Ice', wind = 'Wind', earth = 'Earth',
    thunder = 'Thunder', water = 'Water', light = 'Light', dark = 'Dark',
};

-- Tier I to IV nukes and elemental ninjutsu exist for these six elements.
local NUKE_ELEMENTS = { 'fire', 'ice', 'wind', 'earth', 'thunder', 'water' };

-- Magical blue spells that use INT exist in era for these elements. Firespit is fire, Ice Break is
-- ice, Sandspin is earth, Blitzstrahl is thunder, Maelstrom is water and Death Ray is dark.
-- Source: scripts/actions/spells/blue/*.lua (useMagicalSpell, dStat INT) and sql/spell_list.sql
local BLUE_ELEMENTS = { 'fire', 'ice', 'earth', 'thunder', 'water', 'dark' };

-- Schools in the order they print.
spells.SCHOOL_ORDER = { 'elemental', 'enfeebling', 'dark', 'divine', 'healing', 'ninjutsu', 'singing', 'blue' };

--[[
    One entry per school. `skill` is the skill id the client reports. The first spell in each list is
    the default stand-in.
]]
spells.schools = {
    -- Source: scripts/globals/spells/damage_spell.lua pTable (FIRE..WATER_IV)
    elemental = {
        label = 'Elemental',
        skill = 36,
        spells = {
            { id = 'tier1', name = 'Tier I nuke',   stat = 'int', bonus = 0,  elements = NUKE_ELEMENTS },
            { id = 'tier2', name = 'Tier II nuke',  stat = 'int', bonus = 10, elements = NUKE_ELEMENTS },
            { id = 'tier3', name = 'Tier III nuke', stat = 'int', bonus = 20, elements = NUKE_ELEMENTS },
            { id = 'tier4', name = 'Tier IV nuke',  stat = 'int', bonus = 20, elements = NUKE_ELEMENTS },
        },
    },

    -- Source: scripts/globals/spells/enfeebling_spell.lua pTable
    enfeebling = {
        label = 'Enfeebling',
        skill = 35,
        spells = {
            { id = 'slow',     name = 'Slow',     stat = 'mnd', bonus = 10,  element = 'earth', rank = 'slow',       immune = 'slow',       trait = 'slow',     effect = 'slow',     state = 1 },
            { id = 'paralyze', name = 'Paralyze', stat = 'mnd', bonus = -10, element = 'ice',   rank = 'paralyze',   immune = 'paralyze',   trait = 'paralyze', effect = 'paralyze', state = 1 },
            { id = 'silence',  name = 'Silence',  stat = 'mnd', bonus = 0,   element = 'wind',  rank = 'silence',    immune = 'silence',    trait = 'silence',  effect = 'silence',  state = 1 },
            { id = 'sleep',    name = 'Sleep',    stat = 'int', bonus = 0,   element = 'dark',  rank = 'dark_sleep', immune = 'dark_sleep', trait = 'sleep',    effect = 'sleep',    state = 1 },
            { id = 'bind',     name = 'Bind',     stat = 'int', bonus = 0,   element = 'ice',   rank = 'bind',       immune = 'bind',       trait = 'bind',     effect = 'bind',     state = 2 },
            { id = 'gravity',  name = 'Gravity',  stat = 'int', bonus = 0,   element = 'wind',  rank = 'gravity',    immune = 'gravity',    trait = 'gravity',  effect = 'gravity',  state = 1 },
            { id = 'blind',    name = 'Blind',    stat = 'int', bonus = 0,   element = 'dark',  rank = 'blind',      immune = 'blind',      trait = 'blind',    effect = 'blind',    state = 1 },
            { id = 'poison',   name = 'Poison',   stat = 'int', bonus = 0,   element = 'water', rank = 'poison',     immune = 'poison',     trait = 'poison',   effect = 'poison',   state = 1 },
        },
    },

    -- Bio uses the damage_spell.lua pTable. Drain uses absorb_spell.lua and does nothing to the undead.
    -- Stun uses the enfeebling_spell.lua pTable.
    dark = {
        label = 'Dark',
        skill = 37,
        spells = {
            { id = 'bio',   name = 'Bio',   stat = 'int', bonus = 0,   element = 'dark' },
            { id = 'drain', name = 'Drain', stat = 'int', bonus = 0,   element = 'dark', no_undead = true },
            { id = 'stun',  name = 'Stun',  stat = 'int', bonus = 200, element = 'thunder', rank = 'stun', immune = 'stun', trait = 'stun', effect = 'stun', state = 2 },
        },
    },

    -- Banish and Holy use the damage_spell.lua pTable. Flash uses the enfeebling_spell.lua pTable and
    -- counts as blindness for rank, immunity and resist trait.
    divine = {
        label = 'Divine',
        skill = 32,
        spells = {
            { id = 'banish', name = 'Banish', stat = 'mnd', bonus = 0,   element = 'light' },
            { id = 'flash',  name = 'Flash',  stat = 'mnd', bonus = 512, element = 'light', rank = 'blind', immune = 'blind', trait = 'blind', effect = 'blind', state = 1 },
            { id = 'holy',   name = 'Holy',   stat = 'mnd', bonus = 0,   element = 'light' },
        },
    },

    -- Cure only hurts the undead, through the damage_spell.lua pTable (scripts/actions/spells/white/cure.lua).
    healing = {
        label = 'Healing',
        skill = 33,
        undead_only = true,
        spells = {
            { id = 'cure', name = 'Cure', stat = 'mnd', bonus = 0, element = 'light' },
        },
    },

    -- Elemental ninjutsu uses the damage_spell.lua pTable. The rest use the enfeebling_spell.lua pTable.
    ninjutsu = {
        label = 'Ninjutsu',
        skill = 39,
        spells = {
            { id = 'ichi',     name = 'Elemental Ichi', stat = 'int', bonus = 0, elements = NUKE_ELEMENTS },
            { id = 'kurayami', name = 'Kurayami: Ichi', stat = 'int', bonus = 0, element = 'dark',  rank = 'blind',    immune = 'blind',    trait = 'blind',    effect = 'blind',    state = 1 },
            { id = 'hojo',     name = 'Hojo: Ichi',     stat = 'int', bonus = 0, element = 'earth', rank = 'slow',     immune = 'slow',     trait = 'slow',     effect = 'slow',     state = 1 },
            { id = 'jubaku',   name = 'Jubaku: Ichi',   stat = 'int', bonus = 0, element = 'ice',   rank = 'paralyze', immune = 'paralyze', trait = 'paralyze', effect = 'paralyze', state = 1 },
            { id = 'dokumori', name = 'Dokumori: Ichi', stat = 'int', bonus = 0, element = 'water', rank = 'poison',   immune = 'poison',   trait = 'poison',   effect = 'poison',   state = 1 },
        },
    },

    -- Songs use CHR and get no bonus magic accuracy outside Finale.
    -- Elegy and Requiem have no effect rank, so their element's rank counts. Elegy's resist trait is
    -- the slow one. Requiem's immunity is checked by the server core, not the Lua table.
    -- Source: scripts/globals/spells/enfeebling_song.lua
    singing = {
        label = 'Singing',
        skill = 40,
        spells = {
            { id = 'lullaby', name = 'Foe Lullaby',       stat = 'chr', bonus = 0, element = 'light', rank = 'light_sleep', immune = 'light_sleep', trait = 'sleep', effect = 'sleep', state = 1, soul_voice = true },
            { id = 'elegy',   name = 'Battlefield Elegy', stat = 'chr', bonus = 0, element = 'earth', immune = 'elegy', trait = 'slow', state = 1 },
            { id = 'requiem', name = 'Foe Requiem',       stat = 'chr', bonus = 0, element = 'light', immune = 'requiem', state = 1 },
        },
    },

    -- Magical blue spells get no bonus magic accuracy in era.
    -- Source: scripts/globals/bluemagic.lua useMagicalSpell
    blue = {
        label = 'Blue',
        skill = 43,
        spells = {
            { id = 'magical', name = 'Magical spell', stat = 'int', bonus = 0, elements = BLUE_ELEMENTS },
        },
    },
};

-- The school's spell with this id, or its default when the id is unknown.
function spells.find(school_id, spell_id)
    local list = spells.schools[school_id].spells;
    for _, spell in ipairs(list) do
        if (spell.id == spell_id) then
            return spell;
        end
    end
    return list[1];
end

--[[
    Elemental staves. Each one adds its bonus times 10 to magic accuracy for spells of that element,
    and takes the same away for the opposing element.
    Source: sql/item_mods.sql (mods 347 to 354, the *_STAFF_BONUS mods)
]]
spells.STAFF = {
    [17545] = { fire = 2,    ice = -2 },      -- Fire Staff
    [17546] = { fire = 3,    ice = -3 },      -- Vulcan's Staff
    [17547] = { ice = 2,     wind = -2 },     -- Ice Staff
    [17548] = { ice = 3,     wind = -3 },     -- Aquilo's Staff
    [17549] = { wind = 2,    earth = -2 },    -- Wind Staff
    [17550] = { wind = 3,    earth = -3 },    -- Auster's Staff
    [17551] = { earth = 2,   thunder = -2 },  -- Earth Staff
    [17552] = { earth = 3,   thunder = -3 },  -- Terra's Staff
    [17553] = { thunder = 2, water = -2 },    -- Thunder Staff
    [17554] = { thunder = 3, water = -3 },    -- Jupiter's Staff
    [17555] = { water = 2,   fire = -2 },     -- Water Staff
    [17556] = { water = 3,   fire = -3 },     -- Neptune's Staff
    [17557] = { light = 2,   dark = -2 },     -- Light Staff
    [17558] = { light = 3,   dark = -3 },     -- Apollo's Staff
    [17559] = { dark = 2,    light = -2 },    -- Dark Staff
    [17560] = { dark = 3,    light = -3 },    -- Pluto's Staff
};

--[[
    A monster's magic evasion before its resistance rank, by monster level 1 to 99. It's the rank C
    skill cap (column r7).
    Source: sql/skill_caps.sql and src/map/utils/mobutils.cpp GetMagicEvasion
]]
spells.MEVA_BY_LEVEL = {
    5, 7, 10, 13, 16, 19, 21, 24, 27, 30,
    33, 35, 38, 41, 44, 47, 49, 52, 55, 58,
    61, 63, 66, 69, 72, 75, 77, 80, 83, 86,
    89, 91, 94, 97, 100, 103, 105, 108, 111, 114,
    117, 119, 122, 125, 128, 131, 133, 136, 139, 142,
    146, 151, 156, 161, 166, 170, 175, 180, 185, 190,
    192, 194, 196, 199, 201, 203, 205, 208, 210, 212,
    214, 217, 219, 222, 225, 230, 235, 240, 245, 250,
    256, 262, 268, 274, 280, 286, 292, 298, 304, 310,
    317, 324, 331, 338, 345, 352, 359, 366, 373,
};

return spells;
