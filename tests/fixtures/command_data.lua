-- Synthetic 0x0AC command masks, without the four-byte packet header.
-- The trait bytes are at 0xC2 and 0xC8. The earlier bits belong to weapon skills.
return {
    empty = string.rep('\0', 224),
    th1 = string.rep('\0', 194) .. '\8' .. string.rep('\0', 29),
    th2 = string.rep('\0', 194) .. '\8' .. string.rep('\0', 5) .. '\1' .. string.rep('\0', 23),
    weapon_skills = string.rep('\0', 2) .. '\8' .. string.rep('\0', 5) .. '\1' .. string.rep('\0', 215),
};
