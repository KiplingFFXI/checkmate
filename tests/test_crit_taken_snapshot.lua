-- Player and pet stat replies keep the Crit taken reading from the first chat pass.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local details = require('core.check_details');
local settings = MOCK.settings.current;
local player = MOCK.player;
local safety_mantle = 15463;

local function setup()
    player.main_job, player.main_level, player.stats[3] = 14, 75, 56;
    player.equipment = { [15] = safety_mantle };
    settings.merits.enemy_crit_rate = 0;
    MOCK.zone_in(65);
    MOCK.target_monster(18, 'Mamool Ja Bounder');
    MOCK.commands = {};
end

local function examine()
    MOCK.packet(MOCK.check_packet(18, 74, 4, 174));
    MOCK.frame(0.3);
    return details.current();
end

local function printed_since(first)
    return table.concat(MOCK.printed_since(first), ' '):gsub(string.char(30) .. '.', '');
end

local function change_inputs()
    player.stats[3] = 100;
    player.equipment = {};
    settings.merits.enemy_crit_rate = 4;
end

local function same_reading(before, after)
    local original, inputs = before.crittaken_inputs, after.crittaken_inputs;
    return after.crittaken ~= nil and after.crittaken.low == before.crittaken.low
        and after.crittaken.high == before.crittaken.high
        and inputs ~= nil and original ~= nil and inputs.agi == 56 and inputs.level == 75
        and inputs.crit_evasion == 2 and inputs.enemy_crit_merits == 0
        and type(inputs.observed_at) == 'number' and inputs.observed_at == original.observed_at;
end

MOCK.command('/checkmate show crittaken');
MOCK.command('/checkmate show hit');
setup();
local start = #MOCK.printed;
local before = examine();
expect('first check captures the rate with Safety Mantle', before.crittaken.low, 9);
check('the shared Hit line waits for player stats', not printed_since(start):find('Crit taken:', 1, true));
change_inputs();
MOCK.wait(1.6);
MOCK.reply(300, 250);
MOCK.frame(0.3);
check('the player reply keeps the original Crit taken rate and inputs', same_reading(before, details.current()));
check('the delayed chat line prints the original rate', printed_since(start):find('Crit taken: 9%', 1, true) ~= nil);

MOCK.command('/checkmate hide hit');
MOCK.command('/checkmate show pet');
settings.printout.parts.pet.new_line = true;
setup();
MOCK.summon('Azure');
start = #MOCK.printed;
before = examine();
check('Crit taken prints before the separate pet reply', printed_since(start):find('Crit taken: 9%', 1, true) ~= nil);
change_inputs();
start = #MOCK.printed;
MOCK.wait(1.6);
expect('only the pet stat request is sent', #MOCK.commands, 1);
expect('the request is for the pet', MOCK.commands[1].command, '/checkparam <pet>');
MOCK.pet_reply(150, 140);
MOCK.frame(0.3);
check('the pet reply keeps the Crit taken reading in Target details', same_reading(before, details.current()));
check('the pet reply prints only its own line', printed_since(start):find('Pet:', 1, true) ~= nil
    and not printed_since(start):find('Crit taken:', 1, true));

MOCK.command('/checkmate hide pet');
MOCK.dismiss();
local fresh = examine();
expect('a new check uses the changed inputs', fresh.crittaken.low, 1);

MOCK.command('/checkmate hide crittaken');
MOCK.command('/checkmate show crit');
local outgoing = examine();
check('outgoing Crit does not publish a disabled Crit taken reading', outgoing.crit ~= nil
    and outgoing.crittaken == nil and outgoing.crittaken_inputs == nil);

return MOCK.report();
