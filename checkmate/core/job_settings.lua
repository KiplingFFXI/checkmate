-- Job filters leave saved rows and manual Treasure Hunter alone.
local player = require('core.player');
local data = require('data.job_settings');
local steal = require('data.steal');
local jobs = {};
local snapshot;
local next_refresh, last_th = 0, false;
local revision = 0;
local trait_ids = {};
for id in pairs(data.traits) do trait_ids[#trait_ids + 1] = id; end
table.sort(trait_ids);

local function clamp(value)
    value = tonumber(value) or 0;
    if (value ~= value or math.abs(value) == math.huge) then value = 0; end
    return math.max(0, math.min(data.maximum, math.floor(value)));
end

function jobs.clear()
    snapshot = nil;
    next_refresh, last_th = 0, false;
    revision = revision + 1;
end

function jobs.version()
    return revision;
end

function jobs.state()
    return snapshot;
end

-- The caller refreshes before a new check and when its existing input watcher sees a change.
function jobs.refresh(want_th, now)
    want_th = want_th == true;
    next_refresh, last_th = (now or os.clock()) + 0.25, want_th;
    local input = player.job_inputs(want_th, data.traits, trait_ids);
    local next = { known = input.known == true, main_job = input.main_job, main_level = input.main_level,
        sub_job = input.sub_job, sub_level = input.sub_level, signature = input.signature };
    if (next.known) then
        local level = input.main_job == steal.ability.job and input.main_level
            or (input.sub_job == steal.ability.job and input.sub_level or 0);
        next.can_steal = level >= steal.ability.level;
    end
    if (want_th) then
        next.th_known, next.th_note = input.th_known == true, input.th_note;
        if (next.th_known) then
            local value = input.trait_th;
            for slot = 0, 15 do
                local id = input.equipment[slot];
                local item = data.items[id];
                if (item ~= nil and input.main_level >= item.level) then value = value + item.value; end
                local conditional = data.conditional_items[id];
                if (conditional ~= nil and input.main_level >= conditional) then
                    next.th_known = false;
                    next.th_note = 'A conditional Treasure Hunter bonus on your gear cannot be read.';
                end
            end
            next.th = clamp(value);
        end
    end
    local changed = snapshot == nil or snapshot.signature ~= next.signature
        or snapshot.th_known ~= next.th_known or snapshot.th ~= next.th or snapshot.th_note ~= next.th_note;
    snapshot = next;
    if (changed) then revision = revision + 1; end
    return changed;
end

function jobs.poll(want_th, now)
    want_th, now = want_th == true, now or os.clock();
    if (snapshot ~= nil and (not want_th or last_th) and now < next_refresh) then return false; end
    return jobs.refresh(want_th, now);
end

function jobs.permits_blue_learning(s)
    return (s.job_settings or {}).hide_blue_learning ~= true or snapshot == nil
        or not snapshot.known or snapshot.main_job == data.learning_job;
end

function jobs.permits_steal(s)
    return (s.job_settings or {}).hide_steal ~= true or snapshot == nil
        or not snapshot.known or snapshot.can_steal;
end

function jobs.treasure_hunter(setting)
    local manual = clamp(setting.th);
    if (setting.th_mode ~= 'auto') then return { level = manual, mode = 'manual', known = true }; end
    if (snapshot ~= nil and snapshot.th_known) then
        return { level = snapshot.th, mode = 'auto', known = true,
            note = 'Uses your current Treasure Hunter traits and equipped gear. The monster may have a higher TH value from an earlier action or another player.' };
    end
    local reason = snapshot and snapshot.th_note or 'Your current jobs and equipment have not been read yet.';
    return { level = manual, mode = 'auto', known = false, fallback = true,
        note = ('Automatic TH unavailable; using manual TH %d. %s'):format(manual, reason) };
end

return jobs;
