--[[
    The overlay's pictures. Item and status pictures come from your own game client. Ashita's resource manager
    hands each one over as an image file in memory, and Direct3D turns it into a texture ImGui can draw.
    Weapon damage icons are bundled from BG Wiki. The overlay draws the element
    badges itself. A job's picture is its artifact head, an item picture like any other.

    A picture loads the first time the overlay needs it, when it works out its lines, never on a steady frame,
    and stays loaded until checkmate unloads, so none is ever freed while a frame could still draw it. One the
    client doesn't have, or that won't load, is noted so it's never tried again, and its name shows alone.

    The pictures are whatever your client has. XIPivot can lay a modded status file over the game's, so nothing
    here counts on how a picture looks or which ones match.
]]

local ffi = require('ffi');

local icons = {};

local WEAPON_FILES = {
    slashing = 'Slashing.png', piercing = 'Piercingv2.png', blunt = 'Blunt.png', hand_to_hand = 'H2H.png',
};

-- The status effect whose picture stands for each element. They're the storm effects, Firestorm 178 to
-- Voidstorm 185, in the order of core\elements.lua, with one picture for each element.
icons.ELEMENT_STATUS = {
    fire = 178, ice = 179, wind = 180, earth = 181, thunder = 182, water = 183, light = 184, dark = 185,
};

-- The status effect whose picture stands for each immunity, by its id in printout.IMMUNITIES.
icons.IMMUNITY_STATUS = {
    dark_sleep = 2, light_sleep = 193, bind = 11, gravity = 12, silence = 6, stun = 10, paralyze = 4, slow = 13,
    elegy = 194, blind = 5, poison = 3, requiem = 192, petrify = 7, terror = 28, plague = 31, curse = 9,
};

-- The picture each effect uses when it isn't its own. The server shows Sleep II and Lullaby with Sleep's.
local EFFECT_PICTURES = { [19] = 2, [193] = 2 };

-- The status picture to draw for an effect.
function icons.effect_picture(id)
    return EFFECT_PICTURES[id] or id;
end

-- Each job's artifact head, the item whose picture stands for the job, by the job keys in the monster data. Every
-- client has these pictures, the same in Phoenix's era item files. Dancer's Tiara is 16138, and 16139, the other
-- model, has the same picture.
icons.JOB_ITEMS = {
    war = 12511, mnk = 12512, whm = 13855, blm = 13856, rdm = 12513, thf = 12514, pld = 12515, drk = 12516,
    bst = 12517, brd = 13857, rng = 12518, sam = 13868, nin = 13869, drg = 12519, smn = 12520, blu = 15265,
    cor = 15266, pup = 15267, dnc = 16138, sch = 16140, geo = 27786, run = 27787,
};

-- The letter on each element's badge. Wind and water both start with W.
icons.LETTERS = {
    fire = 'F', ice = 'I', wind = 'Wi', earth = 'E', thunder = 'T', water = 'Wa', light = 'L', dark = 'D',
};

-- Item ids that are never an item.
local NOT_ITEMS = { [0] = true, [65535] = true };

local loaded = { item = {}, status = {}, weapon = {} };   -- [id] = the texture number, or false when it has none.
local kept   = {};    -- Every texture, so none is released while it's loaded.
local shared = nil;   -- [immunity id] = true when another immunity has the same picture, once it's worked out.
local d3d8   = nil;   -- Ashita's d3d8 library once it's loaded, or false when it wouldn't load.
local device = nil;

-- Ashita's d3d8 library, or nil when it won't load. A failure is kept, so it's only ever tried once.
local function library()
    if (d3d8 == nil) then
        local ok, lib = pcall(require, 'd3d8');
        d3d8 = ok and lib or false;
    end
    return d3d8 or nil;
end

--[[
    Loads Ashita's d3d8 library ahead of the first picture, while the overlay and its icons are on. It's
    thousands of lines of Direct3D headers, so this puts the moment it takes on loading checkmate or changing a
    setting, not on the first monster you target.
]]
function icons.prepare(o)
    if (o.on == true and o.icons == true) then
        library();
    end
end

-- One image file from the client as a texture, as the number ImGui draws it by, or nil.
-- The size comes from the image, and opaque black becomes see-through,
-- which is what clears the background. A modded picture with pure black in its art loses those pixels too.
local function decode(bitmap, size, color_key)
    local lib = library();
    if (lib == nil) then
        return nil;
    end
    device = device or lib.get_device();
    local out = ffi.new('IDirect3DTexture8*[1]');
    local result = ffi.C.D3DXCreateTextureFromFileInMemoryEx(device, bitmap, size, 0xFFFFFFFF, 0xFFFFFFFF, 1, 0,
        ffi.C.D3DFMT_A8R8G8B8, ffi.C.D3DPOOL_MANAGED, ffi.C.D3DX_DEFAULT, ffi.C.D3DX_DEFAULT, color_key or 0xFF000000, nil, nil,
        out);
    if (result ~= ffi.C.S_OK) then
        return nil;
    end
    local texture = lib.gc_safe_release(ffi.cast('IDirect3DTexture8*', out[0]));
    kept[#kept + 1] = texture;
    return tonumber(ffi.cast('uint32_t', texture));
end

-- The picture of an item, or of a status effect, as the number ImGui draws it by, or false. The client keeps
-- status pictures in effect id order, so they're looked up by index.
local function read_picture(kind, id)
    local resources = AshitaCore:GetResourceManager();
    local entry = nil;
    if (kind == 'item') then
        entry = resources:GetItemById(id);
    else
        entry = resources:GetStatusIconByIndex(id);
    end
    if (entry == nil or entry.Bitmap == nil or (tonumber(entry.ImageSize) or 0) <= 0) then
        return false;
    end
    return decode(entry.Bitmap, entry.ImageSize) or false;
end

-- The same, but a mistake anywhere in it, from the lookup to the texture, only costs that picture.
local function picture_of(kind, id)
    local ok, number = pcall(read_picture, kind, id);
    return (ok and number) or false;
end

-- An item's picture, or nil.
function icons.item(id)
    if (loaded.item[id] == nil) then
        if (NOT_ITEMS[id]) then
            loaded.item[id] = false;
        else
            loaded.item[id] = picture_of('item', id);
        end
    end
    return loaded.item[id] or nil;
end

-- A status effect's picture, or nil.
function icons.status(id)
    if (id == nil) then
        return nil;
    end
    if (loaded.status[id] == nil) then
        loaded.status[id] = picture_of('status', id);
    end
    return loaded.status[id] or nil;
end

-- Bundled PNGs keep their alpha and black pixels. A missing file leaves its name alone.
function icons.weapon(id)
    if (WEAPON_FILES[id] == nil) then return nil; end
    if (loaded.weapon[id] == nil) then
        local ok, texture = pcall(function ()
            local file = io.open(addon.path .. 'assets/weapons/' .. WEAPON_FILES[id], 'rb');
            if (file == nil) then return nil; end
            local data = file:read('*a');
            file:close();
            if (data == nil or data == '') then return nil; end
            return decode(data, #data, 0);
        end);
        loaded.weapon[id] = (ok and texture) or false;
    end
    return loaded.weapon[id] or nil;
end

-- Which immunities have the same picture as another one in your client. Only the answers are kept.
local function find_shared(ids)
    local resources = AshitaCore:GetResourceManager();
    local bitmaps, count, found = {}, {}, {};
    for key, id in pairs(ids) do
        local entry = resources:GetStatusIconByIndex(id);
        local bitmap = (entry ~= nil) and entry.Bitmap or nil;
        if (bitmap ~= nil) then
            bitmaps[key] = bitmap;
            count[bitmap] = (count[bitmap] or 0) + 1;
        end
    end
    for key, bitmap in pairs(bitmaps) do
        found[key] = count[bitmap] > 1;
    end
    return found;
end

--[[
    True when an immunity has the same picture as another immunity in your game client, so its name stays with
    Icons only. In the game's own pictures Lullaby, Elegy and Requiem share one, and so do Bind, Stun and Terror,
    but a modded status file can give each its own. It's worked out from all 16 the first time it's asked.
]]
function icons.shared(key)
    if (shared == nil) then
        local ok, found = pcall(find_shared, icons.IMMUNITY_STATUS);
        shared = ok and found or {};
    end
    return shared[key] == true;
end

local effect_shared = nil;   -- [effect id] = true when another effect has the same picture, once it's worked out.

--[[
    True when an effect has the same picture as another effect checkmate can show, in your game client, so its name
    stays with Icons only. In the game's own pictures every elemental damage over time is one picture, so are
    Requiem, Elegy and Threnody, and Bind, Stun and Terror. It's worked out once, the first time it's asked, from
    the list `ids()` hands back.
]]
function icons.effect_shared(id, ids)
    if (effect_shared == nil) then
        local ok, found = pcall(function()
            local mapped = {};
            for _, effect in ipairs(ids()) do
                local picture = icons.effect_picture(effect);
                mapped[picture] = picture;
            end
            return find_shared(mapped);
        end);
        effect_shared = ok and found or {};
    end
    return effect_shared[icons.effect_picture(id)] == true;
end

-- Lets go of every picture. Only the unload event calls this, so no frame is drawing them.
function icons.clear()
    loaded, kept, shared, effect_shared = { item = {}, status = {}, weapon = {} }, {}, nil, nil;
end

return icons;
