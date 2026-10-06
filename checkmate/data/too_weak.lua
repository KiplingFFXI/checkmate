-- The highest monster level that checks Too Weak to you, by your main level.
-- A monster's level here is its true level plus its level_mod.
-- The levels are worked out from modules/era/lua/globals/toau_experience_points.lua.
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- [your main level] = the highest Too Weak level
    highest = {
        [1] = -6, [2] = -5, [3] = -4, [4] = -3, [5] = -2, [6] = -3, [7] = -2, [8] = -1, [9] = 0, [10] = 1,
        [11] = 1, [12] = 2, [13] = 3, [14] = 4, [15] = 5, [16] = 6, [17] = 7, [18] = 8, [19] = 9, [20] = 10,
        [21] = 10, [22] = 11, [23] = 12, [24] = 13, [25] = 14, [26] = 15, [27] = 16, [28] = 17, [29] = 18, [30] = 19,
        [31] = 19, [32] = 20, [33] = 21, [34] = 22, [35] = 23, [36] = 23, [37] = 24, [38] = 25, [39] = 26, [40] = 27,
        [41] = 27, [42] = 28, [43] = 29, [44] = 30, [45] = 31, [46] = 31, [47] = 32, [48] = 33, [49] = 34, [50] = 35,
        [51] = 35, [52] = 36, [53] = 37, [54] = 38, [55] = 39, [56] = 39, [57] = 40, [58] = 41, [59] = 42, [60] = 43,
        [61] = 43, [62] = 44, [63] = 45, [64] = 46, [65] = 47, [66] = 47, [67] = 48, [68] = 49, [69] = 50, [70] = 51,
        [71] = 51, [72] = 52, [73] = 53, [74] = 54, [75] = 55, [76] = 56, [77] = 57, [78] = 58, [79] = 59, [80] = 60,
        [81] = 61, [82] = 62, [83] = 63, [84] = 64, [85] = 65, [86] = 66, [87] = 67, [88] = 68, [89] = 69, [90] = 70,
        [91] = 71, [92] = 72, [93] = 73, [94] = 74, [95] = 75, [96] = 76, [97] = 77, [98] = 78, [99] = 79,
    },
}
