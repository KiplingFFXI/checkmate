-- Direct equipped bonuses only. Stats and skills are already in client totals.
-- Conditional bonuses are named, never assumed active.
return {
    buffs = {
        flash = 156,
        food = 251,
        mighty_strikes = 44,
        sneak_attack = 65,
        trick_attack = 87,
        troubadour = 348,
    },
    built = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    effects = {
        [5] = {
            evade = true,
            name = 'blindness',
        },
        [12] = {
            hit = true,
            name = 'weight',
        },
        [21] = {
            name = 'addle',
            own_magic = true,
        },
        [44] = {
            crittaken = true,
            name = 'mighty strikes',
            own_crit = true,
        },
        [58] = {
            hit = true,
            name = 'aggressor',
        },
        [59] = {
            evade = true,
            name = 'focus',
        },
        [60] = {
            hit = true,
            name = 'dodge',
        },
        [63] = {
            evade = true,
            name = 'souleater',
        },
        [81] = {
            crittaken = true,
            evade = true,
            name = 'dex boost',
        },
        [83] = {
            crit = true,
            hit = true,
            name = 'agi boost',
        },
        [84] = {
            magic = true,
            name = 'int boost',
        },
        [85] = {
            magic = true,
            name = 'mnd boost',
        },
        [86] = {
            magic = true,
            name = 'chr boost',
        },
        [90] = {
            evade = true,
            name = 'accuracy boost',
        },
        [92] = {
            hit = true,
            name = 'evasion boost',
        },
        [100] = {
            magic = true,
            name = 'barfire',
        },
        [101] = {
            magic = true,
            name = 'barblizzard',
        },
        [102] = {
            magic = true,
            name = 'baraero',
        },
        [103] = {
            magic = true,
            name = 'barstone',
        },
        [104] = {
            magic = true,
            name = 'barthunder',
        },
        [105] = {
            magic = true,
            name = 'barwater',
        },
        [106] = {
            magic = true,
            name = 'barsleep',
        },
        [107] = {
            magic = true,
            name = 'barpoison',
        },
        [108] = {
            magic = true,
            name = 'barparalyze',
        },
        [109] = {
            magic = true,
            name = 'barblind',
        },
        [110] = {
            magic = true,
            name = 'barsilence',
        },
        [111] = {
            magic = true,
            name = 'barpetrify',
        },
        [112] = {
            magic = true,
            name = 'barvirus',
        },
        [120] = {
            crittaken = true,
            evade = true,
            name = 'dex boost ii',
        },
        [122] = {
            crit = true,
            hit = true,
            name = 'agi boost ii',
        },
        [123] = {
            magic = true,
            name = 'int boost ii',
        },
        [124] = {
            magic = true,
            name = 'mnd boost ii',
        },
        [125] = {
            magic = true,
            name = 'chr boost ii',
        },
        [126] = {
            evade = true,
            name = 'spirit surge',
        },
        [128] = {
            magic = true,
            name = 'burn',
        },
        [129] = {
            crit = true,
            hit = true,
            name = 'frost',
        },
        [131] = {
            crittaken = true,
            evade = true,
            name = 'rasp',
        },
        [132] = {
            magic = true,
            name = 'shock',
        },
        [137] = {
            crittaken = true,
            evade = true,
            name = 'dex down',
        },
        [139] = {
            crit = true,
            hit = true,
            name = 'agi down',
        },
        [140] = {
            magic = true,
            name = 'int down',
        },
        [141] = {
            magic = true,
            name = 'mnd down',
        },
        [142] = {
            magic = true,
            name = 'chr down',
        },
        [146] = {
            evade = true,
            name = 'accuracy down',
        },
        [148] = {
            hit = true,
            name = 'evasion down',
        },
        [156] = {
            evade = true,
            name = 'flash',
        },
        [166] = {
            evade = true,
            hit = true,
            name = 'overdrive',
        },
        [169] = {
            crittaken = true,
            name = 'potency',
            own_crit = true,
        },
        [172] = {
            name = 'intension',
            own_magic = true,
        },
        [174] = {
            name = 'magic acc down',
            own_magic = true,
        },
        [179] = {
            magic = true,
            name = 'hailstorm',
        },
        [180] = {
            crit = true,
            hit = true,
            name = 'windstorm',
        },
        [182] = {
            crittaken = true,
            evade = true,
            name = 'thunderstorm',
        },
        [183] = {
            magic = true,
            name = 'rainstorm',
        },
        [184] = {
            magic = true,
            name = 'aurorastorm',
        },
        [185] = {
            crit = true,
            crittaken = true,
            evade = true,
            hit = true,
            magic = true,
            name = 'voidstorm',
        },
        [195] = {
            magic = true,
            name = 'paeon',
        },
        [199] = {
            crittaken = true,
            evade = true,
            name = 'madrigal',
        },
        [200] = {
            crittaken = true,
            evade = true,
            name = 'prelude',
        },
        [201] = {
            crit = true,
            hit = true,
            name = 'mambo',
        },
        [202] = {
            magic = true,
            name = 'aubade',
        },
        [203] = {
            crittaken = true,
            evade = true,
            name = 'pastoral',
        },
        [205] = {
            magic = true,
            name = 'fantasia',
        },
        [206] = {
            magic = true,
            name = 'operetta',
        },
        [207] = {
            crit = true,
            hit = true,
            name = 'capriccio',
        },
        [209] = {
            magic = true,
            name = 'round',
        },
        [214] = {
            crittaken = true,
            evade = true,
            name = 'march',
        },
        [216] = {
            crit = true,
            crittaken = true,
            evade = true,
            hit = true,
            magic = true,
            name = 'carol',
        },
        [217] = {
            magic = true,
            name = 'threnody',
        },
        [218] = {
            magic = true,
            name = 'hymnus',
        },
        [219] = {
            crit = true,
            hit = true,
            name = 'mazurka',
        },
        [220] = {
            magic = true,
            name = 'sirvente',
        },
        [221] = {
            magic = true,
            name = 'dirge',
        },
        [223] = {
            name = 'nocturne',
            own_magic = true,
        },
        [251] = {
            crit = true,
            crittaken = true,
            evade = true,
            hit = true,
            magic = true,
            name = 'food',
        },
        [283] = {
            magic = true,
            name = 'perfect defense',
        },
        [286] = {
            magic = true,
            name = 'baramnesia',
        },
        [301] = {
            magic = true,
            name = 'ice maneuver',
        },
        [302] = {
            crit = true,
            hit = true,
            name = 'wind maneuver',
        },
        [304] = {
            crittaken = true,
            evade = true,
            name = 'thunder maneuver',
        },
        [305] = {
            magic = true,
            name = 'water maneuver',
        },
        [306] = {
            magic = true,
            name = 'light maneuver',
        },
        [314] = {
            name = 'warlocks roll',
            own_magic = true,
        },
        [315] = {
            crittaken = true,
            name = 'rogues roll',
            own_crit = true,
        },
        [320] = {
            evade = true,
            name = 'hunters roll',
        },
        [322] = {
            hit = true,
            name = 'ninja roll',
        },
        [346] = {
            evade = true,
            name = 'diabolic eye',
        },
        [359] = {
            name = 'dark arts',
            own_magic = true,
        },
        [386] = {
            hit = true,
            name = 'lethargic daze 1',
        },
        [387] = {
            hit = true,
            name = 'lethargic daze 2',
        },
        [388] = {
            hit = true,
            name = 'lethargic daze 3',
        },
        [389] = {
            hit = true,
            name = 'lethargic daze 4',
        },
        [390] = {
            hit = true,
            name = 'lethargic daze 5',
        },
        [396] = {
            magic = true,
            name = 'weakened daze 1',
        },
        [397] = {
            magic = true,
            name = 'weakened daze 2',
        },
        [398] = {
            magic = true,
            name = 'weakened daze 3',
        },
        [399] = {
            magic = true,
            name = 'weakened daze 4',
        },
        [400] = {
            magic = true,
            name = 'weakened daze 5',
        },
        [402] = {
            name = 'addendum black',
            own_magic = true,
        },
        [404] = {
            magic = true,
            name = 'magic evasion down',
        },
        [416] = {
            magic = true,
            name = 'enlightenment',
        },
        [419] = {
            evade = true,
            name = 'composure',
        },
        [420] = {
            evade = true,
            name = 'yonin',
        },
        [421] = {
            hit = true,
            name = 'innin',
        },
        [425] = {
            hit = true,
            name = 'garudas favor',
        },
        [427] = {
            crittaken = true,
            name = 'ramuhs favor',
            own_crit = true,
        },
        [428] = {
            name = 'leviathans favor',
            own_magic = true,
        },
        [429] = {
            magic = true,
            name = 'fenrirs favor',
        },
        [434] = {
            crit = true,
            crittaken = true,
            evade = true,
            hit = true,
            magic = true,
            name = 'transcendency',
        },
        [448] = {
            crit = true,
            name = 'bewildered daze 1',
        },
        [449] = {
            crit = true,
            name = 'bewildered daze 2',
        },
        [450] = {
            crit = true,
            name = 'bewildered daze 3',
        },
        [451] = {
            crit = true,
            name = 'bewildered daze 4',
        },
        [452] = {
            crit = true,
            name = 'bewildered daze 5',
        },
        [460] = {
            crittaken = true,
            name = 'blood rage',
            own_crit = true,
        },
        [461] = {
            crittaken = true,
            evade = true,
            name = 'impetus',
            own_crit = true,
        },
        [463] = {
            evade = true,
            hit = true,
            magic = true,
            name = 'sepulcher',
            own_magic = true,
        },
        [464] = {
            evade = true,
            hit = true,
            magic = true,
            name = 'arcane crest',
            own_magic = true,
        },
        [465] = {
            evade = true,
            hit = true,
            magic = true,
            name = 'hamanoha',
            own_magic = true,
        },
        [466] = {
            evade = true,
            hit = true,
            magic = true,
            name = 'dragon breaker',
            own_magic = true,
        },
        [492] = {
            magic = true,
            name = 'asylum',
        },
        [493] = {
            name = 'subtle sorcery',
            own_magic = true,
        },
        [496] = {
            evade = true,
            name = 'intervene',
        },
        [523] = {
            magic = true,
            name = 'ignis',
        },
        [524] = {
            magic = true,
            name = 'gelus',
        },
        [525] = {
            magic = true,
            name = 'flabra',
        },
        [526] = {
            magic = true,
            name = 'tellus',
        },
        [527] = {
            magic = true,
            name = 'sulpor',
        },
        [528] = {
            magic = true,
            name = 'unda',
        },
        [529] = {
            magic = true,
            name = 'lux',
        },
        [530] = {
            magic = true,
            name = 'tenebrae',
        },
        [543] = {
            crittaken = true,
            evade = true,
            name = 'geo dex boost',
        },
        [545] = {
            crit = true,
            hit = true,
            name = 'geo agi boost',
        },
        [546] = {
            magic = true,
            name = 'geo int boost',
        },
        [547] = {
            magic = true,
            name = 'geo mnd boost',
        },
        [548] = {
            magic = true,
            name = 'geo chr boost',
        },
        [553] = {
            evade = true,
            name = 'geo accuracy boost',
        },
        [554] = {
            hit = true,
            name = 'geo evasion boost',
        },
        [555] = {
            name = 'geo magic acc boost',
            own_magic = true,
        },
        [556] = {
            magic = true,
            name = 'geo magic evasion boost',
        },
        [561] = {
            evade = true,
            name = 'geo accuracy down',
        },
        [562] = {
            hit = true,
            name = 'geo evasion down',
        },
        [563] = {
            name = 'geo magic acc down',
            own_magic = true,
        },
        [564] = {
            magic = true,
            name = 'geo magic evasion down',
        },
        [600] = {
            magic = true,
            name = 'runeists roll',
        },
        [611] = {
            magic = true,
            name = 'magic evasion boost',
        },
        [769] = {
            crittaken = true,
            evade = true,
            name = 'abyssea dex',
        },
        [771] = {
            crit = true,
            hit = true,
            name = 'abyssea agi',
        },
        [772] = {
            magic = true,
            name = 'abyssea int',
        },
        [773] = {
            magic = true,
            name = 'abyssea mnd',
        },
        [774] = {
            magic = true,
            name = 'abyssea chr',
        },
        [783] = {
            evade = true,
            name = 'prowess acc racc',
        },
        [785] = {
            name = 'prowess macc matk',
            own_magic = true,
        },
        [792] = {
            hit = true,
            name = 'super buff',
        },
        [807] = {
            magic = true,
            name = 'trust aura chr',
        },
        [808] = {
            evade = true,
            name = 'trust aura haste',
            own_magic = true,
        },
        [810] = {
            crittaken = true,
            evade = true,
            name = 'trust aura acc',
        },
        [813] = {
            name = 'trust aura magic attack',
            own_magic = true,
        },
    },
    items = {
        [10293] = {
            conditional_magic = true,
            level = 1,
            name = 'chocobo_shirt',
        },
        [11281] = {
            crit = 5,
            level = 75,
            name = 'hachiryu_haramaki',
        },
        [11283] = {
            level = 72,
            magic_accuracy = 6,
            name = 'oracles_robe',
        },
        [11285] = {
            level = 75,
            magic_accuracy = -8,
            name = 'mrgn._cotehardie',
        },
        [11288] = {
            crit = 3,
            level = 71,
            name = 'zahaks_mail',
        },
        [11289] = {
            level = 74,
            magic_accuracy = 5,
            name = 'ixion_cloak',
        },
        [11486] = {
            level = 64,
            magic_accuracy = 4,
            name = 'diana_corona',
        },
        [11543] = {
            level = 74,
            magic_accuracy = 3,
            name = 'hecates_cape',
        },
        [11632] = {
            level = 75,
            magic_accuracy = 1,
            name = 'karka_ring',
        },
        [12132] = {
            level = 71,
            magic_accuracy = 2,
            name = 'ebon_tam',
        },
        [12133] = {
            level = 71,
            magic_accuracy = 2,
            name = 'furia_tam',
        },
        [12134] = {
            level = 71,
            magic_accuracy = 2,
            name = 'ebur_tam',
        },
        [12165] = {
            crit = 2,
            level = 71,
            name = 'ebon_vest',
        },
        [12166] = {
            crit = 2,
            level = 71,
            name = 'furia_vest',
        },
        [12167] = {
            crit = 2,
            level = 71,
            name = 'ebur_vest',
        },
        [12168] = {
            level = 71,
            magic_accuracy = 3,
            name = 'ebon_talar',
        },
        [12169] = {
            level = 71,
            magic_accuracy = 3,
            name = 'furia_talar',
        },
        [12170] = {
            level = 71,
            magic_accuracy = 3,
            name = 'ebur_talar',
        },
        [12204] = {
            level = 71,
            magic_accuracy = 2,
            name = 'ebon_gants',
        },
        [12205] = {
            level = 71,
            magic_accuracy = 2,
            name = 'furia_gants',
        },
        [12206] = {
            level = 71,
            magic_accuracy = 2,
            name = 'ebur_gants',
        },
        [12237] = {
            crit = 1,
            level = 71,
            name = 'ebon_tights',
        },
        [12238] = {
            crit = 1,
            level = 71,
            name = 'furia_tights',
        },
        [12239] = {
            crit = 1,
            level = 71,
            name = 'ebur_tights',
        },
        [12240] = {
            level = 71,
            magic_accuracy = 4,
            name = 'ebon_slacks',
        },
        [12241] = {
            level = 71,
            magic_accuracy = 4,
            name = 'furia_slacks',
        },
        [12242] = {
            level = 71,
            magic_accuracy = 4,
            name = 'ebur_slacks',
        },
        [12276] = {
            level = 71,
            magic_accuracy = 3,
            name = 'ebon_brogues',
        },
        [12277] = {
            level = 71,
            magic_accuracy = 3,
            name = 'furia_brogues',
        },
        [12278] = {
            level = 71,
            magic_accuracy = 3,
            name = 'ebur_brogues',
        },
        [14440] = {
            level = 72,
            magic_accuracy = 5,
            name = 'chasuble',
        },
        [14441] = {
            level = 72,
            magic_accuracy = 6,
            name = 'chasuble_+1',
        },
        [14489] = {
            level = 75,
            magic_accuracy = 5,
            name = 'nashira_manteel',
        },
        [14505] = {
            crit = 1,
            level = 75,
            name = 'asn._vest_+1',
        },
        [14524] = {
            crit = 3,
            level = 59,
            name = 'sipahi_jawshan',
        },
        [14528] = {
            crit = 4,
            level = 59,
            name = 'abtal_jawshan',
        },
        [14530] = {
            crit = 1,
            level = 72,
            name = 'pln._khazagand',
        },
        [14544] = {
            level = 71,
            magic_accuracy = 7,
            name = 'corselet',
        },
        [14545] = {
            level = 71,
            magic_accuracy = 9,
            name = 'corselet_+1',
        },
        [14575] = {
            level = 75,
            magic_accuracy = 10,
            name = 'shadow_coat',
        },
        [14576] = {
            level = 75,
            magic_accuracy = 11,
            name = 'valkyries_coat',
        },
        [14814] = {
            conditional_magic = true,
            level = 65,
            name = 'diaboloss_earring',
        },
        [14885] = {
            conditional_magic = true,
            level = 36,
            name = 'sennight_bangles',
        },
        [14906] = {
            level = 75,
            magic_accuracy = 3,
            name = 'nashira_gages',
        },
        [14977] = {
            level = 75,
            magic_accuracy = 5,
            name = 'morrigans_cuffs',
        },
        [14985] = {
            level = 75,
            magic_accuracy = 4,
            name = 'goliard_cuffs',
        },
        [14997] = {
            level = 75,
            magic_accuracy = 3,
            name = 'shadow_cuffs',
        },
        [14998] = {
            level = 75,
            magic_accuracy = 4,
            name = 'valkyries_cuffs',
        },
        [15056] = {
            level = 71,
            magic_accuracy = 3,
            name = 'rovers_gloves',
        },
        [15057] = {
            level = 74,
            magic_accuracy = 5,
            name = 'brictas_cuffs',
        },
        [15092] = {
            crit = 1,
            level = 72,
            name = 'assassins_vest',
        },
        [15190] = {
            level = 72,
            magic_accuracy = 5,
            name = 'wise_cap',
        },
        [15191] = {
            level = 72,
            magic_accuracy = 6,
            name = 'wise_cap_+1',
        },
        [15240] = {
            level = 75,
            magic_accuracy = 4,
            name = 'homam_zucchetto',
        },
        [15241] = {
            level = 75,
            magic_accuracy = 5,
            name = 'nashira_turban',
        },
        [15396] = {
            level = 72,
            magic_accuracy = 2,
            name = 'wise_braconi',
        },
        [15397] = {
            level = 72,
            magic_accuracy = 3,
            name = 'wise_braconi_+1',
        },
        [15435] = {
            level = 71,
            name = 'karin_obi',
            weather_fire = 1,
        },
        [15436] = {
            level = 71,
            name = 'hyorin_obi',
            weather_ice = 1,
        },
        [15437] = {
            level = 71,
            name = 'furin_obi',
            weather_wind = 1,
        },
        [15438] = {
            level = 71,
            name = 'dorin_obi',
            weather_earth = 1,
        },
        [15439] = {
            level = 71,
            name = 'rairin_obi',
            weather_thunder = 1,
        },
        [15440] = {
            level = 71,
            name = 'suirin_obi',
            weather_water = 1,
        },
        [15441] = {
            level = 71,
            name = 'korin_obi',
            weather_light = 1,
        },
        [15442] = {
            level = 71,
            name = 'anrin_obi',
            weather_dark = 1,
        },
        [15470] = {
            level = 50,
            magic_accuracy = 1,
            name = 'gramary_cape',
        },
        [15479] = {
            level = 70,
            magic_accuracy = 7,
            name = 'abyss_cape',
        },
        [15577] = {
            level = 75,
            magic_accuracy = 3,
            name = 'nashira_seraweels',
        },
        [15648] = {
            level = 75,
            magic_accuracy = 3,
            name = 'denali_kecks',
        },
        [15657] = {
            level = 75,
            magic_accuracy = 4,
            name = 'shadow_trews',
        },
        [15658] = {
            level = 75,
            magic_accuracy = 5,
            name = 'valkyries_trews',
        },
        [15662] = {
            level = 75,
            magic_accuracy = 2,
            name = 'nashira_crackows',
        },
        [15734] = {
            level = 75,
            magic_accuracy = 3,
            name = 'denali_gamashes',
        },
        [15735] = {
            level = 75,
            magic_accuracy = 2,
            name = 'goliard_clogs',
        },
        [15742] = {
            level = 75,
            magic_accuracy = 2,
            name = 'shadow_clogs',
        },
        [15743] = {
            level = 75,
            magic_accuracy = 3,
            name = 'valkyries_clogs',
        },
        [15800] = {
            level = 75,
            magic_accuracy = 3,
            name = 'omega_ring',
        },
        [15807] = {
            level = 50,
            magic_accuracy = 4,
            name = 'balrahns_ring',
        },
        [15827] = {
            level = 70,
            magic_accuracy = 2,
            name = 'insect_ring',
        },
        [15877] = {
            level = 70,
            magic_accuracy = 2,
            name = 'koga_sarashi',
        },
        [15894] = {
            level = 60,
            magic_accuracy = -1,
            name = 'bitter_corset',
        },
        [15918] = {
            level = 71,
            magic_accuracy = 2,
            name = 'witch_sash',
        },
        [15925] = {
            level = 70,
            magic_accuracy = 2,
            name = 'argute_belt',
        },
        [15936] = {
            conditional_magic = true,
            earth = 3,
            level = 60,
            name = 'earthy_belt',
        },
        [15967] = {
            conditional_magic = true,
            level = 60,
            light = 1,
            name = 'temple_earring',
        },
        [16011] = {
            level = 72,
            magic_accuracy = 1,
            name = 'lyc._earring',
        },
        [16018] = {
            conditional_magic = true,
            level = 40,
            name = 'ataraxy_earring',
        },
        [16052] = {
            level = 75,
            magic_accuracy = 2,
            name = 'incubus_earring',
        },
        [16053] = {
            level = 75,
            magic_accuracy = 3,
            name = 'incubus_earring_+1',
        },
        [16065] = {
            level = 50,
            magic_accuracy = 2,
            name = 'storm_zucchetto',
        },
        [16071] = {
            conditional_crit = true,
            level = 75,
            name = 'kawahori_kabuto',
        },
        [16100] = {
            level = 75,
            magic_accuracy = 5,
            name = 'morrigans_coron.',
        },
        [16103] = {
            level = 35,
            magic_accuracy = 1,
            name = 'machas_crown',
        },
        [16115] = {
            level = 75,
            magic_accuracy = 5,
            name = 'shadow_hat',
        },
        [16116] = {
            level = 75,
            magic_accuracy = 6,
            name = 'valkyries_hat',
        },
        [16127] = {
            level = 70,
            magic_accuracy = 4,
            name = 'carline_ribbon',
        },
        [16151] = {
            crit = 3,
            level = 75,
            name = 'leonine_mask',
        },
        [16160] = {
            level = 71,
            magic_accuracy = 2,
            name = 'rees_headgear',
        },
        [16180] = {
            level = 69,
            magic_accuracy = 3,
            name = 'harpy_shield',
        },
        [16244] = {
            level = 70,
            magic_accuracy = 3,
            name = 'mirage_mantle',
        },
        [16271] = {
            level = 65,
            magic_accuracy = 2,
            name = 'lieut._gorget',
        },
        [16346] = {
            level = 72,
            magic_accuracy = 3,
            name = 'mirage_shalwar',
        },
        [16347] = {
            level = 75,
            magic_accuracy = 5,
            name = 'mirage_shalwar_+1',
        },
        [16686] = {
            conditional_crit = true,
            level = 59,
            name = 'arcanabane',
        },
        [16904] = {
            level = 70,
            name = 'fudo',
            weapon_crit = 3,
        },
        [16912] = {
            conditional_crit = true,
            level = 64,
            name = 'kitsutsuki',
        },
        [16968] = {
            conditional_crit = true,
            level = 70,
            name = 'kamewari',
        },
        [16969] = {
            conditional_crit = true,
            level = 65,
            name = 'onikiri',
        },
        [17192] = {
            conditional_crit = true,
            level = 72,
            name = 'ifrits_bow',
        },
        [17451] = {
            conditional_crit = true,
            level = 72,
            name = 'morgenstern',
        },
        [17509] = {
            conditional_crit = true,
            level = 73,
            name = 'destroyers',
        },
        [17545] = {
            level = 51,
            name = 'fire_staff',
            staff_fire = 2,
            staff_ice = -2,
        },
        [17546] = {
            level = 51,
            name = 'vulcans_staff',
            staff_fire = 3,
            staff_ice = -3,
        },
        [17547] = {
            level = 51,
            name = 'ice_staff',
            staff_ice = 2,
            staff_wind = -2,
        },
        [17548] = {
            level = 51,
            name = 'aquilos_staff',
            staff_ice = 3,
            staff_wind = -3,
        },
        [17549] = {
            level = 51,
            name = 'wind_staff',
            staff_earth = -2,
            staff_wind = 2,
        },
        [17550] = {
            level = 51,
            name = 'austers_staff',
            staff_earth = -3,
            staff_wind = 3,
        },
        [17551] = {
            level = 51,
            name = 'earth_staff',
            staff_earth = 2,
            staff_thunder = -2,
        },
        [17552] = {
            level = 51,
            name = 'terras_staff',
            staff_earth = 3,
            staff_thunder = -3,
        },
        [17553] = {
            crit = 15,
            level = 51,
            name = 'thunder_staff',
            staff_thunder = 2,
            staff_water = -2,
        },
        [17554] = {
            crit = 15,
            level = 51,
            name = 'jupiters_staff',
            staff_thunder = 3,
            staff_water = -3,
        },
        [17555] = {
            level = 51,
            name = 'water_staff',
            staff_fire = -2,
            staff_water = 2,
        },
        [17556] = {
            level = 51,
            name = 'neptunes_staff',
            staff_fire = -3,
            staff_water = 3,
        },
        [17557] = {
            level = 51,
            name = 'light_staff',
            staff_dark = -2,
            staff_light = 2,
        },
        [17558] = {
            level = 51,
            name = 'apollos_staff',
            staff_dark = -3,
            staff_light = 3,
        },
        [17559] = {
            level = 51,
            name = 'dark_staff',
            staff_dark = 2,
            staff_light = -2,
        },
        [17560] = {
            level = 51,
            name = 'plutos_staff',
            staff_dark = 3,
            staff_light = -3,
        },
        [17589] = {
            conditional_crit = true,
            level = 73,
            name = 'thyrsusstab',
        },
        [17590] = {
            crit = 5,
            level = 73,
            name = 'primate_staff',
        },
        [17591] = {
            crit = 7,
            level = 73,
            name = 'primate_staff_+1',
        },
        [17592] = {
            crit = 5,
            level = 73,
            name = 'kinkobo',
        },
        [17618] = {
            crit = 5,
            level = 56,
            name = 'kidney_dagger',
        },
        [17624] = {
            conditional_crit = true,
            level = 65,
            name = 'anubiss_knife',
        },
        [17699] = {
            conditional_crit = true,
            level = 72,
            name = 'dissector',
        },
        [17751] = {
            level = 74,
            magic_accuracy = 2,
            name = 'fragarach',
        },
        [17753] = {
            crit = 3,
            level = 75,
            name = 'organics',
        },
        [17759] = {
            conditional_crit = true,
            level = 72,
            name = 'koggelmander',
        },
        [17791] = {
            crit = 5,
            level = 74,
            name = 'rai_kunimitsu',
        },
        [17793] = {
            conditional_crit = true,
            level = 72,
            name = 'senjuinrikio',
        },
        [17827] = {
            conditional_crit = true,
            level = 72,
            name = 'michishiba',
        },
        [17944] = {
            conditional_crit = true,
            level = 72,
            name = 'retributor',
        },
        [17964] = {
            conditional_crit = true,
            level = 72,
            name = 'barkborer',
        },
        [18005] = {
            conditional_crit = true,
            level = 73,
            name = 'heart_snatcher',
        },
        [18053] = {
            conditional_crit = true,
            level = 73,
            name = 'gravedigger',
        },
        [18057] = {
            level = 72,
            name = 'ys_scythe',
            staff_dark = 2,
            staff_light = -2,
        },
        [18058] = {
            level = 73,
            magic_accuracy = 2,
            name = 'orichalcum_scythe',
        },
        [18059] = {
            level = 73,
            magic_accuracy = 3,
            name = 'tritons_scythe',
        },
        [18060] = {
            level = 73,
            magic_accuracy = 2,
            name = 'blizzard_scythe',
        },
        [18097] = {
            conditional_crit = true,
            level = 72,
            name = 'gondo-shizunori',
        },
        [18125] = {
            crit = 3,
            level = 72,
            name = 'cletine',
        },
        [18217] = {
            conditional_crit = true,
            level = 72,
            name = 'rampager',
        },
        [18245] = {
            level = 75,
            magic_accuracy = 8,
            name = 'aureole',
        },
        [18282] = {
            crit = 5,
            level = 75,
            name = 'ragnarok',
        },
        [18378] = {
            conditional_crit = true,
            level = 72,
            name = 'subduer',
        },
        [18386] = {
            level = 70,
            magic_accuracy = 2,
            name = 'gloom_claymore',
        },
        [18413] = {
            level = 73,
            magic_accuracy = 2,
            name = 'hirenjaku',
        },
        [18414] = {
            level = 73,
            magic_accuracy = 3,
            name = 'hirenjaku_+1',
        },
        [18415] = {
            level = 73,
            magic_accuracy = 2,
            name = 'tojaku',
        },
        [18438] = {
            conditional_crit = true,
            crit = 5,
            level = 70,
            name = 'kumokirimaru',
        },
        [18504] = {
            conditional_crit = true,
            level = 72,
            name = 'eventreuse',
        },
        [18593] = {
            level = 73,
            magic_accuracy = 20,
            name = 'alkalurops',
        },
        [18604] = {
            level = 27,
            magic_accuracy = 3,
            name = 'astaroth_cane',
        },
        [18606] = {
            level = 39,
            magic_accuracy = 3,
            name = 'passaddhi_staff',
        },
        [18615] = {
            level = 39,
            magic_accuracy = 4,
            name = 'passaddhi_staff_+1',
        },
        [18632] = {
            level = 51,
            name = 'iridal_staff',
            staff_dark = 2,
            staff_earth = 2,
            staff_fire = 2,
            staff_ice = 2,
            staff_light = 2,
            staff_thunder = 2,
            staff_water = 2,
            staff_wind = 2,
            weather_all = 1,
        },
        [18633] = {
            level = 51,
            name = 'chatoyant_staff',
            staff_dark = 3,
            staff_earth = 3,
            staff_fire = 3,
            staff_ice = 3,
            staff_light = 3,
            staff_thunder = 3,
            staff_water = 3,
            staff_wind = 3,
            weather_all = 2,
        },
        [18694] = {
            conditional_crit = true,
            level = 70,
            name = 'trollbane',
        },
        [18734] = {
            conditional_magic = true,
            level = 60,
            magic_accuracy = 2,
            name = 'sturms_report',
        },
        [18770] = {
            crit = 3,
            level = 73,
            name = 'pygme_sainti',
        },
        [18857] = {
            level = 72,
            magic_accuracy = 10,
            name = 'antares',
        },
        [18862] = {
            level = 69,
            magic_accuracy = 5,
            name = 'clearpath',
        },
        [18865] = {
            conditional_crit = true,
            level = 72,
            name = 'zonure',
        },
        [18990] = {
            level = 75,
            magic_accuracy = 10,
            name = 'tupsimati',
        },
        [18991] = {
            conditional_crit = true,
            level = 75,
            name = 'conqueror',
        },
        [18992] = {
            conditional_crit = true,
            level = 75,
            name = 'glanzfaust',
        },
        [18993] = {
            level = 75,
            magic_accuracy = 10,
            name = 'yagrush',
        },
        [18994] = {
            level = 75,
            magic_accuracy = 10,
            name = 'laevateinn',
        },
        [18995] = {
            level = 75,
            magic_accuracy = 10,
            name = 'murgleis',
        },
        [18998] = {
            level = 75,
            magic_accuracy = 20,
            name = 'liberator',
        },
        [19000] = {
            level = 75,
            magic_accuracy = 10,
            name = 'carnwenhan',
        },
        [19003] = {
            level = 75,
            magic_accuracy = 10,
            name = 'nagi',
        },
        [19006] = {
            level = 75,
            magic_accuracy = 10,
            name = 'tizona',
        },
        [19027] = {
            crit = 3,
            level = 65,
            name = 'claymore_grip',
        },
        [19031] = {
            fire = 2,
            level = 70,
            name = 'fire_grip',
        },
        [19032] = {
            level = 70,
            name = 'water_grip',
            water = 2,
        },
        [19033] = {
            level = 70,
            name = 'wind_grip',
            wind = 2,
        },
        [19034] = {
            ice = 2,
            level = 70,
            name = 'ice_grip',
        },
        [19035] = {
            level = 70,
            name = 'thunder_grip',
            thunder = 2,
        },
        [19036] = {
            earth = 2,
            level = 70,
            name = 'earth_grip',
        },
        [19037] = {
            level = 70,
            light = 2,
            name = 'light_grip',
        },
        [19038] = {
            dark = 2,
            level = 70,
            name = 'dark_grip',
        },
        [19113] = {
            conditional_crit = true,
            level = 72,
            name = 'ermines_tail',
        },
        [19124] = {
            level = 73,
            magic_accuracy = 3,
            name = 'creve-coeur',
        },
        [19153] = {
            level = 74,
            magic_accuracy = 3,
            name = 'naglering',
        },
        [19155] = {
            conditional_crit = true,
            level = 69,
            name = 'cruadin',
        },
        [19158] = {
            conditional_crit = true,
            level = 72,
            name = 'scheherazade',
        },
        [19235] = {
            level = 74,
            magic_accuracy = 5,
            name = 'veuglaire',
        },
        [19243] = {
            level = 30,
            magic_accuracy = 1,
            name = 'brio_dart',
        },
        [19273] = {
            conditional_crit = true,
            level = 72,
            name = 'onishibari',
        },
        [21817] = {
            conditional_crit = true,
            level = 70,
            name = 'rune_scythe',
        },
        [26515] = {
            level = 1,
            name = 'poroggo_fleece_+1',
            water = 30,
        },
        [27662] = {
            level = 45,
            magic_accuracy = 1,
            name = 'neits_crown',
        },
        [27802] = {
            level = 45,
            magic_accuracy = 2,
            name = 'neits_coat',
        },
        [28393] = {
            level = 75,
            magic_accuracy = 3,
            name = 'goetic_torque',
        },
        [28419] = {
            level = 71,
            name = 'hachirin-no-obi',
            weather_all = 1,
        },
        [28425] = {
            level = 75,
            magic_accuracy = 4,
            name = 'salire_belt',
        },
    },
    merits = {
        earth_magic_accuracy = {
            id = 648,
            job = 5,
            level = 75,
            most = 5,
            per_rank = 3,
            school = 'earth',
        },
        fire_magic_accuracy = {
            id = 642,
            job = 5,
            level = 75,
            most = 5,
            per_rank = 3,
            school = 'fire',
        },
        ice_magic_accuracy = {
            id = 644,
            job = 5,
            level = 75,
            most = 5,
            per_rank = 3,
            school = 'ice',
        },
        lightning_magic_accuracy = {
            id = 650,
            job = 5,
            level = 75,
            most = 5,
            per_rank = 3,
            school = 'thunder',
        },
        magical_accuracy = {
            id = 1352,
            job = 16,
            level = 75,
            most = 5,
            per_rank = 2,
            school = 'blue',
        },
        troubadour = {
            id = 2626,
            job = 10,
            level = 75,
            most = 3,
            per_rank = 150,
            school = 'singing',
        },
        water_magic_accuracy = {
            id = 652,
            job = 5,
            level = 75,
            most = 5,
            per_rank = 3,
            school = 'water',
        },
        wind_magic_accuracy = {
            id = 646,
            job = 5,
            level = 75,
            most = 5,
            per_rank = 3,
            school = 'wind',
        },
    },
};
