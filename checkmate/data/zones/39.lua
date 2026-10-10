-- Dynamis-Valkurm (zone 39).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
-- Identical tables are shared within this file.
local danger = {};
danger[1] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' };
danger[2] = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' };
danger[3] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.' };
danger[4] = { value = 'Move list unresolved', notes = danger[1], entries = {  }, coverage = 'unresolved', incomplete = true, reasons = danger[2], general_notes = danger[3] };
danger[5] = { 'Normal attacks: HP drain. Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.', 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' };
danger[6] = { 'Normal hits can drain HP while Blood Weapon is active. It does not drain undead targets; the active buff is not established here.' };
danger[7] = { kind = 'attack', id = 0, name = 'Normal attacks', summary = 'Normal attacks: HP drain', notes = danger[6], categories = { 'drain' }, effects = { 'HP drain' }, details = { notes = {  }, unknown = {  } } };
danger[8] = { danger[7] };
danger[9] = { value = 'Normal attacks: HP drain', notes = danger[5], entries = danger[8], coverage = 'partial', incomplete = true, reasons = danger[2], general_notes = danger[3] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            true_both = { 'Adamantking Effigy', 'Fairy Ring', 'Flytrap', 'Goblin Replica', 'Manifest Icon',
                          'Nantina', 'Nightmare Fly', 'Nightmare Hippogryph', 'Nightmare Manticore',
                          'Nightmare Morbol', 'Nightmare Sabotender', 'Nightmare Sheep', 'Stcemqestcint',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger',
                          'Warchief Tombstone' },
        },
        [2] = {
            true_both = { 'Adamantking Effigy', 'Cirrate Christelle', 'Fairy Ring', 'Flytrap', 'Goblin Replica',
                          'Manifest Icon', 'Nantina', 'Nightmare Fly', 'Nightmare Hippogryph',
                          'Nightmare Manticore', 'Nightmare Morbol', 'Nightmare Sabotender', 'Nightmare Sheep',
                          'Stcemqestcint', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator',
                          'Vanguard Armorer', 'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender',
                          'Vanguard Bugler', 'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender',
                          'Vanguard Dollmaster', 'Vanguard Dragontamer', 'Vanguard Drakekeeper',
                          'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier', 'Vanguard Grappler',
                          'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker', 'Vanguard Hitman',
                          'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa', 'Vanguard Liberator',
                          'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer', 'Vanguard Militant',
                          'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger',
                          'Warchief Tombstone' },
        },
        [3] = {
            true_both = { 'Adamantking Effigy', 'Cirrate Christelle', 'Fairy Ring', 'Flytrap', 'Goblin Replica',
                          'Manifest Icon', 'Nantina', 'Nightmare Fly', 'Nightmare Hippogryph',
                          'Nightmare Manticore', 'Nightmare Morbol', 'Nightmare Sabotender', 'Nightmare Sheep',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger',
                          'Warchief Tombstone' },
        },
        [4] = {
            true_both = { 'Adamantking Effigy', 'Cirrate Christelle', 'Fairy Ring', 'Flytrap', 'Goblin Replica',
                          'Manifest Icon', 'Nightmare Fly', 'Nightmare Hippogryph', 'Nightmare Manticore',
                          'Nightmare Morbol', 'Nightmare Sabotender', 'Nightmare Sheep', 'Stcemqestcint',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger',
                          'Warchief Tombstone' },
        },
        [5] = {
            true_both = { 'Adamantking Effigy', 'Cirrate Christelle', 'Flytrap', 'Goblin Replica', 'Manifest Icon',
                          'Nantina', 'Nightmare Fly', 'Nightmare Hippogryph', 'Nightmare Manticore',
                          'Nightmare Morbol', 'Nightmare Sabotender', 'Nightmare Sheep', 'Stcemqestcint',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger',
                          'Warchief Tombstone' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Adamantking Effigy'] = { id = 205, name = 'Statue' },
        ['Cirrate Christelle'] = { id = 147, name = 'Morbol' },
        ['Fairy Ring'] = { id = 143, name = 'Funguar' },
        ['Flytrap'] = { id = 142, name = 'Flytrap' },
        ['Goblin Replica'] = { id = 205, name = 'Statue' },
        ['Manifest Icon'] = { id = 205, name = 'Statue' },
        ['Nantina'] = { id = 144, name = 'Goobbue' },
        ['Nightmare Fly'] = { id = 188, name = 'Fly' },
        ['Nightmare Hippogryph'] = { id = 83, name = 'Hippogryph' },
        ['Nightmare Manticore'] = { id = 46, name = 'Manticore' },
        ['Nightmare Morbol'] = { id = 147, name = 'Morbol' },
        ['Nightmare Sabotender'] = { id = 141, name = 'Cactaur' },
        ['Nightmare Sheep'] = { id = 52, name = 'Sheep' },
        ['Stcemqestcint'] = { id = 152, name = 'Treant' },
        ['Vanguard Alchemist'] = { id = 58, name = 'Goblin' },
        ['Vanguard Ambusher'] = { id = 58, name = 'Goblin' },
        ['Vanguard Amputator'] = { id = 63, name = 'Orc' },
        ['Vanguard Armorer'] = { id = 58, name = 'Goblin' },
        ['Vanguard Assassin'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Backstabber'] = { id = 63, name = 'Orc' },
        ['Vanguard Beasttender'] = { id = 67, name = 'Quadav' },
        ['Vanguard Bugler'] = { id = 63, name = 'Orc' },
        ['Vanguard Chanter'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Constable'] = { id = 67, name = 'Quadav' },
        ['Vanguard Defender'] = { id = 67, name = 'Quadav' },
        ['Vanguard Dollmaster'] = { id = 63, name = 'Orc' },
        ['Vanguard Dragontamer'] = { id = 58, name = 'Goblin' },
        ['Vanguard Drakekeeper'] = { id = 67, name = 'Quadav' },
        ['Vanguard Enchanter'] = { id = 58, name = 'Goblin' },
        ['Vanguard Exemplar'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Footsoldier'] = { id = 63, name = 'Orc' },
        ['Vanguard Grappler'] = { id = 63, name = 'Orc' },
        ['Vanguard Gutslasher'] = { id = 63, name = 'Orc' },
        ['Vanguard Hatamoto'] = { id = 67, name = 'Quadav' },
        ['Vanguard Hawker'] = { id = 63, name = 'Orc' },
        ['Vanguard Hitman'] = { id = 58, name = 'Goblin' },
        ['Vanguard Impaler'] = { id = 63, name = 'Orc' },
        ['Vanguard Inciter'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Kusa'] = { id = 67, name = 'Quadav' },
        ['Vanguard Liberator'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Maestro'] = { id = 58, name = 'Goblin' },
        ['Vanguard Mason'] = { id = 67, name = 'Quadav' },
        ['Vanguard Mesmerizer'] = { id = 63, name = 'Orc' },
        ['Vanguard Militant'] = { id = 67, name = 'Quadav' },
        ['Vanguard Minstrel'] = { id = 67, name = 'Quadav' },
        ['Vanguard Neckchopper'] = { id = 63, name = 'Orc' },
        ['Vanguard Necromancer'] = { id = 58, name = 'Goblin' },
        ['Vanguard Ogresoother'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Oracle'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Partisan'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Pathfinder'] = { id = 58, name = 'Goblin' },
        ['Vanguard Persecutor'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Pillager'] = { id = 63, name = 'Orc' },
        ['Vanguard Pitfighter'] = { id = 58, name = 'Goblin' },
        ['Vanguard Predator'] = { id = 63, name = 'Orc' },
        ['Vanguard Prelate'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Priest'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Protector'] = { id = 67, name = 'Quadav' },
        ['Vanguard Purloiner'] = { id = 67, name = 'Quadav' },
        ['Vanguard Ronin'] = { id = 58, name = 'Goblin' },
        ['Vanguard Salvager'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Sentinel'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Shaman'] = { id = 58, name = 'Goblin' },
        ['Vanguard Skirmisher'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Smithy'] = { id = 58, name = 'Goblin' },
        ['Vanguard Thaumaturge'] = { id = 67, name = 'Quadav' },
        ['Vanguard Tinkerer'] = { id = 58, name = 'Goblin' },
        ['Vanguard Trooper'] = { id = 63, name = 'Orc' },
        ['Vanguard Undertaker'] = { id = 67, name = 'Quadav' },
        ['Vanguard Vexer'] = { id = 63, name = 'Orc' },
        ['Vanguard Vigilante'] = { id = 67, name = 'Quadav' },
        ['Vanguard Vindicator'] = { id = 67, name = 'Quadav' },
        ['Vanguard Visionary'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Welldigger'] = { id = 58, name = 'Goblin' },
        ['Warchief Tombstone'] = { id = 205, name = 'Statue' },
    },
    monsters = {
        {
            name   = 'Cirrate Christelle',
            ids    = { 1 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            tp_moves = true,
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Morbol / Plantoid', notes = { 'Source species: Morbol (ID 353); family ID 147.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 37000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The spawn uses a TP-move attack list in place of ordinary swings.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Morbol',
            ids    = { 2, 3 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Morbol / Plantoid', notes = { 'Source species: Morbol (ID 353); family ID 147.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 10000, [79] = 10000, [80] = 10000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Warchief Tombstone',
            ids    = { 4, 269, 273, 277, 281, 337, 341, 345, 349, 354 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [65] = { acc = 269, eva = 246, agi = 80, int = 90, mnd = 90, chr = 84, dex = 84, def = 262,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -50, hand_to_hand = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 10, item = 1453 },  -- montiont silverpiece
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Statue / Weapons', notes = { 'Source species: Orc Statue (ID 479); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 1000 }, mp = { [65] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 15', notes = { 'Source base speed is 15; the ordinary monster default is 40. Animation speed is 15.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 100', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Pillager',
            ids    = { 5, 355 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [75] = { acc = 333, eva = 379, agi = 107, int = 101, mnd = 76, chr = 76, dex = 115, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 338, eva = 384, agi = 107, int = 103, mnd = 77, chr = 77, dex = 115, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 344, eva = 391, agi = 110, int = 104, mnd = 78, chr = 78, dex = 117, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Impaler',
            ids    = { 6, 356 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [75] = { acc = 345, eva = 316, agi = 94, int = 82, mnd = 89, chr = 101, dex = 94, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 350, eva = 321, agi = 95, int = 82, mnd = 89, chr = 103, dex = 95, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 356, eva = 327, agi = 96, int = 84, mnd = 90, chr = 104, dex = 96, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Wyvern',
            ids    = { 7, 13, 19, 25, 357, 380, 403, 426 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [75] = { acc = 345, eva = 316, agi = 94, int = 82, mnd = 89, chr = 101, dex = 94, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 350, eva = 321, agi = 95, int = 82, mnd = 89, chr = 103, dex = 95, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 356, eva = 327, agi = 96, int = 84, mnd = 90, chr = 104, dex = 96, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Wyvern Pet / Dragon', notes = { 'Source species: Shadow Wyvern (ID 237); family ID 100.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Dollmaster',
            ids    = { 8, 358 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [75] = { acc = 320, eva = 285, agi = 94, int = 107, mnd = 107, chr = 107, dex = 89, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 290, agi = 95, int = 107, mnd = 107, chr = 107, dex = 89, def = 315,
                         attack_skill = 261 },
                [77] = { acc = 331, eva = 295, agi = 96, int = 110, mnd = 110, chr = 110, dex = 90, def = 321,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 2241, [76] = 2273, [77] = 2305 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Avatar',
            ids    = { 9, 15, 21, 27, 359, 382, 405, 428 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [75] = { acc = 326, eva = 288, agi = 101, int = 115, mnd = 89, chr = 94, dex = 101, def = 302,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 294, agi = 103, int = 115, mnd = 89, chr = 95, dex = 103, def = 307,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 299, agi = 104, int = 117, mnd = 90, chr = 96, dex = 104, def = 312,
                         attack_skill = 266 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
            weapon_dmg = { slashing = -30, piercing = -30, blunt = -30 },
            links  = 2,
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Carbuncle (ID 243); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 1000, [76] = 1000, [77] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Adamantking Effigy',
            ids    = { 10, 286, 290, 294, 298, 360, 364, 368, 372, 377 },
            nm     = true,
            levels = {
                [65] = { acc = 272, eva = 259, agi = 90, int = 74, mnd = 74, chr = 80, dex = 90, def = 274,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = -18.75, piercing = -25, blunt = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 50, item = 4248 },  -- copy of ginuvas battle theory
                { rate = 10, item = 749 },  -- mythril beastcoin
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Statue / Weapons', notes = { 'Source species: Quadav Statue (ID 480); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 1000 }, mp = { [65] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 15', notes = { 'Source base speed is 15; the ordinary monster default is 40. Animation speed is 15.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Store TP 100', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Purloiner',
            ids    = { 11, 378 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [75] = { acc = 333, eva = 379, agi = 107, int = 101, mnd = 76, chr = 76, dex = 115, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 338, eva = 384, agi = 107, int = 103, mnd = 77, chr = 77, dex = 115, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 344, eva = 391, agi = 110, int = 104, mnd = 78, chr = 78, dex = 117, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Drakekeeper',
            ids    = { 12, 379 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [75] = { acc = 345, eva = 316, agi = 94, int = 82, mnd = 89, chr = 101, dex = 94, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 350, eva = 321, agi = 95, int = 82, mnd = 89, chr = 103, dex = 95, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 356, eva = 327, agi = 96, int = 84, mnd = 90, chr = 104, dex = 96, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Undertaker',
            ids    = { 14, 381 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [75] = { acc = 320, eva = 285, agi = 94, int = 107, mnd = 107, chr = 107, dex = 89, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 290, agi = 95, int = 107, mnd = 107, chr = 107, dex = 89, def = 315,
                         attack_skill = 261 },
                [77] = { acc = 331, eva = 295, agi = 96, int = 110, mnd = 110, chr = 110, dex = 90, def = 321,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 2241, [76] = 2273, [77] = 2305 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Manifest Icon',
            ids    = { 16, 303, 307, 311, 315, 383, 387, 391, 395, 400 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [82] = { acc = 367, eva = 324, agi = 109, int = 122, mnd = 95, chr = 101, dex = 109, def = 347,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = -18.75, piercing = -25, blunt = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
                { rate = 50, item = 4248 },  -- copy of ginuvas battle theory
                { rate = 10, item = 749 },  -- mythril beastcoin
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Statue / Weapons', notes = { 'Source species: Yagudo Statue (ID 481); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 1000 }, mp = { [82] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 15', notes = { 'Source base speed is 15; the ordinary monster default is 40. Animation speed is 15.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 100', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Liberator',
            ids    = { 17, 401 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [75] = { acc = 333, eva = 379, agi = 107, int = 101, mnd = 76, chr = 76, dex = 115, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 338, eva = 384, agi = 107, int = 103, mnd = 77, chr = 77, dex = 115, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 344, eva = 391, agi = 110, int = 104, mnd = 78, chr = 78, dex = 117, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Partisan',
            ids    = { 18, 402 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [75] = { acc = 345, eva = 316, agi = 94, int = 82, mnd = 89, chr = 101, dex = 94, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 350, eva = 321, agi = 95, int = 82, mnd = 89, chr = 103, dex = 95, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 356, eva = 327, agi = 96, int = 84, mnd = 90, chr = 104, dex = 96, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Oracle',
            ids    = { 20, 404 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [75] = { acc = 320, eva = 285, agi = 94, int = 107, mnd = 107, chr = 107, dex = 89, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 290, agi = 95, int = 107, mnd = 107, chr = 107, dex = 89, def = 315,
                         attack_skill = 261 },
                [77] = { acc = 331, eva = 295, agi = 96, int = 110, mnd = 110, chr = 110, dex = 90, def = 321,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2241, [76] = 2273, [77] = 2305 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Goblin Replica',
            ids    = { 22, 320, 324, 328, 332, 406, 410, 414, 418, 423 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [65] = { acc = 264, eva = 233, agi = 80, int = 80, mnd = 102, chr = 90, dex = 74, def = 264,
                         attack_skill = 214 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = -18.75, piercing = -25, blunt = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 50, item = 4248 },  -- copy of ginuvas battle theory
                { rate = 10, item = 749 },  -- mythril beastcoin
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Statue / Weapons', notes = { 'Source species: Goblin Statue (ID 478); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 1000 }, mp = { [65] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 15', notes = { 'Source base speed is 15; the ordinary monster default is 40. Animation speed is 15.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 100; Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Welldigger',
            ids    = { 23, 424 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [75] = { acc = 333, eva = 379, agi = 107, int = 101, mnd = 76, chr = 76, dex = 115, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 338, eva = 384, agi = 107, int = 103, mnd = 77, chr = 77, dex = 115, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 344, eva = 391, agi = 110, int = 104, mnd = 78, chr = 78, dex = 117, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Dragontamer',
            ids    = { 24, 425 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [75] = { acc = 345, eva = 316, agi = 94, int = 82, mnd = 89, chr = 101, dex = 94, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 350, eva = 321, agi = 95, int = 82, mnd = 89, chr = 103, dex = 95, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 356, eva = 327, agi = 96, int = 84, mnd = 90, chr = 104, dex = 96, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Necromancer',
            ids    = { 26, 427 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [75] = { acc = 320, eva = 285, agi = 94, int = 107, mnd = 107, chr = 107, dex = 89, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 290, agi = 95, int = 107, mnd = 107, chr = 107, dex = 89, def = 315,
                         attack_skill = 261 },
                [77] = { acc = 331, eva = 295, agi = 96, int = 110, mnd = 110, chr = 110, dex = 90, def = 321,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2241, [76] = 2273, [77] = 2305 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Sabotender',
            ids    = { 28, 29, 30, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 121, 122,
                       123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140,
                       141, 142, 143, 144, 145, 146, 147, 233, 234, 235, 245, 246, 247, 257, 258, 259 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [78] = { acc = 346, eva = 326, agi = 84, int = 78, mnd = 96, chr = 92, dex = 110, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 352, eva = 331, agi = 85, int = 79, mnd = 99, chr = 93, dex = 112, def = 349,
                         attack_skill = 276 },
                [80] = { acc = 357, eva = 336, agi = 85, int = 79, mnd = 99, chr = 93, dex = 112, def = 354,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15482, 1 },  -- bards cape
                    { 15484, 1 },  -- summoners cape
                    { 15871, 1 },  -- warriors stone
                    { 15877, 1 },  -- koga sarashi
                } },
                { rate = 50, group = {  -- one of
                    { 2033, 1 },  -- warriors mask -1
                    { 2038, 1 },  -- melee crown -1
                    { 2043, 1 },  -- clerics cap -1
                    { 2048, 1 },  -- sorcerers petasos -1
                    { 2053, 1 },  -- duelists chapeau -1
                    { 2058, 1 },  -- assassins bonnet -1
                    { 2063, 1 },  -- valor coronet -1
                    { 2068, 1 },  -- abyss burgeonet -1
                    { 2073, 1 },  -- monster helm -1
                    { 2078, 1 },  -- bards roundlet -1
                    { 2083, 1 },  -- scouts beret -1
                    { 2088, 1 },  -- saotome kabuto -1
                    { 2093, 1 },  -- koga hatsuburi -1
                    { 2098, 1 },  -- wyrm armet -1
                    { 2103, 1 },  -- summoners horn -1
                } },
                { rate = 10, group = {  -- one of
                    { 2662, 1 },  -- mirage keffiyeh -1
                    { 2667, 1 },  -- commodore tricorne -1
                    { 2672, 1 },  -- pantin taj -1
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Cactaur / Plantoid', notes = { 'Source species: Sabotender (ID 334); family ID 141.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5180, [79] = 5180, [80] = 5180 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Manticore',
            ids    = { 31, 32, 33, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 148,
                       149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166,
                       167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 248, 249, 250, 251, 252, 253, 254,
                       255, 256 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15480, 1 },  -- assassins cape
                    { 15872, 1 },  -- clerics belt
                    { 15874, 1 },  -- sorcerers belt
                    { 15875, 1 },  -- monster belt
                    { 15879, 1 },  -- saotome koshi-ate
                } },
                { rate = 50, group = {  -- one of
                    { 2033, 1 },  -- warriors mask -1
                    { 2038, 1 },  -- melee crown -1
                    { 2043, 1 },  -- clerics cap -1
                    { 2048, 1 },  -- sorcerers petasos -1
                    { 2053, 1 },  -- duelists chapeau -1
                    { 2058, 1 },  -- assassins bonnet -1
                    { 2063, 1 },  -- valor coronet -1
                    { 2068, 1 },  -- abyss burgeonet -1
                    { 2073, 1 },  -- monster helm -1
                    { 2078, 1 },  -- bards roundlet -1
                    { 2083, 1 },  -- scouts beret -1
                    { 2088, 1 },  -- saotome kabuto -1
                    { 2093, 1 },  -- koga hatsuburi -1
                    { 2098, 1 },  -- wyrm armet -1
                    { 2103, 1 },  -- summoners horn -1
                } },
                { rate = 1000, group = {  -- one of
                    { 2662, 1 },  -- mirage keffiyeh -1
                    { 2667, 1 },  -- commodore tricorne -1
                    { 2672, 1 },  -- pantin taj -1
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Manticore / Beast', notes = { 'Source species: Manticore (ID 98); family ID 46.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 7500, [79] = 7500, [80] = 7500 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 75', notes = { 'Source base speed is 75; the ordinary monster default is 40. Animation speed is 75.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 360 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Hippogryph',
            ids    = { 34, 35, 36, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 178, 179,
                       180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197,
                       198, 199, 200, 201, 202, 203, 204, 236, 237, 238, 239, 240, 241, 242, 243, 244 },
            nm     = true,
            job    = 'war/war',
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = 3, earth = -3, thunder = 3, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = 3, slow = -3, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 3, gravity = 3 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15482, 1 },  -- bards cape
                    { 15484, 1 },  -- summoners cape
                    { 15871, 1 },  -- warriors stone
                    { 15877, 1 },  -- koga sarashi
                } },
                { rate = 50, group = {  -- one of
                    { 2033, 1 },  -- warriors mask -1
                    { 2038, 1 },  -- melee crown -1
                    { 2043, 1 },  -- clerics cap -1
                    { 2048, 1 },  -- sorcerers petasos -1
                    { 2053, 1 },  -- duelists chapeau -1
                    { 2058, 1 },  -- assassins bonnet -1
                    { 2063, 1 },  -- valor coronet -1
                    { 2068, 1 },  -- abyss burgeonet -1
                    { 2073, 1 },  -- monster helm -1
                    { 2078, 1 },  -- bards roundlet -1
                    { 2083, 1 },  -- scouts beret -1
                    { 2088, 1 },  -- saotome kabuto -1
                    { 2093, 1 },  -- koga hatsuburi -1
                    { 2098, 1 },  -- wyrm armet -1
                    { 2103, 1 },  -- summoners horn -1
                } },
                { rate = 10, group = {  -- one of
                    { 2662, 1 },  -- mirage keffiyeh -1
                    { 2667, 1 },  -- commodore tricorne -1
                    { 2672, 1 },  -- pantin taj -1
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Hippogryph / Bird', notes = { 'Source species: Hippogryph (ID 187); family ID 83.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 4000, [79] = 4000, [80] = 4000 }, mp = { [78] = 1143, [79] = 1159, [80] = 1176 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 210 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Sheep',
            ids    = { 37, 38, 39, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118,
                       119, 120, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220,
                       221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 260, 261, 262, 263, 264, 265,
                       266, 267, 268 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15482, 1 },  -- bards cape
                    { 15484, 1 },  -- summoners cape
                    { 15871, 1 },  -- warriors stone
                    { 15877, 1 },  -- koga sarashi
                } },
                { rate = 50, group = {  -- one of
                    { 2033, 1 },  -- warriors mask -1
                    { 2038, 1 },  -- melee crown -1
                    { 2043, 1 },  -- clerics cap -1
                    { 2048, 1 },  -- sorcerers petasos -1
                    { 2053, 1 },  -- duelists chapeau -1
                    { 2058, 1 },  -- assassins bonnet -1
                    { 2063, 1 },  -- valor coronet -1
                    { 2068, 1 },  -- abyss burgeonet -1
                    { 2073, 1 },  -- monster helm -1
                    { 2078, 1 },  -- bards roundlet -1
                    { 2083, 1 },  -- scouts beret -1
                    { 2088, 1 },  -- saotome kabuto -1
                    { 2093, 1 },  -- koga hatsuburi -1
                    { 2098, 1 },  -- wyrm armet -1
                    { 2103, 1 },  -- summoners horn -1
                } },
                { rate = 10, group = {  -- one of
                    { 2662, 1 },  -- mirage keffiyeh -1
                    { 2667, 1 },  -- commodore tricorne -1
                    { 2672, 1 },  -- pantin taj -1
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Sheep / Beast', notes = { 'Source species: Sheep (ID 111); family ID 52.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Stcemqestcint',
            ids    = { 40 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 435,
                         attack_skill = 293 },
            },
            tp_moves = true,
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2033, 1 },  -- warriors mask -1
                    { 2038, 1 },  -- melee crown -1
                    { 2043, 1 },  -- clerics cap -1
                    { 2048, 1 },  -- sorcerers petasos -1
                    { 2053, 1 },  -- duelists chapeau -1
                    { 2058, 1 },  -- assassins bonnet -1
                    { 2063, 1 },  -- valor coronet -1
                    { 2068, 1 },  -- abyss burgeonet -1
                    { 2073, 1 },  -- monster helm -1
                    { 2078, 1 },  -- bards roundlet -1
                    { 2083, 1 },  -- scouts beret -1
                    { 2088, 1 },  -- saotome kabuto -1
                    { 2093, 1 },  -- koga hatsuburi -1
                    { 2098, 1 },  -- wyrm armet -1
                    { 2103, 1 },  -- summoners horn -1
                } },
                { rate = 1000, group = {  -- one of
                    { 2662, 1 },  -- mirage keffiyeh -1
                    { 2667, 1 },  -- commodore tricorne -1
                    { 2672, 1 },  -- pantin taj -1
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 3,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Treant / Plantoid', notes = { 'Source species: Treant (ID 366); family ID 152.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The spawn uses a TP-move attack list in place of ordinary swings.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Flytrap',
            ids    = { 41, 42, 43 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
            },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Flytrap / Plantoid', notes = { 'Source species: Flytrap (ID 336); family ID 142.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nantina',
            ids    = { 44 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [82] = { acc = 370, eva = 347, agi = 88, int = 82, mnd = 101, chr = 95, dex = 115, def = 364,
                         attack_skill = 293 },
            },
            tp_moves = true,
            counters = true,
            ranks  = { fire = -2, dark = -2, dark_sleep = -2, blind = -2 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2033, 1 },  -- warriors mask -1
                    { 2038, 1 },  -- melee crown -1
                    { 2043, 1 },  -- clerics cap -1
                    { 2048, 1 },  -- sorcerers petasos -1
                    { 2053, 1 },  -- duelists chapeau -1
                    { 2058, 1 },  -- assassins bonnet -1
                    { 2063, 1 },  -- valor coronet -1
                    { 2068, 1 },  -- abyss burgeonet -1
                    { 2073, 1 },  -- monster helm -1
                    { 2078, 1 },  -- bards roundlet -1
                    { 2083, 1 },  -- scouts beret -1
                    { 2088, 1 },  -- saotome kabuto -1
                    { 2093, 1 },  -- koga hatsuburi -1
                    { 2098, 1 },  -- wyrm armet -1
                    { 2103, 1 },  -- summoners horn -1
                } },
                { rate = 1000, group = {  -- one of
                    { 2662, 1 },  -- mirage keffiyeh -1
                    { 2667, 1 },  -- commodore tricorne -1
                    { 2672, 1 },  -- pantin taj -1
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 4,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goobbue / Plantoid', notes = { 'Source species: Goobbue (ID 340); family ID 144.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20180 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 480 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.', 'The spawn uses a TP-move attack list in place of ordinary swings.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Fairy Ring',
            ids    = { 45 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            tp_moves = true,
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2033, 1 },  -- warriors mask -1
                    { 2038, 1 },  -- melee crown -1
                    { 2043, 1 },  -- clerics cap -1
                    { 2048, 1 },  -- sorcerers petasos -1
                    { 2053, 1 },  -- duelists chapeau -1
                    { 2058, 1 },  -- assassins bonnet -1
                    { 2063, 1 },  -- valor coronet -1
                    { 2068, 1 },  -- abyss burgeonet -1
                    { 2073, 1 },  -- monster helm -1
                    { 2078, 1 },  -- bards roundlet -1
                    { 2083, 1 },  -- scouts beret -1
                    { 2088, 1 },  -- saotome kabuto -1
                    { 2093, 1 },  -- koga hatsuburi -1
                    { 2098, 1 },  -- wyrm armet -1
                    { 2103, 1 },  -- summoners horn -1
                } },
                { rate = 10, group = {  -- one of
                    { 2662, 1 },  -- mirage keffiyeh -1
                    { 2667, 1 },  -- commodore tricorne -1
                    { 2672, 1 },  -- pantin taj -1
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 5,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Funguar / Plantoid', notes = { 'Source species: Funguar (ID 338); family ID 143.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The spawn uses a TP-move attack list in place of ordinary swings.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Fly',
            ids    = { 46, 47, 48 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15481, 1 },  -- valor cape
                    { 15920, 1 },  -- commodore belt
                    { 16244, 1 },  -- mirage mantle
                } },
                { rate = 50, group = {  -- one of
                    { 2033, 1 },  -- warriors mask -1
                    { 2038, 1 },  -- melee crown -1
                    { 2043, 1 },  -- clerics cap -1
                    { 2048, 1 },  -- sorcerers petasos -1
                    { 2053, 1 },  -- duelists chapeau -1
                    { 2058, 1 },  -- assassins bonnet -1
                    { 2063, 1 },  -- valor coronet -1
                    { 2068, 1 },  -- abyss burgeonet -1
                    { 2073, 1 },  -- monster helm -1
                    { 2078, 1 },  -- bards roundlet -1
                    { 2083, 1 },  -- scouts beret -1
                    { 2088, 1 },  -- saotome kabuto -1
                    { 2093, 1 },  -- koga hatsuburi -1
                    { 2098, 1 },  -- wyrm armet -1
                    { 2103, 1 },  -- summoners horn -1
                } },
                { rate = 10, group = {  -- one of
                    { 2662, 1 },  -- mirage keffiyeh -1
                    { 2667, 1 },  -- commodore tricorne -1
                    { 2672, 1 },  -- pantin taj -1
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Fly / Vermin', notes = { 'Source species: Fly (ID 444); family ID 188.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Footsoldier',
            ids    = { 270, 338 },
            nm     = true,
            levels = {
                [75] = { acc = 326, eva = 312, agi = 101, int = 82, mnd = 82, chr = 89, dex = 101, def = 327,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 317, agi = 103, int = 82, mnd = 82, chr = 89, dex = 103, def = 331,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 323, agi = 104, int = 84, mnd = 84, chr = 90, dex = 104, def = 337,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Predator',
            ids    = { 271, 339 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [75] = { acc = 371, eva = 295, agi = 115, int = 89, mnd = 94, chr = 89, dex = 94, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 376, eva = 300, agi = 115, int = 89, mnd = 95, chr = 89, dex = 95, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 382, eva = 305, agi = 117, int = 90, mnd = 96, chr = 90, dex = 96, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Vexer',
            ids    = { 272, 340 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 302, agi = 89, int = 103, mnd = 103, chr = 95, dex = 95, def = 318,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 307, agi = 90, int = 104, mnd = 104, chr = 96, dex = 96, def = 324,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Amputator',
            ids    = { 274, 342 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [75] = { acc = 317, eva = 282, agi = 89, int = 89, mnd = 115, chr = 101, dex = 82, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 322, eva = 287, agi = 89, int = 89, mnd = 115, chr = 103, dex = 82, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 328, eva = 292, agi = 90, int = 90, mnd = 117, chr = 104, dex = 84, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Backstabber',
            ids    = { 275, 343 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [75] = { acc = 329, eva = 331, agi = 107, int = 94, mnd = 76, chr = 82, dex = 107, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 334, eva = 336, agi = 107, int = 95, mnd = 77, chr = 82, dex = 107, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 341, eva = 343, agi = 110, int = 96, mnd = 78, chr = 84, dex = 110, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { bind = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Grappler',
            ids    = { 276, 344 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [75] = { acc = 329, eva = 310, agi = 82, int = 76, mnd = 94, chr = 89, dex = 107, def = 327,
                         attack_skill = 256 },
                [76] = { acc = 334, eva = 315, agi = 82, int = 77, mnd = 95, chr = 89, dex = 107, def = 331,
                         attack_skill = 261 },
                [77] = { acc = 341, eva = 321, agi = 84, int = 78, mnd = 96, chr = 90, dex = 110, def = 337,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4389, [76] = 4389, [77] = 4389 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Trooper',
            ids    = { 278, 346 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [75] = { acc = 320, eva = 300, agi = 76, int = 76, mnd = 101, chr = 101, dex = 89, def = 375,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 304, agi = 77, int = 77, mnd = 103, chr = 103, dex = 89, def = 379,
                         attack_skill = 261 },
                [77] = { acc = 331, eva = 310, agi = 78, int = 78, mnd = 104, chr = 104, dex = 90, def = 385,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Mesmerizer',
            ids    = { 279, 347 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [75] = { acc = 326, eva = 288, agi = 101, int = 115, mnd = 89, chr = 94, dex = 101, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 294, agi = 103, int = 115, mnd = 89, chr = 95, dex = 103, def = 315,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 299, agi = 104, int = 117, mnd = 90, chr = 96, dex = 104, def = 321,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Gutslasher',
            ids    = { 280, 348 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [75] = { acc = 326, eva = 316, agi = 94, int = 89, mnd = 89, chr = 94, dex = 101, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 321, agi = 95, int = 89, mnd = 89, chr = 95, dex = 103, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 327, agi = 96, int = 90, mnd = 90, chr = 96, dex = 104, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Hawker',
            ids    = { 282, 350 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [75] = { acc = 326, eva = 303, agi = 82, int = 89, mnd = 89, chr = 115, dex = 101, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 307, agi = 82, int = 89, mnd = 89, chr = 115, dex = 103, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 313, agi = 84, int = 90, mnd = 90, chr = 117, dex = 104, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { slow = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Hecteyes',
            ids    = { 283, 351 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 307, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 312, agi = 89, int = 103, mnd = 103, chr = 95, dex = 95, def = 318,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 317, agi = 90, int = 104, mnd = 104, chr = 96, dex = 96, def = 324,
                         attack_skill = 266 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            resist = { silence = 15 },
            weapon_dmg = { blunt = -25, hand_to_hand = -25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Hecteyes / Amorph', notes = { 'Source species: Hecteye (ID 7); family ID 4.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 1000, [76] = 1000, [77] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 280', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Bugler',
            ids    = { 284, 352 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [75] = { acc = 323, eva = 294, agi = 82, int = 94, mnd = 94, chr = 107, dex = 94, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 299, agi = 82, int = 95, mnd = 95, chr = 107, dex = 95, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 304, agi = 84, int = 96, mnd = 96, chr = 110, dex = 96, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Neckchopper',
            ids    = { 285, 353 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [75] = { acc = 326, eva = 309, agi = 94, int = 101, mnd = 76, chr = 76, dex = 101, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 313, agi = 95, int = 103, mnd = 77, chr = 77, dex = 103, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 319, agi = 96, int = 104, mnd = 78, chr = 78, dex = 104, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200, [76] = 4200, [77] = 4200 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Vindicator',
            ids    = { 287, 361 },
            nm     = true,
            levels = {
                [75] = { acc = 326, eva = 312, agi = 101, int = 82, mnd = 82, chr = 89, dex = 101, def = 327,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 317, agi = 103, int = 82, mnd = 82, chr = 89, dex = 103, def = 331,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 323, agi = 104, int = 84, mnd = 84, chr = 90, dex = 104, def = 337,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Mason',
            ids    = { 288, 362 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [75] = { acc = 371, eva = 295, agi = 115, int = 89, mnd = 94, chr = 89, dex = 94, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 376, eva = 300, agi = 115, int = 89, mnd = 95, chr = 89, dex = 95, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 382, eva = 305, agi = 117, int = 90, mnd = 96, chr = 90, dex = 96, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Protector',
            ids    = { 289, 363 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 302, agi = 89, int = 103, mnd = 103, chr = 95, dex = 95, def = 318,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 307, agi = 90, int = 104, mnd = 104, chr = 96, dex = 96, def = 324,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Constable',
            ids    = { 291, 365 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [75] = { acc = 317, eva = 282, agi = 89, int = 89, mnd = 115, chr = 101, dex = 82, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 322, eva = 287, agi = 89, int = 89, mnd = 115, chr = 103, dex = 82, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 328, eva = 292, agi = 90, int = 90, mnd = 117, chr = 104, dex = 84, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Kusa',
            ids    = { 292, 366 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [75] = { acc = 329, eva = 331, agi = 107, int = 94, mnd = 76, chr = 82, dex = 107, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 334, eva = 336, agi = 107, int = 95, mnd = 77, chr = 82, dex = 107, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 341, eva = 343, agi = 110, int = 96, mnd = 78, chr = 84, dex = 110, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { bind = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Militant',
            ids    = { 293, 367 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [75] = { acc = 329, eva = 310, agi = 82, int = 76, mnd = 94, chr = 89, dex = 107, def = 327,
                         attack_skill = 256 },
                [76] = { acc = 334, eva = 315, agi = 82, int = 77, mnd = 95, chr = 89, dex = 107, def = 331,
                         attack_skill = 261 },
                [77] = { acc = 341, eva = 321, agi = 84, int = 78, mnd = 96, chr = 90, dex = 110, def = 337,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3762, [76] = 3762, [77] = 3762 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Defender',
            ids    = { 295, 369 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [75] = { acc = 320, eva = 300, agi = 76, int = 76, mnd = 101, chr = 101, dex = 89, def = 375,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 304, agi = 77, int = 77, mnd = 103, chr = 103, dex = 89, def = 379,
                         attack_skill = 261 },
                [77] = { acc = 331, eva = 310, agi = 78, int = 78, mnd = 104, chr = 104, dex = 90, def = 385,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Thaumaturge',
            ids    = { 296, 370 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [75] = { acc = 326, eva = 288, agi = 101, int = 115, mnd = 89, chr = 94, dex = 101, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 294, agi = 103, int = 115, mnd = 89, chr = 95, dex = 103, def = 315,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 299, agi = 104, int = 117, mnd = 90, chr = 96, dex = 104, def = 321,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Hatamoto',
            ids    = { 297, 371 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [75] = { acc = 326, eva = 316, agi = 94, int = 89, mnd = 89, chr = 94, dex = 101, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 321, agi = 95, int = 89, mnd = 89, chr = 95, dex = 103, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 327, agi = 96, int = 90, mnd = 90, chr = 96, dex = 104, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Minstrel',
            ids    = { 299, 373 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [75] = { acc = 323, eva = 294, agi = 82, int = 94, mnd = 94, chr = 107, dex = 94, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 299, agi = 82, int = 95, mnd = 95, chr = 107, dex = 95, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 304, agi = 84, int = 96, mnd = 96, chr = 110, dex = 96, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Beasttender',
            ids    = { 300, 374 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [75] = { acc = 326, eva = 303, agi = 82, int = 89, mnd = 89, chr = 115, dex = 101, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 307, agi = 82, int = 89, mnd = 89, chr = 115, dex = 103, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 313, agi = 84, int = 90, mnd = 90, chr = 117, dex = 104, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { slow = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Scorpion',
            ids    = { 301, 375 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 302, agi = 89, int = 103, mnd = 103, chr = 95, dex = 95, def = 318,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 307, agi = 90, int = 104, mnd = 104, chr = 96, dex = 96, def = 324,
                         attack_skill = 266 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            resist = { silence = 15 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Scorpion / Vermin', notes = { 'Source species: Scorpion (ID 460); family ID 194.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 1000, [76] = 1000, [77] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Vigilante',
            ids    = { 302, 376 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [75] = { acc = 326, eva = 309, agi = 94, int = 101, mnd = 76, chr = 76, dex = 101, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 313, agi = 95, int = 103, mnd = 77, chr = 77, dex = 103, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 319, agi = 96, int = 104, mnd = 78, chr = 78, dex = 104, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600, [76] = 3600, [77] = 3600 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Skirmisher',
            ids    = { 304, 384 },
            nm     = true,
            levels = {
                [75] = { acc = 326, eva = 312, agi = 101, int = 82, mnd = 82, chr = 89, dex = 101, def = 327,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 317, agi = 103, int = 82, mnd = 82, chr = 89, dex = 103, def = 331,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 323, agi = 104, int = 84, mnd = 84, chr = 90, dex = 104, def = 337,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Salvager',
            ids    = { 305, 385 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [75] = { acc = 371, eva = 295, agi = 115, int = 89, mnd = 94, chr = 89, dex = 94, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 376, eva = 300, agi = 115, int = 89, mnd = 95, chr = 89, dex = 95, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 382, eva = 305, agi = 117, int = 90, mnd = 96, chr = 90, dex = 96, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Visionary',
            ids    = { 306, 386 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 302, agi = 89, int = 103, mnd = 103, chr = 95, dex = 95, def = 318,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 307, agi = 90, int = 104, mnd = 104, chr = 96, dex = 96, def = 324,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Priest',
            ids    = { 308, 388 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [75] = { acc = 317, eva = 282, agi = 89, int = 89, mnd = 115, chr = 101, dex = 82, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 322, eva = 287, agi = 89, int = 89, mnd = 115, chr = 103, dex = 82, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 328, eva = 292, agi = 90, int = 90, mnd = 117, chr = 104, dex = 84, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Assassin',
            ids    = { 309, 389 },
            nm     = true,
            job    = 'nin/war',
            levels = {
                [75] = { acc = 328, eva = 330, agi = 105, int = 90, mnd = 78, chr = 84, dex = 105, def = 329,
                         attack_skill = 256 },
                [76] = { acc = 334, eva = 336, agi = 106, int = 91, mnd = 79, chr = 84, dex = 106, def = 334,
                         attack_skill = 261 },
                [77] = { acc = 340, eva = 342, agi = 108, int = 92, mnd = 80, chr = 86, dex = 108, def = 339,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { virus = 25, bind = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Sentinel',
            ids    = { 310, 390 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [75] = { acc = 329, eva = 310, agi = 82, int = 76, mnd = 94, chr = 89, dex = 107, def = 327,
                         attack_skill = 256 },
                [76] = { acc = 334, eva = 315, agi = 82, int = 77, mnd = 95, chr = 89, dex = 107, def = 331,
                         attack_skill = 261 },
                [77] = { acc = 341, eva = 321, agi = 84, int = 78, mnd = 96, chr = 90, dex = 110, def = 337,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4180, [76] = 4180, [77] = 4180 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Exemplar',
            ids    = { 312, 392 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [75] = { acc = 320, eva = 300, agi = 76, int = 76, mnd = 101, chr = 101, dex = 89, def = 375,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 304, agi = 77, int = 77, mnd = 103, chr = 103, dex = 89, def = 379,
                         attack_skill = 261 },
                [77] = { acc = 331, eva = 310, agi = 78, int = 78, mnd = 104, chr = 104, dex = 90, def = 385,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Prelate',
            ids    = { 313, 393 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [75] = { acc = 326, eva = 288, agi = 101, int = 115, mnd = 89, chr = 94, dex = 101, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 294, agi = 103, int = 115, mnd = 89, chr = 95, dex = 103, def = 315,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 299, agi = 104, int = 117, mnd = 90, chr = 96, dex = 104, def = 321,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Persecutor',
            ids    = { 314, 394 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [75] = { acc = 326, eva = 316, agi = 94, int = 89, mnd = 89, chr = 94, dex = 101, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 321, agi = 95, int = 89, mnd = 89, chr = 95, dex = 103, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 327, agi = 96, int = 90, mnd = 90, chr = 96, dex = 104, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Chanter',
            ids    = { 316, 396 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [75] = { acc = 323, eva = 294, agi = 82, int = 94, mnd = 94, chr = 107, dex = 94, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 299, agi = 82, int = 95, mnd = 95, chr = 107, dex = 95, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 304, agi = 84, int = 96, mnd = 96, chr = 110, dex = 96, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Ogresoother',
            ids    = { 317, 397 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [75] = { acc = 326, eva = 303, agi = 82, int = 89, mnd = 89, chr = 115, dex = 101, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 307, agi = 82, int = 89, mnd = 89, chr = 115, dex = 103, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 313, agi = 84, int = 90, mnd = 90, chr = 117, dex = 104, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { slow = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Crow',
            ids    = { 318, 398 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 302, agi = 89, int = 103, mnd = 103, chr = 95, dex = 95, def = 318,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 307, agi = 90, int = 104, mnd = 104, chr = 96, dex = 96, def = 324,
                         attack_skill = 266 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { silence = 15 },
            weapon_dmg = { piercing = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Bird / Bird', notes = { 'Source species: Bird (ID 175); family ID 78.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 1000, [76] = 1000, [77] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Inciter',
            ids    = { 319, 399 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [75] = { acc = 326, eva = 309, agi = 94, int = 101, mnd = 76, chr = 76, dex = 101, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 313, agi = 95, int = 103, mnd = 77, chr = 77, dex = 103, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 319, agi = 96, int = 104, mnd = 78, chr = 78, dex = 104, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Smithy',
            ids    = { 321, 407 },
            nm     = true,
            levels = {
                [75] = { acc = 326, eva = 312, agi = 101, int = 82, mnd = 82, chr = 89, dex = 101, def = 327,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 317, agi = 103, int = 82, mnd = 82, chr = 89, dex = 103, def = 331,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 323, agi = 104, int = 84, mnd = 84, chr = 90, dex = 104, def = 337,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Ambusher',
            ids    = { 322, 408 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [75] = { acc = 371, eva = 295, agi = 115, int = 89, mnd = 94, chr = 89, dex = 94, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 376, eva = 300, agi = 115, int = 89, mnd = 95, chr = 89, dex = 95, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 382, eva = 305, agi = 117, int = 90, mnd = 96, chr = 90, dex = 96, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Enchanter',
            ids    = { 323, 409 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 302, agi = 89, int = 103, mnd = 103, chr = 95, dex = 95, def = 318,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 307, agi = 90, int = 104, mnd = 104, chr = 96, dex = 96, def = 324,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Alchemist',
            ids    = { 325, 411 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [75] = { acc = 317, eva = 282, agi = 89, int = 89, mnd = 115, chr = 101, dex = 82, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 322, eva = 287, agi = 89, int = 89, mnd = 115, chr = 103, dex = 82, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 328, eva = 292, agi = 90, int = 90, mnd = 117, chr = 104, dex = 84, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Hitman',
            ids    = { 326, 412 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [75] = { acc = 329, eva = 331, agi = 107, int = 94, mnd = 76, chr = 82, dex = 107, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 334, eva = 336, agi = 107, int = 95, mnd = 77, chr = 82, dex = 107, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 341, eva = 343, agi = 110, int = 96, mnd = 78, chr = 84, dex = 110, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { bind = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Pitfighter',
            ids    = { 327, 413 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [75] = { acc = 329, eva = 310, agi = 82, int = 76, mnd = 94, chr = 89, dex = 107, def = 327,
                         attack_skill = 256 },
                [76] = { acc = 334, eva = 315, agi = 82, int = 77, mnd = 95, chr = 89, dex = 107, def = 331,
                         attack_skill = 261 },
                [77] = { acc = 341, eva = 321, agi = 84, int = 78, mnd = 96, chr = 90, dex = 110, def = 337,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4180, [76] = 4180, [77] = 4180 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Armorer',
            ids    = { 329, 415 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [75] = { acc = 320, eva = 300, agi = 76, int = 76, mnd = 101, chr = 101, dex = 89, def = 375,
                         attack_skill = 256 },
                [76] = { acc = 325, eva = 304, agi = 77, int = 77, mnd = 103, chr = 103, dex = 89, def = 379,
                         attack_skill = 261 },
                [77] = { acc = 331, eva = 310, agi = 78, int = 78, mnd = 104, chr = 104, dex = 90, def = 385,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Shaman',
            ids    = { 330, 416 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [75] = { acc = 326, eva = 288, agi = 101, int = 115, mnd = 89, chr = 94, dex = 101, def = 311,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 294, agi = 103, int = 115, mnd = 89, chr = 95, dex = 103, def = 315,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 299, agi = 104, int = 117, mnd = 90, chr = 96, dex = 104, def = 321,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Ronin',
            ids    = { 331, 417 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [75] = { acc = 326, eva = 316, agi = 94, int = 89, mnd = 89, chr = 94, dex = 101, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 321, agi = 95, int = 89, mnd = 89, chr = 95, dex = 103, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 327, agi = 96, int = 90, mnd = 90, chr = 96, dex = 104, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Maestro',
            ids    = { 333, 419 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [75] = { acc = 323, eva = 294, agi = 82, int = 94, mnd = 94, chr = 107, dex = 94, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 299, agi = 82, int = 95, mnd = 95, chr = 107, dex = 95, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 304, agi = 84, int = 96, mnd = 96, chr = 110, dex = 96, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Pathfinder',
            ids    = { 334, 420 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [75] = { acc = 326, eva = 303, agi = 82, int = 89, mnd = 89, chr = 115, dex = 101, def = 317,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 307, agi = 82, int = 89, mnd = 89, chr = 115, dex = 103, def = 321,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 313, agi = 84, int = 90, mnd = 90, chr = 117, dex = 104, def = 327,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { slow = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Slime',
            ids    = { 335, 421 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
                [76] = { acc = 328, eva = 302, agi = 89, int = 103, mnd = 103, chr = 95, dex = 95, def = 318,
                         attack_skill = 261 },
                [77] = { acc = 334, eva = 307, agi = 90, int = 104, mnd = 104, chr = 96, dex = 96, def = 324,
                         attack_skill = 266 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            resist = { silence = 15 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -75, hand_to_hand = -75 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Slime / Amorph', notes = { 'Source species: Slime (ID 18); family ID 8.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 1000, [76] = 1000, [77] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Tinkerer',
            ids    = { 336, 422 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [75] = { acc = 326, eva = 309, agi = 94, int = 101, mnd = 76, chr = 76, dex = 101, def = 320,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 313, agi = 95, int = 103, mnd = 77, chr = 77, dex = 103, def = 325,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 319, agi = 96, int = 104, mnd = 78, chr = 78, dex = 104, def = 331,
                         attack_skill = 266 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 15077, 1 },  -- assassins bonnet
                    { 15080, 1 },  -- monster helm
                    { 15112, 1 },  -- scouts bracers
                    { 15129, 1 },  -- koga hakama
                    { 15130, 1 },  -- wyrm brais
                    { 15131, 1 },  -- summoners spats
                    { 15132, 1 },  -- warriors calligae
                    { 15133, 1 },  -- melee gaiters
                    { 15134, 1 },  -- clerics duckbills
                    { 15135, 1 },  -- sorcerers sabots
                    { 15136, 1 },  -- duelists boots
                    { 15138, 1 },  -- valor leggings
                    { 15139, 1 },  -- abyss sollerets
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                } },
                { rate = 10, group = {  -- one of
                    { 11382, 1 },  -- mirage charuqs
                    { 16349, 1 },  -- commodore trews
                    { 16352, 1 },  -- pantin churidars
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
