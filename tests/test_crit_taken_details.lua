dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s, p = MOCK.settings.current, MOCK.player;
local target = require('core.target');
local check_details = require('core.check_details');
local tips = require('ui.tips');

local function command(text) MOCK.command('/checkmate ' .. text); end
local function has(text, part) return (text or ''):find(part, 1, true) ~= nil; end
local function detail(result, id)
    for _, group in ipairs(tips.detail_groups(s, result)) do
        if (group.id == id) then return group.text; end
    end
end
local function hover(result) return tips.text(s, result, 'number', 'crittaken'); end
local function select_mob(zone, index, name)
    MOCK.zone_in(zone);
    MOCK.target_monster(index, name);
    MOCK.frame();
    return target.current();
end

p.main_level, p.stats[3] = 75, 56;
p.equipment = { [15] = 15463 };   -- Safety Mantle
command('overlay on');
command('overlayshow crit');
local result = select_mob(65, 18, 'Mamool Ja Bounder');
check('outgoing Crit alone does not expose an incoming result', result.crit ~= nil
    and result.crittaken == nil and result.crittaken_inputs == nil);
expect('both incoming switches off hide Crit taken details', detail(result, 'crittaken'), nil);

command('show crittaken');
MOCK.frame();
expect('the chat switch does not add Crit taken to the current overlay details', detail(target.current(), 'crittaken'), nil);
command('overlayshow crittaken');
command('overlayhide crit');
MOCK.frame();
result = target.current();
check('incoming-only overlay uses its gear and leaves outgoing Crit out', result.crit == nil
    and result.crittaken.low == 9 and result.crittaken.high == 12);
check('ordinary-hit help explains the displayed inputs', has(hover(result), 'normal hits that land')
    and has(hover(result), 'AGI 56') and has(hover(result), 'Gear crit reduction 2'));
command('overlayhide crittaken');
expect('old overlay details stay hidden with only chat enabled', detail(result, 'crittaken'), nil);
expect('old overlay hover stays hidden with only chat enabled', hover(result), nil);

command('overlay off');
MOCK.packet(MOCK.check_packet(18, 74, 4, 174));
MOCK.frame();
local saved = check_details.current();
check('incoming-only chat keeps its own rate and details', saved.crittaken.low == 9 and saved.crit == nil
    and has(detail(saved, 'crittaken'), 'Gear crit reduction 2'));
MOCK.now = saved.crittaken_inputs.observed_at + 7;
expect('saved incoming inputs have their own age', tips.more(s, saved, 'number', 'crittaken'), 'Crit taken inputs: 0:07 ago.');
command('details');
MOCK.clicks['Copy details'] = true;
MOCK.frame();
check('Copy details includes the saved incoming inputs', has(MOCK.clipboard, 'Gear crit reduction 2')
    and has(MOCK.clipboard, 'Crit taken inputs: 0:07 ago.'));
command('hide crittaken');
MOCK.clicks['Copy details'] = true;
MOCK.frame();
check('Copy details hides Crit taken on the same saved result after turning it off', check_details.current() == saved
    and not has(MOCK.clipboard, 'Gear crit reduction') and not has(MOCK.clipboard, 'Crit taken inputs'));
MOCK.command('/checkmate');
command('overlay on');
command('overlayshow crittaken');
expect('old chat details stay hidden with only overlay enabled', detail(saved, 'crittaken'), nil);

local no_swings = select_mob(18, 28, 'Memory Receptacle');
check('no swings has the same meaning in hover and details', has(hover(no_swings), 'no normal swings')
    and has(detail(no_swings, 'crittaken'), 'no normal-hit crit rate') and not has(hover(no_swings), 'Inputs'));
expect('no-rate help has no rate input age', tips.more(s, no_swings, 'number', 'crittaken'), nil);

local tp_moves = select_mob(139, 34, 'Sniper Pugil');
check('TP-move-only help explains the displayed status', has(hover(tp_moves), 'TP moves in place of normal swings')
    and has(detail(tp_moves, 'crittaken'), 'TP moves use separate rules') and not has(hover(tp_moves), 'Inputs'));

local counter = select_mob(39, 44, 'Nantina');
check('the counter rate is explained as counters that land', has(hover(counter), 'counters that land')
    and has(detail(counter, 'crittaken'), 'counters that land') and not has(hover(counter), 'normal hits that land'));
local unknown_counter = { name = counter.name, tp_moves = true, counters = true,
    crittaken_inputs = counter.crittaken_inputs };
check('an unknown counter rate still has its own details', has(detail(unknown_counter, 'crittaken'), 'counters that land')
    and has(hover(unknown_counter), 'The rate is unknown.'));

addon.path = FIXTURES_PATH;
local unknown = select_mob(900, 5, 'Fixture Rabbit');
check('an enabled unknown rate keeps its group', unknown.crittaken == nil and unknown.crittaken_inputs ~= nil
    and has(detail(unknown, 'crittaken'), 'The rate is unknown.'));
return MOCK.report();
