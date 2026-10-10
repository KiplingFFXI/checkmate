-- Build checks read bounded headers and keep source revision separate from content settings.
local diagnostics = require('core.diagnostics');
local bands = require('data.bands');
local monsters = require('core.monsters');
local original_path, original_open = addon.path, io.open;
local original_built, original_content = monsters.built, monsters.content;

addon.path = ADDON_PATH;
monsters.preload(103);
expect('loaded zone exposes its content setting', monsters.content(), bands.content);
local real = diagnostics.text('real-bundle');
check('all real generated datasets agree', real:find('Bundled data revisions and content settings match.', 1, true) ~= nil, real);
expect('diagnostics do not load the finder catalogue', package.loaded['data.blue_finder'], nil);

local files, reads, closes, largest_read = {}, 0, 0, 0;
local names = { 'bands', 'too_weak', 'pets', 'steal', 'crit', 'effects', 'modifiers', 'pdif', 'defenses', 'blue_finder' };
local function header(built, content)
    return '-- Built by tools/export_data.py from ' .. built .. '.\n-- It assumes ' .. content .. '.\n';
end
for _, name in ipairs(names) do files[name] = header(bands.built, bands.content); end
files.modifiers = "return { built = '" .. bands.built .. "', content = '" .. bands.content .. "' };";
files.blue_finder = files.blue_finder .. string.rep(' ', 8000) .. "error('must not run the catalogue')";
addon.path = 'diagnostics-fixture/';
local zone, zone_content = bands.built, bands.content;
monsters.built = function() return zone; end;
monsters.content = function() return zone_content; end;
io.open = function(path, mode)
    local name = path:match('^diagnostics%-fixture/data/(.+)%.lua$');
    if (not name) then return original_open(path, mode); end
    local body = files[name];
    if (body == nil) then return nil; end
    return {
        read = function(_, count)
            reads = reads + 1;
            largest_read = math.max(largest_read, count);
            return body:sub(1, count);
        end,
        close = function() closes = closes + 1; end,
    };
end;

local same = diagnostics.text('1');
check('finder stamps are found before its large shared tables', same:find('settings match.', 1, true) ~= nil, same);
expect('all ten generated globals are checked', reads, #names);
expect('every opened header is closed', closes, reads);
expect('the largest read is bounded to 4096 bytes', largest_read, 4096);
expect('quiet repeated diagnostics reuse the summary', diagnostics.text('1'), same);
expect('cached diagnostics do not reopen files', reads, #names);

files.blue_finder = header('phoenix/live old', bands.content);
local stale = diagnostics.text('2');
check('a stale finder is named', stale:find('blue_finder: phoenix/live old', 1, true) ~= nil, stale);
files.blue_finder = header(bands.built, 'different content');
local wrong_content = diagnostics.text('3');
check('same revision with different finder content is rejected', wrong_content:find('blue_finder: different content', 1, true) ~= nil, wrong_content);
files.blue_finder = nil;
local missing = diagnostics.text('4');
check('a missing finder is named', missing:find('blue_finder: missing build stamp', 1, true) ~= nil, missing);
files.blue_finder = '-- No supported stamps.\nreturn {};';
local unstamped = diagnostics.text('5');
check('missing content cannot be treated as matching', unstamped:find('blue_finder: missing content stamp', 1, true) ~= nil, unstamped);
files.blue_finder = header(bands.built, bands.content);
files.modifiers = "return { built = '" .. bands.built .. "', content = 'other content' };";
local modifiers = diagnostics.text('6');
check('table-stamped modifiers also check content', modifiers:find('modifiers: other content', 1, true) ~= nil, modifiers);
files.modifiers = "return { built = '" .. bands.built .. "', content = '" .. bands.content .. "' };";
local prior = diagnostics.text('7');
zone_content = 'zone content changed';
local changed_zone = diagnostics.text('7');
check('loaded zone content invalidates the cache', changed_zone ~= prior);
check('loaded zone content mismatch is named', changed_zone:find('current zone: zone content changed', 1, true) ~= nil, changed_zone);
zone, zone_content = nil, nil;
local no_zone = diagnostics.text('7');
check('no loaded zone is a normal state', no_zone:find('Current zone: no dataset loaded', 1, true) ~= nil and no_zone:find('settings match.', 1, true) ~= nil, no_zone);
check('the summary does not claim deployed source verification', no_zone:find('do not verify the running server.', 1, true) ~= nil);

io.open, addon.path = original_open, original_path;
monsters.built, monsters.content = original_built, original_content;
monsters.forget_zone();
expect('clearing a loaded zone clears its content stamp', monsters.content(), nil);
return MOCK.report();
