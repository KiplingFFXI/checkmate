-- Steal: the job that has it and the level it's learned at, and the gear that adds to the Steal mod.
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Steal is this job's, as your main or support job, from this level
    ability = { job = 6, level = 5 },
    -- [item id] = the Steal it adds and its own level. It adds nothing while your main level is under that.
    items = { [12514] = { steal = 1, level = 54 }, [12748] = { steal = 3, level = 70 },
              [13112] = { steal = 1, level = 7 }, [13966] = { steal = 1, level = 52 },
              [14094] = { steal = 2, level = 60 }, [14219] = { steal = 1, level = 56 },
              [14895] = { steal = 1, level = 74 }, [15122] = { steal = 5, level = 74 },
              [15357] = { steal = 2, level = 74 }, [15566] = { steal = 1, level = 74 },
              [15585] = { steal = 5, level = 75 }, [15880] = { steal = 1, level = 20 },
              [17623] = { steal = 2, level = 71 }, [22269] = { steal = 3, level = 99 },
              [23313] = { steal = 10, level = 99 }, [23648] = { steal = 15, level = 99 },
              [26197] = { steal = 3, level = 99 }, [27585] = { steal = 2, level = 99 },
              [27948] = { steal = 2, level = 99 }, [27969] = { steal = 2, level = 99 },
              [28095] = { steal = 2, level = 99 }, [28116] = { steal = 2, level = 99 },
              [28228] = { steal = 3, level = 99 }, [28249] = { steal = 3, level = 99 },
              [28383] = { steal = 2, level = 99 } },
    -- [item id] = the Steal it adds while your HP is at or under hp_percent and TP is under 100%, and its own level
    latents = { [13291] = { steal = 3, level = 50, hp_percent = 75 } },
}
