-- Header fields stay together when they fit. Long fields can wrap at spaces.
local header = {};

local function field(run)
    if (run.tip_kind == 'level' and (run.tip_id == 'name' or run.tip_id == 'id')) then return run.tip_id; end
    if (run.tip_kind == 'ph' and run.tip_id == 'ph') then return 'ph'; end
end

local function copy(run, text)
    return { code = run.code, text = text, tip_kind = run.tip_kind, tip_id = run.tip_id, header = true };
end

function header.prepare(runs, wrap, measure, indent)
    if (wrap <= 0) then return runs; end
    local out, at = {}, 1;
    while (at <= #runs) do
        local first, id = at, field(runs[at]);
        -- A custom name label belongs to the name field, but keeps its own hover behavior.
        if (at == 1 and id == nil) then
            local next_run = at;
            while (runs[next_run] and runs[next_run].text and runs[next_run].tip_kind == nil) do next_run = next_run + 1; end
            if (runs[next_run] and field(runs[next_run]) == 'name') then at, id = next_run, 'name'; end
        end
        if (id == nil) then
            out[#out + 1], at = runs[at], at + 1;
        else
            local last, width = at, 0;
            while (runs[last + 1] and field(runs[last + 1]) == id) do last = last + 1; end
            for index = first, last do width = width + measure(runs[index].text); end
            local limit = wrap - (first == 1 and 0 or measure(indent));
            width = width - measure(runs[first].text:match('^%s*')) - measure(runs[last].text:match('%s*$'));
            local start = #out + 1;
            for index = first, last do
                local run = runs[index];
                if (width <= limit) then
                    out[#out + 1] = copy(run, run.text);
                else
                    local pos = 1;
                    while (pos <= #run.text) do
                        local a, b = run.text:find('%s+', pos);
                        if (a == nil) then out[#out + 1] = copy(run, run.text:sub(pos)); break; end
                        if (a > pos) then out[#out + 1] = copy(run, run.text:sub(pos, a - 1)); end
                        local spaces = copy(run, run.text:sub(a, b));
                        spaces.breaks = true;
                        out[#out + 1], pos = spaces, b + 1;
                    end
                end
            end
            if (out[start]) then out[start].break_before = first > 1; end
            at = last + 1;
        end
    end
    return out;
end

return header;
