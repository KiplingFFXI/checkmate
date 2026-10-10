local requests = require('core.checkparam');
requests.ask('me', {}, 1001);
requests.on_reply(1, 712, 300, 1001, 558);
requests.on_reply(1, 713, 280, 1001, 490);
requests.on_reply(1, 714, 260, 1001, 610);
requests.on_reply(1, 715, 220, 1001);
local a, e, o, r, att, off, ranged = requests.values('me');
check('accuracy and attack use separate reply parameters', a == 300 and e == 220 and o == 280 and r == 260
    and att == 558 and off == 490 and ranged == 610);
requests.ask('me', {}, 1001);
requests.on_reply(2, 712, 900, 2002, 999);
local _, _, _, _, fresh = requests.values('me');
expect('new request clears Attack and ignores other players', fresh, nil);
requests.ask('pet', {}, 1234);
requests.on_reply(2, 712, 200, 1234, 777);
local _, _, _, _, pet_attack = requests.values('pet');
expect('pet replies cannot become player Attack', pet_attack, nil);
requests.reset();

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
MOCK.target_monster(1, 'Fixture Goblin');
local monsters = require('core.monsters');
local row = monsters.find(900, 1, 'Fixture Goblin');
for _, stats in pairs(row.levels) do stats.def = 365; end
local s = MOCK.settings.current;
for _, part in pairs(s.printout.parts) do part.on = false; end
for name in pairs(s.overlay.parts) do s.overlay.parts[name] = false; end
s.overlay.on = false;
s.printout.parts.pdif.on = true;
s.pdif.mode = 'ratio';
local player = require('core.player');
player.read = function() error('pDIF alone must not read the full combat snapshot'); end;
local function reply(attack, offhand, ranged_attack)
    local hidden = 0;
    for _, packet in ipairs(MOCK.checkparam_packets(300, 250, nil, 280, 260, attack, offhand, ranged_attack)) do
        if (MOCK.packet(packet).blocked) then hidden = hidden + 1; end
    end
    return hidden;
end
local function begin()
    local before = #MOCK.commands;
    MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
    MOCK.wait(1.4);
    expect('request keeps the existing delay', #MOCK.commands, before);
    MOCK.wait(0.2);
    expect('one request serves the pDIF rows', #MOCK.commands, before + 1);
end
local n = #MOCK.printed;
begin();
expect('our six reply lines are hidden', reply(558, 490, 610), 6);
MOCK.frame();
local text = table.concat(MOCK.printed_since(n), '\n');
check('ratio uses the server Attack and monster Defense', text:find('1.53', 1, true)
    and text:find('558', 1, true) and text:find('365', 1, true), text);
expect('passive cache holds the server Attack', player.pdif_inputs().attack, 558);
expect('an unsolicited reply stays visible', reply(600, 500, 650), 0);
expect('an unsolicited reply does not replace the snapshot', player.pdif_inputs().attack, 558);

n = #MOCK.printed;
begin();
MOCK.player.buffs = { 56 };
reply(650, 550, 700);
MOCK.frame();
text = table.concat(MOCK.printed_since(n), '\n');
check('changed pending inputs never print the received number', not text:find('650', 1, true), text);
expect('changed pending inputs discard the cached Attack', player.pdif_inputs().attack, nil);

begin();
reply(650, 550, 700);
MOCK.player.buffs = {};
n = #MOCK.printed;
MOCK.frame();
text = table.concat(MOCK.printed_since(n), '\n');
check('a change between reply and printing discards the number', not text:find('650', 1, true), text);

begin();
MOCK.player.buffs = { 56 };
local sent_before_recheck = #MOCK.commands;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
n = #MOCK.printed;
reply(558, 490, 610);
MOCK.frame();
text = table.concat(MOCK.printed_since(n), '\n');
expect('a second check reuses the request already sent', #MOCK.commands, sent_before_recheck);
check('a reused request keeps its original input signature', not text:find('558', 1, true), text);
expect('old request cannot seed a new gear or buff snapshot', player.pdif_inputs().attack, nil);
MOCK.player.buffs = {};

for _, mode in ipairs({ 'range', 'ratio', 'both' }) do
    MOCK.command('/checkmate pdifmode ' .. mode);
    expect('mode command selects ' .. mode, s.pdif.mode, mode);
end
MOCK.command('/checkmate pdifmode invalid');
expect('invalid mode keeps the current choice', s.pdif.mode, 'both');

MOCK.items[10], MOCK.items[11], MOCK.items[12], MOCK.items[13] = { Skill = 3 }, { Skill = 2 }, { Skill = 25 }, { Skill = 0 };
MOCK.player.equipment = { [0] = 10, [1] = 11, [2] = 12, [3] = 13 };
s.printout.parts.offhandpdif.on, s.printout.parts.rangedpdif.on = true, true;
begin();
n = #MOCK.printed;
reply(558, 490, 610);
MOCK.frame();
local lines = MOCK.printed_since(n);
text = table.concat(lines, '\n');
check('each weapon uses its own Attack on its own line', #lines == 3 and text:find('558', 1, true)
    and text:find('490', 1, true) and text:find('610', 1, true), text);
begin();
n = #MOCK.printed;
reply(558, 0, 0);
MOCK.frame();
text = table.concat(MOCK.printed_since(n), '\n');
check('missing weapon Attack does not reuse earlier values', not text:find('490', 1, true)
    and not text:find('610', 1, true), text);
begin();
n = #MOCK.printed;
MOCK.wait(3.2);
text = table.concat(MOCK.printed_since(n), '\n');
check('a timeout does not reuse an earlier Attack in chat', not text:find('558', 1, true), text);
s.printout.parts.offhandpdif.on, s.printout.parts.rangedpdif.on = false, false;

-- A manual check can refresh an overlay row without enabling its chat row.
s.printout.parts.pdif.on = false;
s.overlay.on = true;
s.overlay.parts.pdif = true;
MOCK.command('/checkmate overlayshow pdif');
begin();
n = #MOCK.printed;
reply(558, 490, 610);
MOCK.frame();
MOCK.wait(0.3);
local target = require('core.target');
local shown = target.current();
check('overlay-only pDIF gets the manual check snapshot', shown and shown.pdif and shown.pdif.attack == 558);
expect('overlay-only reply does not add a chat line', #MOCK.printed, n);
local sent = #MOCK.commands;
MOCK.wait(8);
expect('passive overlay never sends more requests', #MOCK.commands, sent);
MOCK.player.buffs = { 56 };
MOCK.wait(0.3);
shown = target.current();
check('overlay retains the last number after a buff change', shown and shown.pdif and shown.pdif.low ~= nil
    and shown.pdif.retained);
expect('stale overlay still sends no request', #MOCK.commands, sent);
return MOCK.report();
