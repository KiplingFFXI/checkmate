--[[
    Named settings shared by every character in config\addons\checkmate\profiles.json.
    Read the file before changing it, then write a temporary copy and replace the original only
    after the write succeeds. An unreadable file stays untouched.

    Job links, merits and visible tabs belong to each character. Window positions and size belong to this screen.
]]

local json     = require('json');
local defaults = require('ui.defaults');
local printout = require('core.printout');
local skins    = require('ui.skins');
local ffi      = require('ffi');
local parts    = require('core.parts');
local history  = require('ui.history');
local presets  = require('ui.presets');

ffi.cdef[[
    unsigned long __stdcall GetCurrentProcessId(void);
    int __stdcall MoveFileExA(const char* existing, const char* replacement, unsigned long flags);
]];

local profiles = {};

-- Longest profile name, in characters.
profiles.NAME_MAX = 32;

-- Main jobs 1 to 18 by abbreviation, in job id order. Dancer and Scholar came after the era.
profiles.JOBS = {
    'WAR', 'MNK', 'WHM', 'BLM', 'RDM', 'THF', 'PLD', 'DRK', 'BST',
    'BRD', 'RNG', 'SAM', 'NIN', 'DRG', 'SMN', 'BLU', 'COR', 'PUP',
};

-- Settings a profile leaves alone. Job links and your merits belong to each character, and where the window and
-- the overlay sit and the window's size belong to this screen. Tab visibility stays with the character too.
local NOT_SAVED = { job_links = true, window = true, merits = true, profile_source = true };

-- Sections a profile from an older version may not have. Yours stays as it is when it's missing, so loading an
-- old profile, or changing to a job linked to one, doesn't turn the overlay off or put back the abbreviations you
-- typed.
local KEEP_WHEN_MISSING = { overlay = true, short = true };

-- Settings inside a section that a profile from an older version may not have, kept as yours the same way. An old
-- profile has no abbreviations switch for chat, so it doesn't turn it off.
local KEEP_KEYS_WHEN_MISSING = { printout = { 'short_words' } };

-- The shared file, in checkmate's config folder.
local FILE_NAME = 'profiles.json';

local saved    = nil;     -- Every profile by name, as last read from the file.
local names    = {};      -- The profile names in alphabetical order.
local readable = true;    -- False when an existing file can't be read as JSON.
local save_id = 0;
local deleted = nil;
local overwritten = nil;
local revision = 0;
local statuses = setmetatable({}, { __mode = 'k' });

local function folder()
    return ('%s\\config\\addons\\%s\\'):format(AshitaCore:GetInstallPath(), addon.name);
end

-- A fresh copy. Tables come back as T{} tables, like the ones the settings library hands out.
local function copy(value)
    if (type(value) ~= 'table') then
        return value;
    end
    local out = T{};
    for key, inner in pairs(value) do
        out[key] = copy(inner);
    end
    return out;
end

local function sort_names()
    names = {};
    for name in pairs(saved) do
        names[#names + 1] = name;
    end
    table.sort(names, function (a, b) return a:lower() < b:lower(); end);
end

-- Reads the file. No file means no profiles.
local function read()
    saved, readable = {}, true;
    revision = revision + 1;
    local path = folder() .. FILE_NAME;
    local file = io.open(path, 'r');
    if (file ~= nil) then
        local text = file:read('*a');
        file:close();
        local ok, data = pcall(json.decode, text);
        if (ok and type(data) == 'table') then
            for name, profile in pairs(data) do
                if (type(name) == 'string' and type(profile) == 'table') then
                    saved[name] = profile;
                end
            end
        else
            readable = false;
        end
    elseif (ashita.fs.exists(path)) then
        readable = false;
    end
    sort_names();
    return saved;
end

-- Reads the file the first time anything asks about the profiles.
local function read_once()
    if (saved == nil) then
        read();
    end
end

local function write()
    if (not readable) then
        return false;
    end
    local ok, text = pcall(json.encode, saved);
    if (not ok) then
        return false;
    end
    ashita.fs.create_dir(folder());
    local path = folder() .. FILE_NAME;
    save_id = save_id + 1;
    local temp = ('%s.%d.%d.tmp'):format(path, tonumber(ffi.C.GetCurrentProcessId()), save_id);
    local file = io.open(temp, 'w');
    if (file == nil) then
        return false;
    end
    local written = file:write(text);
    local closed = file:close();
    if (not written or not closed) then
        os.remove(temp);
        return false;
    end
    -- Replace only after the complete file is closed. A failed save leaves the old file in place.
    local replaced = ffi.C.MoveFileExA(temp, path, 9) ~= 0; -- REPLACE_EXISTING | WRITE_THROUGH.
    if (not replaced) then
        os.remove(temp);
        return false;
    end
    sort_names();
    revision = revision + 1;
    return true;
end

-- Your saved value, with anything missing or of the wrong type taken from the defaults.
local function fill(value, default)
    if (type(value) ~= type(default)) then
        return copy(default);
    end
    if (type(default) == 'table') then
        for key, inner in pairs(default) do
            value[key] = fill(value[key], inner);
        end
    end
    return value;
end

-- Printable ASCII, no spaces at either end, and no longer than NAME_MAX.
function profiles.clean_name(name)
    local text = printout.clean_text(name):match('^%s*(.-)%s*$');
    return (text:sub(1, profiles.NAME_MAX):gsub('%s+$', ''));
end

-- Reads the file again, since another character can change it.
function profiles.refresh()
    read();
end

-- The profile names in alphabetical order. Don't change the list.
function profiles.names()
    read_once();
    return names;
end

function profiles.exists(name)
    read_once();
    return saved[name] ~= nil;
end

-- False when profiles.json is there but can't be read. Nothing is saved until it's fixed or removed.
function profiles.file_ok()
    read_once();
    return readable;
end

-- Saves `settings` as the named profile, new or over an old one.
function profiles.save(settings, name)
    name = profiles.clean_name(name);
    if (name == '') then
        return false;
    end
    read();
    local before = saved[name];
    local profile = {};
    for key, value in pairs(settings) do
        if (not NOT_SAVED[key]) then
            profile[key] = copy(value);
        end
    end
    saved[name] = profile;
    if (not write()) then
        saved[name] = before;
        return false;
    end
    if (before ~= nil and not history.equal(before, profile)) then
        overwritten = { name = name, before = copy(before), after = copy(profile) };
    end
    settings.profile_source = T{ kind = 'profile', name = name };
    profiles.changed(settings);
    return true;
end

-- Loads the named profile into `settings`. Anything a newer version added comes from the defaults, but a
-- profile with no overlay settings or abbreviations leaves yours as they are. Undo is cleared, since the look it
-- keeps is from before the load.
local function apply_profile(settings, profile)
    profile = copy(profile);
    -- Profiles without an overlay keep its rows and component choices together.
    if (profile.overlay == nil) then
        profile.overlay = copy(settings.overlay);
        profile.weaknesses = type(profile.weaknesses) == 'table' and profile.weaknesses or T{};
        profile.blue = type(profile.blue) == 'table' and profile.blue or T{};
        profile.weaknesses.overlay = copy((settings.weaknesses or {}).overlay);
        profile.blue.overlay = copy((settings.blue or {}).overlay);
    end
    parts.migrate(profile);
    local base = defaults.make();
    -- Chat colors stay as the profile has them. Tidying the settings after the load fills a missing one
    -- from the profile's own skin, like it does for a settings file.
    base.colors = T{};
    for key, default in pairs(base) do
        if (not NOT_SAVED[key]) then
            local value = profile[key];
            if (value == nil and KEEP_WHEN_MISSING[key]) then
                value = settings[key];
            end
            value = copy(value);
            if (key == 'magic' and type(value) == 'table' and type(value.known_inputs) ~= 'boolean') then
                value.known_inputs = (tonumber(value.extra_accuracy) or 0) == 0;
            end
            for _, inner in ipairs(KEEP_KEYS_WHEN_MISSING[key] or {}) do
                if (type(value) == 'table' and value[inner] == nil) then
                    value[inner] = settings[key][inner];
                end
            end
            settings[key] = fill(value, default);
        end
    end
end

function profiles.load(settings, name)
    local profile = read()[name];
    if (profile == nil) then return false; end
    apply_profile(settings, profile);
    settings.profile_source = T{ kind = 'profile', name = name };
    profiles.changed(settings);
    skins.forget_undo();
    return true;
end

local function comparable(settings)
    local out = {};
    for key, value in pairs(settings) do
        if (not NOT_SAVED[key]) then out[key] = value; end
    end
    return out;
end

-- Called after an actual edit. Drawing the status does not compare every setting each frame.
function profiles.changed(settings)
    read_once();
    local source = settings.profile_source or {};
    local status = { kind = source.kind or '', name = source.name or '', modified = false, missing = false };
    if (status.kind == 'preset') then
        local preset = presets.find(status.name);
        status.modified = not presets.matches(settings, status.name);
        status.missing = preset == nil;
        status.label = preset and preset.name or status.name;
    elseif (status.kind == 'profile') then
        local profile = saved[status.name];
        status.missing = profile == nil or not readable;
        if (not status.missing) then
            local expected = copy(settings);
            apply_profile(expected, profile);
            -- Fill the same skin defaults used after a profile is loaded.
            local current = copy(settings);
            for _, value in ipairs({ expected, current }) do
                skins.fill(value);
                local skin = skins.find(value.look.skin);
                defaults.fix_colors(value, skin and skin.chat);
            end
            status.modified = not history.equal(comparable(current), comparable(expected));
        else
            status.modified = true;
        end
        status.label = status.name;
    else
        status.kind, status.name, status.label = '', '', 'Custom settings';
    end
    statuses[settings] = { revision = revision, status = status };
    return copy(status);
end

function profiles.status(settings)
    local cached = statuses[settings];
    if (cached == nil or cached.revision ~= revision) then return profiles.changed(settings); end
    return copy(cached.status);
end

function profiles.mark_preset(settings, id)
    local preset = presets.find(id);
    if (preset == nil) then return false; end
    settings.profile_source = T{ kind = 'preset', name = preset.id };
    profiles.changed(settings);
    return true;
end

function profiles.overwritten_name()
    return overwritten and overwritten.name;
end

-- Read again and restore only when this is still the exact version we overwrote it with.
function profiles.undo_overwrite()
    if (overwritten == nil) then return false, 'none'; end
    read();
    if (not readable) then return false, 'file'; end
    if (not history.equal(saved[overwritten.name], overwritten.after)) then return false, 'changed'; end
    saved[overwritten.name] = copy(overwritten.before);
    if (not write()) then saved[overwritten.name] = copy(overwritten.after); return false, 'file'; end
    local name = overwritten.name;
    overwritten = nil;
    return true, name;
end

-- Renames a profile. This character's job links follow it.
function profiles.rename(settings, old, new)
    new = profiles.clean_name(new);
    read();
    if (saved[old] == nil or new == '' or saved[new] ~= nil) then
        return false;
    end
    saved[new], saved[old] = saved[old], nil;
    if (not write()) then
        saved[old], saved[new] = saved[new], nil;
        return false;
    end
    for job, linked in pairs(settings.job_links) do
        if (linked == old) then
            settings.job_links[job] = new;
        end
    end
    if (settings.profile_source and settings.profile_source.kind == 'profile' and settings.profile_source.name == old) then
        settings.profile_source.name = new;
    end
    profiles.changed(settings);
    return true;
end

-- Deletes a profile. This character's job links to it go too.
function profiles.delete(settings, name)
    read();
    local before = saved[name];
    if (before == nil) then
        return false;
    end
    saved[name] = nil;
    if (not write()) then
        saved[name] = before;
        return false;
    end
    deleted = { name = name, profile = copy(before), links = {}, owner = settings };
    for job, linked in pairs(settings.job_links) do
        if (linked == name) then
            deleted.links[job] = name;
            settings.job_links[job] = nil;
        end
    end
    profiles.changed(settings);
    return true;
end

function profiles.deleted_name()
    return deleted and deleted.name;
end

-- Restore only the last successful deletion, without overwriting a recreated profile or new job link.
function profiles.undo_delete(settings)
    if (deleted == nil) then return false, 'none'; end
    read();
    if (not readable) then return false, 'file'; end
    if (saved[deleted.name] ~= nil) then return false, 'exists'; end
    saved[deleted.name] = copy(deleted.profile);
    if (not write()) then saved[deleted.name] = nil; return false, 'file'; end
    if (settings == deleted.owner) then
        for job, name in pairs(deleted.links) do
            if (settings.job_links[job] == nil) then settings.job_links[job] = name; end
        end
    end
    local name = deleted.name;
    deleted = nil;
    return true, name;
end

-- Loads the profile linked to this main job id. Returns its name, or nil when nothing loaded.
function profiles.on_job(settings, job_id)
    local job = profiles.JOBS[job_id];
    local name = job and settings.job_links[job];
    if (type(name) ~= 'string' or not profiles.load(settings, name)) then
        return nil;
    end
    return name;
end

return profiles;
