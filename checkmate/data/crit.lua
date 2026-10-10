-- Crit: the Critical Hit Rate and Enemy Critical Hit Rate merits, the main level each count of them
-- needs, and the gear that changes the crits you take.
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each merit: its id in the merit list the server sends, what one adds to your crit or takes off
    -- the crits you take, in percent, and the most you can have
    merits = {
        crit_hit_rate   = { id = 324, per_merit = 1, most = 4 },
        enemy_crit_rate = { id = 326, per_merit = 1, most = 4 },
    },
    -- { main level, how many merits count from that level }, lowest first. A level sync counts.
    level_caps = { { 0, 0 }, { 10, 1 }, { 20, 2 }, { 30, 3 }, { 40, 4 }, { 50, 5 }, { 55, 6 }, { 60, 7 }, { 65, 8 },
                   { 70, 9 }, { 75, 10 }, { 80, 15 } },
    -- [item id] = its critical hit evasion and its own level. It counts for nothing while your main
    -- level is under that. A minus one raises the crits you take.
    evasion_items = { [10773] = { crit_evasion = 7, level = 99 }, [11573] = { crit_evasion = 2, level = 86 },
                      [15463] = { crit_evasion = 2, level = 51 }, [15465] = { crit_evasion = -50, level = 72 },
                      [15503] = { crit_evasion = 1, level = 14 }, [15856] = { crit_evasion = 1, level = 80 },
                      [15871] = { crit_evasion = 2, level = 70 }, [19295] = { crit_evasion = 3, level = 88 },
                      [19781] = { crit_evasion = 5, level = 96 }, [19782] = { crit_evasion = 2, level = 99 },
                      [27555] = { crit_evasion = 5, level = 99 }, [27615] = { crit_evasion = 3, level = 99 },
                      [28038] = { crit_evasion = 3, level = 99 }, [28039] = { crit_evasion = 4, level = 99 },
                      [28156] = { crit_evasion = 3, level = 99 } },
}
