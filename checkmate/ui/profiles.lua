--[[
    Saved profiles. A profile is a named copy of your checkmate settings.

    Every character shares the profiles in config\addons\checkmate\profiles.json. The file is read
    again before each change and written only when a profile changes, so two game windows don't undo
    each other's work. A file that can't be read is never written over.

    Job links stay with each character, in its own settings. A link names the profile that loads when
    you change to that main job and zone.
]]

local json     = require('json');
local defaults = require('ui.defaults');
local printout = require('core.printout');
local skins    = require('ui.skins');

local profiles = {};

-- Longest profile name, in characters.
profiles.NAME_MAX = 32;

-- Main jobs 1 to 18 by abbreviation, in job id order. Dancer and Scholar came after the era.
profiles.JOBS = {
    'WAR', 'MNK', 'WHM', 'BLM', 'RDM', 'THF', 'PLD', 'DRK', 'BST',
    'BRD', 'RNG', 'SAM', 'NIN', 'DRG', 'SMN', 'BLU', 'COR', 'PUP',
};

-- Settings a profile leaves alone. Job links belong to each character, and where the window sits and its
-- size belong to this screen.
local NOT_SAVED = { job_links = true, window = true };

-- The shared file, in checkmate's config folder.
local FILE_NAME = 'profiles.json';

local saved    = nil;     -- Every profile by name, as last read from the file.
local names    = {};      -- The profile names in alphabetical order.
local readable = true;    -- False when the file is there but isn't valid JSON.

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
    local file = io.open(folder() .. FILE_NAME, 'r');
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
    local file = io.open(folder() .. FILE_NAME, 'w');
    if (file == nil) then
        return false;
    end
    file:write(text);
    file:close();
    sort_names();
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
    return true;
end

-- Loads the named profile into `settings`. Anything a newer version added comes from the defaults.
-- Undo is cleared, since the look it keeps is from before the load.
function profiles.load(settings, name)
    local profile = read()[name];
    if (profile == nil) then
        return false;
    end
    local base = defaults.make();
    -- Chat colors stay as the profile has them. Tidying the settings after the load fills a missing one
    -- from the profile's own skin, like it does for a settings file.
    base.colors = T{};
    for key, default in pairs(base) do
        if (not NOT_SAVED[key]) then
            settings[key] = fill(copy(profile[key]), default);
        end
    end
    skins.forget_undo();
    return true;
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
    for job, linked in pairs(settings.job_links) do
        if (linked == name) then
            settings.job_links[job] = nil;
        end
    end
    return true;
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
