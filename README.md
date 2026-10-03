# checkmate

checkmate is an Ashita v4 addon for the Phoenix FFXI server. When you /check a monster, it prints what you'd want to know about it in chat. That's how tough it is, how its evasion and defense compare to your accuracy and attack, your hit rate, how often its swings miss you and your critical hit rate. It also tells you whether it will aggro you at your level and what links with it, how often your magic lands, what it's immune to, which elements it's weak to or resists, and what it drops at your Treasure Hunter. You pick which of those show, how they look and in what order.

It's built on the Phoenix server's own code and data, so the numbers follow what the server actually does instead of generic FFXI numbers.

> **Phoenix only allows addons that are on its approved list.** An addon under review can't be used until staff approve it. checkmate is its own addon, not part of cadence, so it needs its own approval under Rule 9. Don't use it on Phoenix until it shows up on https://phoenix-xi.com/approved-addons. Any change to the code counts as a new version that needs its own review. checkmate only does anything after a /check you do yourself. With hit rate or evade turned on, that includes sending `/checkparam <me>` for you after each /check. By default it also hides the game's own line for that /check and prints its own in its place, the way checker does. It also ships drop rates, immunities, and aggro and link data worked out from the Phoenix server's source.

This is what a level 20 Red Mage under Signet sees after a /check of a Goblin Tinkerer in Valkurm Dunes, with every part and the Elemental and Enfeebling schools turned on. It prints in place of the game's own /check line. The Tinkerer's defense reads normal and it has no immunities, so those are left out. Each `*` is a black star in game, which is the default divider. The star is a Japanese character the FFXI chat font draws, so this file can't show it. The colon after each label is the default label divider.

```
[checkmate] Goblin Tinkerer (Lv 19) * Decent Challenge (Low Evasion)
[checkmate] Hit: 81% * Evade: 34% with Signet * Crit: 5%
[checkmate] Aggro: Aggressive (Sight) * Links with Goblin Ambusher, Goblin Bounty Hunter, Goblin Butcher, Goblin Digger, Goblin Gambler * +14 more
[checkmate] Magic: Elemental 82% (Fire) * Enfeebling 99%
[checkmate] Elements: Weak: Light
[checkmate] Drops (TH 0): Goblin Helm 5.0%, Beastcoin 1.0%, Goblin Mail 1.0%
```

With only the parts that are on by default, a level 43 character who checks Valkurm Emperor sees this. It's a notorious monster, so /check can't gauge it. Without a widescan, checkmate only knows it's level 29 or 30. At level 43, a level 29 monster checks Too Weak to you, but a level 30 one doesn't.

```
[checkmate] Valkurm Emperor (Lv 29-30) * Impossible to Gauge
[checkmate] Aggro: Aggressive if it's level 30 or higher (Sound) * Links with Damselfly
```

## Features

- **Name and level.** It's always the first part, like `Goblin Tinkerer (Lv 19)`. When /check can't gauge a monster, checkmate uses the level your widescan saw, or else the levels that monster spawns at from its data, like `Lv 38-40`, and otherwise `Lv ?`. Turn off Show level to leave the level out. Show its level range too, off by default, adds the levels the monster spawns at after its known level, like `Goblin Tinkerer (Lv 19, range 18-19)`. You can change the word `range` or leave it out.
- **Difficulty and Evasion and defense (on by default).** Right after the name comes how tough the monster checks, from `Too Weak` to `Incredibly Tough`, or `Impossible to Gauge`, in a color for each con. Then, in parentheses, comes how its evasion and defense compare to your accuracy and attack, like `Very Tough (High Evasion, Low Defense)`. The parentheses are left out when both are normal. With Difficulty off they follow the name instead. Defense first puts defense before evasion.
- **Replaces the game's /check line (on by default).** The game's own line for your /check is hidden and checkmate's lines take its place. If your parts would print nothing, checkmate still prints the name, level, difficulty and evasion and defense, so a /check always gets an answer. checker, which the Phoenix launcher loads by default, replaces the same line, so with both loaded you see both addons' lines. If you turn this off, checkmate gives the game's line back, but checker still hides it while it's loaded.
- **Hit, evade and crit (off by default).** Your hit rate, how often its swings miss you (with Signet when it counts) and your critical hit rate. Each one is an exact number when checkmate has the monster in its data and knows its level, and a range when it doesn't. Hit and evade need a `/checkparam` that checkmate sends for you, so their line and the ones under it print about two seconds later. See [Why hit and evade print a moment later](#why-hit-and-evade-print-a-moment-later).
- **Aggro (on by default).** Whether the monster will aggro you at your level, worked out from your /check the way the server does it. The answer is `Aggressive`, `Too weak to aggro you unless you rest`, `Not aggressive` or `Never aggressive`, or `Aggressive at any level` for the few that ignore your level. For a monster that can't be gauged, checkmate goes by its level and says `Aggressive if it's level 30 or higher` when it could go either way. How it notices you follows in parentheses, like `(Sight, Sound)`, then a short note when its aggro changes, like `(awake 6:00-20:59)`. Last comes what it links with, like `Links with Goblin Thug, Goblin Weaver`, or `Doesn't link`. See [How aggro and links work](#how-aggro-and-links-work).
- **Magic (off by default).** Pick the schools you want from Elemental, Enfeebling, Dark, Divine, Healing (on undead only), Ninjutsu, Singing and Blue. A school only shows when you have skill in it. Each one uses a stand-in spell you can change. The elemental nukes, elemental ninjutsu and blue magic use the element the monster resists least and name it.
- **Immunities (off by default).** The monster's flat immunities, like Sleep, Bind and Gravity. You can turn each one on or off and give it your own label.
- **Elements (off by default).** The elements the monster is weak to and the ones it resists, like `Elements: Weak: Ice, Thunder * Resists: Water (half)`. Show how strong each one is adds how much, like `(half)`, `(never lands)` or `(absorbs)`, and a note when every element does more or less damage, like `Magic damage -25%`. You can change the words `Weak` and `Resists`. See [How elements work](#how-elements-work).
- **Drops (off by default).** Every item's chance at Treasure Hunter 0 to 4, which is as high as Phoenix goes. You pick how many items show, hide the rare ones and sort them by chance or by name. A note tells you when a script adds to the drops.
- **Grade colors.** Hit, evade and crit numbers show in a good, OK or bad color, with cutoffs you set.
- **Your own colors.** Every piece of chat text has its own color on the Colors tab. That's the `[checkmate]` tag, the dividers, the name and level, each con, the evasion and defense reading, and each part's label, numbers or names and small extras. See [Colors](#colors).
- **Your own layout.** Every part has its own label. You can type any word, like `Acc` instead of `Hit`, or leave it empty. Every part can start its own line and move up or down. Hit, evade, crit, aggro, magic, immunities, elements and drops start on the line below the name, difficulty and evasion and defense, or you can keep them on that same line. You also pick whether `[checkmate]` starts each line and whether ranges print as `64-72%` or `~68%`.
- **Dividers.** A black star goes between the parts by default. You can pick a white star, diamond, white diamond, circle, middle dot, music note, arrow, pipe, slash, dash, two spaces or your own text instead. The symbols are Japanese characters the FFXI chat font draws, and `/checkmate sample` shows how they look in your chat.
- **Label dividers.** A colon follows each part's label by default, like `Aggro: Aggressive` and `Hit: 81%`. You can pick one of the divider symbols, a plain space or your own text instead. A part with no label has no label divider.
- **Skins.** Phoenix, Classic FFXI, Minimal, High contrast, Ember and Colorblind safe. A skin sets the settings window's look and every chat color in one click, and you can still change any of it after. Undo takes back your last skin pick.
- **Every window color.** Each of the 41 colors the settings window draws with has its own picker on the Look tab. See [Window colors](#window-colors).
- **The window's font.** Ashita's own font, Segoe UI, Arial, Tahoma, Verdana, Calibri or Consolas, at 12 to 24 pixels. The window's layout grows and shrinks with the size. The chat log's font belongs to the game, and no addon can change it.
- **Profiles.** Save your whole setup under a name and load it on any character. Link a profile to a main job and it loads when you change to that job and zone.
- **Monster data for era content.** The open world, battlefields, Limbus, Phoenix's own Dynamis, all five Assault areas (Leujaoam Sanctum, Mamool Ja Training Grounds, Lebros Cavern, Periqia and Ilrusi Atoll) at every level cap, The Ashu Talif fights, and the Nyzul Isle fights (Path of Darkness, Nashmeira's Plea and Waking the Colossus). For a monster with no data, hit, evade and crit use the typical numbers for its level, and aggro, magic, immunities, elements and drops are left out.

## Installing

Once Phoenix staff approve checkmate, you can get it through the Phoenix launcher, and the launcher brings you each new version. You can also install it by hand from this repo's Releases page on GitHub.

1. Download `checkmate-<version>.zip` from the newest release on the Releases page.
2. Extract the zip into your Phoenix `addons` folder, for example `C:\Games\PhoenixXI\addons`. The zip holds the `checkmate` folder, so you end up with `addons\checkmate\checkmate.lua`.
3. In game, type `/addon load checkmate`.
4. To load it every time, open the Phoenix launcher, go to Addons, pick "Manually installed" and switch checkmate on. Or add `/addon load checkmate` at the bottom of `scripts\default.txt`, outside the block the launcher manages. Only do one of those, or it loads twice.

Your settings live in `config\addons\checkmate\`, outside the addon folder, so updating the addon keeps them.

## Keeping the monster data up to date

The monster data is built into each version of checkmate from the code Phoenix's live server runs. When Phoenix changes its monsters, a new version comes out with the new data. New versions come every so often, through the Phoenix launcher once checkmate is approved there, and on the Releases page. [CHANGELOG.md](CHANGELOG.md) says what changed in each one.

`/checkmate info` shows which Phoenix build your copy's data came from, like `checkmate 1.0.0. The monster data was built from phoenix/live f125de32dc.`

To update by hand, delete your old `addons\checkmate` folder and extract the new zip in its place, the same way you installed it. Your settings and profiles live in `config\addons\checkmate\`, so they carry over.

## Commands

Every setting in the settings window has a command too. `/checkmate help` lists the topics and the commands you'll use most, and `/checkmate help <topic>` lists the commands for one tab of the window, like `/checkmate help drops`. The topics are printout, colors, numbers, aggro, magic, drops, immunities, look and profiles, and the tables below are grouped the same way.

| Command | What it does |
|---|---|
| `/checkmate` | Opens or closes the settings window. If checkmate stopped after an error, this starts it again. |
| `/checkmate help [<topic>]` | Lists the topics and the commands you'll use most, or with a topic, the commands for that tab. `/checkmate help colors` also lists the color settings and the chat colors, and `/checkmate help windowcolors` lists the window colors. |
| `/checkmate sample` | Prints a made-up /check with your settings. |
| `/checkmate info` | Prints the version, what the monster data was built from and the content settings it assumes. Once a zone's data is loaded, it also says what that file was built from. |
| `/checkmate reset` | Puts every one of this character's settings back to its default, including the skin and every color, the window's font, size and position, and the job links. Your profiles stay. Type it twice within 10 seconds. |

### Printout tab

| Command | What it does |
|---|---|
| `/checkmate show <part>` / `hide <part>` | Shows or hides a part. The parts are name, difficulty, reading (Evasion and defense), hit, evade, crit, aggro, magic, immunities, elements and drops. |
| `/checkmate label <part> <text>` | Sets a part's label, up to 32 plain characters, like `label hit Acc`. Every part but reading has one, the name included. Put text with spaces in quotes, and `label hit ""` prints the part with no label. |
| `/checkmate newline <part> on\|off` | Starts a part on a new line, the same as its New line box. Every part but name and reading has one. |
| `/checkmate move <part> up\|down` | Moves a part up or down one place, the same as its arrows. The name always comes first and the reading goes with difficulty, so neither of them moves. |
| `/checkmate level on\|off` | Shows or hides the level after the name. |
| `/checkmate levelrange on\|off` | Shows or hides the levels a monster spawns at after its known level, like `(Lv 19, range 18-19)`. It's off by default. |
| `/checkmate rangeword <text>` | Sets the word before that range, `range` by default, up to 32 plain characters. Put text with spaces in quotes. `rangeword ""` leaves the word out, like `(Lv 19, 18-19)`. |
| `/checkmate reading evasion\|defense` | Puts evasion (the default) or defense first in the parentheses after the difficulty. |
| `/checkmate extras same\|new` | Same keeps hit, evade, crit, aggro, magic, immunities, elements and drops on the /check line unless their New line is on. New starts them on a line of their own, which is the default. |
| `/checkmate tag on\|off` | Starts each line of the printout with `[checkmate]`, which is the default, or leaves it off. checkmate's answers to your commands always have it. |
| `/checkmate divider <name>` | Sets what goes between parts. The dividers are star (the default), whitestar, diamond, whitediamond, circle, dot, note, arrow, pipe, slash, dash, spaces and custom. Custom uses the text you set with `divider custom <text>` or typed on the Printout tab. |
| `/checkmate divider custom <text>` | Puts your own text between parts, up to 8 plain characters. Put text with spaces in quotes, like `custom " - "`. With no text, custom uses the text you had. |
| `/checkmate labeldivider <name>` | Sets what goes right after each part's label. The label dividers are colon (the default), star, whitestar, diamond, whitediamond, circle, dot, note, arrow, pipe, slash, dash, space and custom. |
| `/checkmate labeldivider custom <text>` | Puts your own text right after each label, up to 8 plain characters, with a space after it. `custom >` prints `Aggro> Aggressive` and `custom " >"` prints `Aggro > Aggressive`. Put text with spaces in quotes. With no text, custom uses the text you had. |
| `/checkmate ranges range\|middle` | Prints a range of hit rate, evade, crit or magic as `64-72%`, which is the default, or as its middle, `~68%`. |
| `/checkmate replace on\|off` | Hides the game's own /check line so checkmate's lines take its place, which is the default, or shows it again. |

### Colors tab

| Command | What it does |
|---|---|
| `/checkmate concolors on\|off` | Paints each difficulty in its own color, which is the default, or all of them in One color. |
| `/checkmate threatcolors on\|off` | Paints Aggressive in the Threat color and the other answers in the Safe color, which is the default, or every answer in the Words color. |
| `/checkmate grades on\|off` | Colors the hit rate, evade and crit numbers good, OK or bad, which is the default, or in each part's Number color. |
| `/checkmate color <what> <color>` | Sets one chat color. `<what>` is a color setting from [Colors](#colors), like `hit_label`, and `<color>` is a chat color by name or number, like `lawngreen`, `Lawn green` or `2`. |

### Numbers tab

| Command | What it does |
|---|---|
| `/checkmate cutoff <hit\|evade\|crit> <good\|ok> <0-100>` | Sets where a number counts as Good or OK, like `cutoff hit good 90`. Hit is Good at 85 and OK at 70 by default, evade at 30 and 15, and crit at 15 and 8. Anything under OK is Bad. |

### Aggro tab

| Command | What it does |
|---|---|
| `/checkmate detection on\|off` | Shows or hides how an aggressive monster notices you, like `(Sight, Sound)`. It's on by default. |
| `/checkmate linknames on\|off` | Shows or hides the names a monster links with. It's on by default. With it off, the aggro part just says `Links` or `Doesn't link`. |
| `/checkmate maxlinks <0-12>` | Sets the most link names shown. 5 is the default and 0 shows every name. |

### Magic tab

| Command | What it does |
|---|---|
| `/checkmate school <school> on\|off` | Turns a magic school on or off. The schools are elemental, enfeebling, dark, divine, healing, ninjutsu, singing and blue. |
| `/checkmate spell <school> <spell>` | Sets the stand-in spell a school uses, by its short name or its full name, like `spell enfeebling paralyze` or `spell singing "Foe Requiem"`. `/checkmate spell <school>` lists that school's spells. Healing and Blue only have one each. |
| `/checkmate macc <0-100>` | Sets your extra magic accuracy from gear, food and merits. It's 0 by default and counts for every school. |
| `/checkmate weakword <text>` | Sets the word before the elements a monster is weak to, `Weak` by default, up to 32 plain characters. Put text with spaces in quotes. `weakword ""` leaves the word out. |
| `/checkmate resistword <text>` | Sets the word before the elements a monster resists, `Resists` by default. It works the same way as weakword. |
| `/checkmate strength on\|off` | Shows or hides how strong each weak or resisted element is, like `(half)`, and the `Magic damage` note. It's on by default. |

### Drops tab

| Command | What it does |
|---|---|
| `/checkmate th <0-4>` | Sets the Treasure Hunter for drop chances. |
| `/checkmate maxitems <0-12>` | Sets the most items shown. 5 is the default and 0 shows every item. |
| `/checkmate minchance <0-50>` | Leaves out items under this chance in percent. It can have one decimal place, like `minchance 2.5`. 0, the default, shows every item. |
| `/checkmate sort chance\|name` | Lists the items by chance, highest first, which is the default, or by name. |
| `/checkmate thlabel on\|off` | Shows or hides your Treasure Hunter in the label, like `Drops (TH 2)`. It's on by default. |
| `/checkmate dropnotes on\|off` | Shows or hides `(plus scripted drops)` and `(only drops if you get EXP)`. They're on by default. |

### Immunities tab

| Command | What it does |
|---|---|
| `/checkmate immunity <name> on\|off` | Shows or leaves out one immunity. The names are sleep, lullaby, bind, gravity, silence, stun, paralyze, slow, elegy, blind, poison, requiem, petrify, terror, plague and curse, the same as on the Immunities tab. Every one is on by default. |
| `/checkmate immunitylabel <name> <text>` | Sets the word an immunity prints as, up to 32 plain characters, like `immunitylabel sleep Slp`. Put text with spaces in quotes. |

### Look tab

| Command | What it does |
|---|---|
| `/checkmate skin <name>` | Switches the skin. The skins are phoenix, classic, minimal, contrast, ember and colorblind. The full names work too, in quotes when they have a space, like `"Classic FFXI"`. Naming the skin you already have puts back everything it sets, the same as Reset to skin. |
| `/checkmate skin undo` | Same as Undo. Takes back your last skin pick or Reset to skin. It only goes back one step. |
| `/checkmate font <name>` | Sets the settings window's font. The fonts are ashita (the default), segoeui, arial, tahoma, verdana, calibri and consolas. A name works with or without its spaces, like `segoe ui`. |
| `/checkmate fontsize <12-24>` | Sets the settings window's font size in pixels. 18 is the default, the size of Ashita's own font. |
| `/checkmate rounding <0-12>` | Sets how round the settings window's corners are, in pixels. 0 is square. Your skin sets it, and changing it makes the skin list say Custom. |
| `/checkmate spacing <2-14>` | Sets the space between the settings window's rows, in pixels. Your skin sets it too. |
| `/checkmate windowcolor <what> <rrggbb>` | Sets one settings window color. `<what>` is a window color from [Window colors](#window-colors), like `buttons_hovered`, and the color is six hex digits like `c55151`. Two more digits, from `00` to `ff`, set how solid it is, like `c55151cc`. |

### Profiles tab

| Command | What it does |
|---|---|
| `/checkmate profile save\|load\|delete <name>` | Saves your settings as a profile, over any profile with that name, or loads or deletes one. Put a name with spaces in quotes. |
| `/checkmate profile rename <old> <new>` | Renames a profile. This character's job links to it follow. Put names with spaces in quotes. |
| `/checkmate joblink <job> <profile>` | Loads that profile when you change to that main job and zone, like `joblink blm Nuker`. The jobs are WAR, MNK, WHM, BLM, RDM, THF, PLD, DRK, BST, BRD, RNG, SAM, NIN, DRG, SMN, BLU, COR and PUP. You can only link a profile that's saved. |
| `/checkmate joblink <job> none` | Stops a job loading a profile. |

`/cmate` is short for `/checkmate` and works for every command, like `/cmate th 2`. Each command that changes a setting says in chat what it did, and it takes the same values the window does, with the same limits. A command for a setting that's greyed out in the window still sets it, ready for when you turn on what it needs. A word checkmate doesn't recognize gets one line telling you to type `/checkmate help`.

## Options

Everything below is in the settings window (`/checkmate`). Drag its title bar to move it, and drag its edges or its bottom right corner to resize it. It opens where you left it, at the size you left it. If it would hang off the screen, or it was saved on a bigger screen, it's pulled back so all of it shows. Every tab but Numbers and Immunities has sections. They sit side by side once the window is 1028 pixels wide, and stack into one column when it's narrower. A font over 18 pixels needs a wider window for that, like 1348 pixels at 24. Hover the (?) after any setting to see what it does.

| Option | Where | What it does |
|---|---|---|
| Show the name | Printout | On by default. Turn it off to leave the name and level out while the other parts still print. |
| Label | Printout | The box next to Show the name. It's a word before the name, empty by default, and the label divider follows it. |
| Show level | Printout | On by default. Adds ` (Lv 42)` after the name, or ` (Lv 38-40)` when only the range is known. |
| Show its level range too | Printout | Off by default. Once the exact level is known, it adds the levels that monster spawns at from its data, like ` (Lv 42, range 40-44)`. An Assault monster only shows the levels under your level cap. A monster that only spawns at one level, is at a level outside its range or has no data shows its level alone. It needs Show level on. |
| Range word | Printout | The word before that range, `range` by default, up to 32 plain characters. Clear it to get ` (Lv 42, 40-44)`. |
| Parts | Printout | A row each for Difficulty, Hit rate, Evade, Crit, Aggro, Magic, Immunities, Elements and Drops, with its on box, its label, New line and arrows to move it up or down. Type any word you like as a label, like `Acc` instead of `Hit`, or clear it to print no label. New line starts a new chat line before that part. Difficulty and Aggro are on by default, and Difficulty's label starts empty. Aggro, Magic, Immunities, Elements and Drops start their own line by default. |
| Evasion and defense | Printout | The row under Difficulty, on by default. It prints the reading in parentheses after the difficulty, like `Very Tough (High Evasion, Low Defense)`, with a space before it instead of a divider. With Difficulty off it follows the name. It moves with Difficulty, so it has no label, New line or arrows. |
| Defense first | Printout | Off by default, so evasion comes first like the game and checker. With it on you get `(High Defense, High Evasion)`. |
| Put the extras on their own line | Printout | On by default. Hit, evade, crit, aggro, magic, immunities, elements and drops start on a new line below the name, difficulty and evasion and defense, and the two kinds never share a line, even if you reorder the parts. With it off they carry on along the same line. Each part's New line works either way. |
| [checkmate] at the start of each line | Printout | On by default. |
| Divider | Printout | What goes between parts. The choices are Star (the default), White star, Diamond, White diamond, Circle, Middle dot, Music note, Arrow, Pipe, Slash, Dash, Two spaces and Custom. The list shows names because the settings window can't draw the symbols. Every choice but Two spaces and Custom has a space on either side. Custom shows a box for your own text, up to 8 plain characters. Skins leave the divider alone. |
| Label divider | Printout | What goes right after each part's label, in the label's color. The choices are Colon (the default), Star through Dash from the Divider list, then Space only and Custom. Custom shows a box for your own text, up to 8 plain characters, and a space follows it, so `:` prints `Aggro: Aggressive` and ` >` prints `Aggro > Aggressive`. The TH note stays with the label, like `Drops (TH 2): Goblin Mail`. A part with no label has no label divider. Skins leave it alone. |
| Number ranges | Printout | Prints a range as `64-72%` (the default) or as its middle, `~68%`. It's used for hit rate, evade, crit and magic. |
| Replace the game's /check line | Printout | On by default. Hides the game's own line for your /check, and checkmate's lines take its place. If your parts would print nothing, the name, level, difficulty and evasion and defense still print. With it off, the game's line shows (unless checker is loaded) and checkmate's lines follow it. Skins leave it alone. |
| Print a sample | Printout, Colors | Prints a made-up /check in chat with your settings, in the real chat colors. |
| Chat colors | Colors | Every chat color, under a heading for each part. See [Colors](#colors). |
| Color by difficulty | Colors | On by default. Paints each difficulty in its own color. In the Phoenix skin that's grey for Too Weak up to red for Very Tough and Incredibly Tough, and magenta for Impossible to Gauge. With it off, every con uses One color. The Minimal skin turns it off. |
| Color by threat | Colors | On by default. Paints the aggressive answers in the Threat color, red in the Phoenix skin, and Too weak, Not aggressive and Never aggressive in the Safe color, green. With it off, every answer uses the Words color. The Minimal skin paints them all in its one color. |
| Color the hit rate, evade and crit numbers | Colors | On by default. Uses the Good, OK and Bad colors, going by the cutoffs on the Numbers tab. With it off, each number uses its part's Number color. |
| Cutoffs | Numbers | The good and OK cutoffs for each number. Hit is good at 85% and OK at 70%, evade at 30% and 15%, and crit at 15% and 8%. Anything under OK is bad, and a range goes by its middle. |
| Show how it finds you | Aggro | On by default. Adds how an aggressive monster notices you after the answer, like `(Sight, Sound)`. It only shows when the monster can aggro you. |
| Show the names it links with | Aggro | On by default. With it off, the aggro part just says `Links` or `Doesn't link`. |
| Most names shown | Aggro | 5 by default, up to 12, or All. The rest show as `+2 more`. A Dynamis monster can link with over 150 kinds, so All makes a very long line there. |
| Schools | Magic | A box for each school, all off by default, and the stand-in spell each one uses. |
| Extra magic accuracy | Magic | 0 to +100, added to every school. Use it for magic accuracy from gear, food and merits, which checkmate can't see. |
| Weak word and Resists word | Magic | The words before each list in the Elements part, `Weak` and `Resists` by default, up to 32 plain characters. The label divider follows each one. Clear one to leave it out. |
| Show how strong each one is | Magic | On by default. Adds how strong each weak or resisted element is, like `Water (half)`, and the `Magic damage -25%` note. Elements next to each other with the same strength share it, like `Wind, Earth (half)`. |
| Treasure Hunter | Drops | 0 to 4, 0 by default. |
| Most items shown | Drops | 5 by default, up to 12, or All. The rest show as `+2 more`. |
| Hide items under | Drops | Leaves out items under this chance, up to 50%. It's 0% by default. |
| Order | Drops | By chance (the default) or by name. |
| Treasure Hunter in the label | Drops | On by default. The label reads `Drops (TH 2)`. |
| Drop notes | Drops | On by default. Adds `(plus scripted drops)` and `(only drops if you get EXP)` when they apply. |
| Immunities | Immunities | Each of the 16 immunities on or off, all on by default, with your own label. |
| Skin | Look | Copies a skin's window colors, corners, spacing, chat colors and Color by difficulty in. The list says Custom once you change any of those. Picking the skin you already have does nothing. Colorblind safe never puts red against green, and its (?) says which colors it uses. |
| Reset to skin | Look | Puts back everything the skin you picked sets. Skins never change the font. |
| Undo | Look | Takes back your last skin pick or Reset to skin. It goes back one step, and it's cleared when your settings are reset, a profile loads or another character logs in. |
| Font | Look | Ashita (the default), Segoe UI, Arial, Tahoma, Verdana, Calibri or Consolas. The Windows ones all load from `C:\Windows\Fonts` once, when checkmate loads, so picking one just switches to it. If a font's file isn't there or won't load, the window uses Ashita's font and the Look tab says so. |
| Font size | Look | 12 to 24 pixels, 18 by default. The window's layout and smallest size grow and shrink with it. |
| Corner roundness and Spacing | Look | The window's corners, 0 to 12 pixels, and the space between rows, 2 to 14 pixels. |
| Window colors | Look | A picker for each of the 41 window colors, under a heading for each kind. See [Window colors](#window-colors). |
| Profiles | Profiles | Type a name in the box and use Save as new. Pick a profile in the list to Overwrite, Load, Rename or Delete it. Rename gives it the name in the box. |
| Job links | Profiles | A profile for each main job. It loads when you zone after changing to that job, so leaving your Mog House on a new job loads it. Logging in doesn't. |

Profiles are shared by all your characters in `config\addons\checkmate\profiles.json`. A profile holds every setting except the job links, where the window sits and its size. The job links belong to each character. A profile name can be up to 32 plain characters. Loading a profile saved by an older version fills in anything newer from the defaults.

## Colors

Every piece of checkmate's chat text has its own color on the Colors tab. Each one is an FFXI chat color, since the chat log can't show any other. The swatches in the window are close to how they look, and Print a sample shows the real ones. A skin sets all of them at once. `/checkmate color <what> <color>` sets one, with `<what>` from this table.

| Heading | Settings | What they paint |
|---|---|---|
| Tag and lines | `tag_brackets`, `tag_word`, `line`, `replies` | The brackets and the word in `[checkmate]`, the dividers between parts and the "can't be gauged" line, and checkmate's answers to your commands. |
| Name and level | `name`, `level`, `level_range` | The name with its label and label divider, the ` (Lv 42)`, and the `range 40-44` in ` (Lv 42, range 40-44)` when Show its level range too is on. |
| Difficulty | `difficulty`, `too_weak`, `incredibly_easy_prey`, `easy_prey`, `decent_challenge`, `even_match`, `tough`, `very_tough`, `incredibly_tough`, `impossible_to_gauge` | One color for the difficulty while Color by difficulty is off, then each con's own color. A label on Difficulty and its label divider always use the one color. |
| Evasion and defense | `reading`, `reading_detail` | The words, then the parentheses and the comma. |
| Hit rate, Evade and Crit | `hit_label`, `hit_number`, `hit_detail`, and the same for `evade_` and `crit_` | The label and its label divider, the number while grade colors are off, and the details. The details are `unknown`, the `?` and Evade's `with Signet`. |
| Aggro | `aggro_label`, `aggro_words`, `aggro_detail`, `aggro_threat`, `aggro_safe` | The label and its label divider, the answer while Color by threat is off, and `Links with`, `Links`, `Doesn't link` and the names. Then the details, which are how it notices you like `(Sight, Sound)`, the notes, the dividers, the commas and `+2 more`. Threat and Safe paint the answer while Color by threat is on. |
| Magic | `magic_label`, `magic_name`, `magic_number`, `magic_detail` | The label and its label divider, the school names, their chances, and the details. The details are the element like `(Ice)`, `never`, `immune`, the `?` and the dividers between schools. |
| Immunities | `immunities_label`, `immunities_name`, `immunities_detail` | The label and its label divider, the immunity names, and the commas. |
| Elements | `elements_label`, `elements_weak`, `elements_resist`, `elements_detail` | The label, the Weak and Resists words and their label dividers, the weak element names, the resisted element names, and the details. The details are how strong each one is like `(half)`, the commas, the divider between the lists, the `Magic damage` note and the `?`. |
| Drops | `drops_label`, `drops_name`, `drops_number`, `drops_detail` | The label and its label divider, the item names, their chances, and the details. The details are `(TH 2)`, the commas, `+2 more` and the notes. |
| Grades | `good`, `ok`, `bad` | The hit rate, evade and crit numbers by the cutoffs on the Numbers tab, while grade colors are on. |

The chat colors are Cream, White, Lawn green, Slate blue, Magenta, Cyan, Moccasin, Coral, Dim grey, Grey, Salmon, Yellow, Royal blue, Dark magenta, Violet, Tomato, Misty rose, Pale goldenrod, Lime, Pale green, Dark orchid, Aqua, Spring green, Dark salmon, Med. spring green, Medium purple, Azure, Light cyan, Light goldenrod, Light blue, Warning yellow and Plum. `/checkmate help colors` lists them with their numbers. A name works with or without its spaces.

## Window colors

Every color the settings window draws with has its own picker on the Look tab, under these headings. A skin fills them all in from its handful of colors, and Reset to skin puts them back. They save with your settings and in profiles. `/checkmate windowcolor <what> <rrggbb>` sets one, with `<what>` from this table.

| Heading | Settings |
|---|---|
| Text colors | `text`, `faded_text`, `headings`, `notes`, `done_messages`, `problem_messages`, `selected_text`, `text_cursor` |
| Window colors | `background`, `border`, `title_bar`, `title_bar_unfocused`, `dropdowns`, `table_headers`, `heading_lines`, `resize_corner`, `resize_corner_hovered`, `resize_corner_held` |
| Scrollbar colors | `scrollbar_track`, `scrollbar`, `scrollbar_hovered`, `scrollbar_held` |
| Box and slider colors | `boxes`, `boxes_hovered`, `boxes_clicked`, `check_marks`, `slider_handles`, `slider_handles_held` |
| Button colors | `buttons`, `buttons_hovered`, `buttons_pressed` |
| List row colors | `row_picked`, `row_hovered`, `row_clicked` |
| Tab colors | `tabs`, `tabs_hovered`, `open_tab`, `open_tab_line`, `tabs_unfocused`, `open_tab_unfocused`, `open_tab_line_unfocused` |

A hovered color shows while the mouse is over it, and a clicked, held or pressed one while the mouse button is down on it. An unfocused one shows while you're using another window. Faded text is the subtitle, the (?) marks and "No profiles yet". Open dropdowns also paints the tips. Notes are the short lines a tab shows when something there is off, like a part. Done messages are what the Profiles tab says after an action works. Problem messages are what it says when one doesn't work, and the Look tab's line about a font that won't load.

## How the level works

/check tells checkmate the level of most monsters. A few monsters have a script that changes the level /check shows, and checkmate takes that back off to get the real one.

Notorious monsters and a few others answer /check with "impossible to gauge". Then checkmate uses the level your widescan saw for that monster in this zone. Without that, it uses the levels that monster spawns at from its data, like `Lv 38-40`, and works out every number over that range. Monsters of one kind can spawn at different levels in different spots, like the Goblin Tinkerers in Valkurm Dunes at 17-18, 18-19 or 19-20, and the data keeps each spot's own range. With neither, it shows `Lv ?`. When hit, evade, crit or magic is on, a monster with no data and no level gets a line saying it can't be gauged and to widescan it first. With the game's /check line replaced, its name and Impossible to Gauge print on the line above.

Most Assault monsters are lowered by the level cap your party picks, and /check shows the lowered level, so their numbers follow the cap. For the ones that can't be gauged, the range covers every cap, like `Lv 50-75`, until you widescan them. Once the level is known, Show its level range too shows only the levels under that cap, like `Leujaoam Worm (Lv 51, range 51-53)` under the level 50 cap.

## How difficulty and evasion and defense work

Both come from the server's reply to your /check, the same reply the game's own /check line comes from. checkmate hides that line and prints these in its place, unless you turn off Replace the game's /check line.

Difficulty is the con. Phoenix works it out from the base EXP the monster is worth at your level, with the table from before Wings of the Goddess. It's Incredibly Tough at 400 or more, Very Tough at 200, Tough at 120, Even Match at 100, Decent Challenge at 50, Easy Prey at 15, and Too Weak under that. Phoenix never checks a monster as Incredibly Easy Prey. Notorious monsters, battlefield monsters and a few others are Impossible to Gauge.

Evasion and defense compare the monster with you.

- **High Evasion** means its evasion is more than 30 over your main hand accuracy, and **Low Evasion** means your accuracy is 10 or more over its evasion.
- **High Defense** means its defense is over your main hand attack, and **Low Defense** means your attack is at least 1.25 times its defense.

Anything in between is normal and says nothing, so the parentheses are left out when both are normal. A monster that's impossible to gauge gives no reading. Evasion comes first like the game's own line, unless Defense first is on.

## How hit, evade and crit work

The server's hit rate is 75% plus half the difference between the attacker's accuracy and the defender's evasion, kept between 20% and 95%. Each level the monster has over you costs you 4 accuracy and gives it 4 accuracy on you. Phoenix does this in every zone.

- **Hit** is your main hand accuracy against the monster's evasion. For a monster checkmate has data for, its evasion is the server's own number at that level, so you get one exact number, or the lowest to the highest over a range of levels. A monster with no data gets a range from the typical evasion at its level, taken from the middle 80 percent of regular monsters at that level on Phoenix. The high, normal or low evasion your /check shows then narrows that range. Bonuses that depend on where you stand, like Innin from behind, aren't counted.
- **Evade** is how often the monster's swings miss you. It's the monster's accuracy against your evasion, so it runs from 5% to 80%. Under Signet, a monster that isn't notorious and checks as an even match or lower swings at you as if you had 25% more evasion, and Evade says "with Signet". The server only gives you that against the monster you're fighting. Signet does nothing in the Aht Urhgan areas or on the ferries.
- **Crit** starts at 5%. Your DEX over the monster's AGI adds 1% at 7 over, 2% at 14, 3% at 20 and 4% at 30. From 40 over it adds the difference less 35, up to 15% at 50 over. Your DEX counts your gear and buffs. Merits and gear with critical hit rate add on top of the number shown, since checkmate can't see them.

Some monsters have a script that changes their numbers, resistances or immunities during a fight, and the data can't follow that. Their hit, evade, crit and magic numbers get a `?` after them, and so does the end of their Elements part.

### Why hit and evade print a moment later

Hit rate and evade need your current accuracy and evasion, and only the game's `/checkparam` shows those. So with either one on, checkmate sends `/checkparam <me>` a second and a half after your /check comes back, and hides the reply. The game ignores a /checkparam sent right after a /check, but it takes one sent a second later. The extra half second lets advcheck's /checkparam go first when it's loaded, so checkmate can use advcheck's reply and send nothing. The reply takes a moment more to come back, so hit and evade print about two seconds after your /check.

Your /check line prints right away, unless hit or evade shares it. The first line holding hit or evade waits for the reply, and so does every line under it. Crit doesn't need the reply, but it waits when it's on one of those lines. If no reply comes within 3 seconds of checkmate sending its /checkparam, those lines print with hit and evade as unknown. With hit and evade both off, which is the default, nothing waits.

To get everything else right away, move Hit rate, Evade and Crit below the other parts on the Printout tab and tick New line on the top one of them, which is Hit rate unless you have it off. With commands, that's `/checkmate move hit down` until it's last, the same for evade and then crit, and `/checkmate newline hit on`. Then only the last line comes a moment later. [What checkmate reads, sends and hides](#what-checkmate-reads-sends-and-hides) covers what happens when you /check again or zone while it waits.

## How aggro and links work

An aggressive monster only aggroes you when it checks as more than Too Weak to you. The server works that out from your own main level, not your party's, and your /check con comes from the very same test. So when your /check says Too Weak, the monster won't aggro you, and anything tougher will if it notices you. Level sync and a battlefield's level cap lower your main level, and the server goes by the lowered one. A few monsters, mostly notorious ones, aggro you at any level.

Resting or sitting lets any aggressive monster that notices you aggro you, even one that's too weak. That's what "unless you rest" means.

Notorious monsters, battlefield monsters and Dynamis monsters answer /check with Impossible to Gauge, but the server still puts them through the same test. checkmate takes the level your widescan saw, or else the range of levels in its data, and compares it with the server's own Too Weak level for your main level. When the range crosses that level, it says which level starts to aggro you, like `Aggressive if it's level 30 or higher`. With no level to go by, it says `Aggressive (level unknown)`.

How an aggressive monster notices you shows in parentheses.

- **Sight** means it sees you when you're in front of it. Invisible stops it.
- **Sound** means it hears you when you're close. Sneak stops it.
- **Magic** means it notices you casting a spell that costs MP near it.
- **Low HP** means it notices you when your HP is under 75% near it.
- **Ability** means it notices you using a job ability or weapon skill near it.
- **True Sight** and **True Sound** mean Invisible and Sneak don't stop it.
- **Ambush** means it aggroes you within 3 yalms unless you have Sneak on.

Nothing stops Magic, Low HP or Ability. Scent never starts a fight. It only keeps a monster on you once it's fighting you, so checkmate leaves it out.

Some monsters' aggro changes while they're up, and the data can't hold that. checkmate adds a short note for the ones it knows.

- `(awake 6:00-20:59)` means it sleeps outside those Vana'diel hours, and while it sleeps it doesn't aggro or link. `(always asleep)` means it never wakes unless someone pulls it.
- `Sight 18:00-5:59` in the parentheses is an imp that also sees you at night.
- `(not in its ball form)` is a ghrah, which only aggroes after it changes form.
- `(changes with the zone's apkallu hate)` is an apkallu, whose aggro follows a hate level its whole zone shares.
- `(only if you have fomor hate)` is a fomor in Lufaise Meadows, Misareaux Coast, Phomiuna Aqueducts or the Sacrarium. It only aggroes players who have killed enough fomors.
- `(only above ground)` is a worm, which can't aggro you while it's underground.
- `(can change in the fight)` means a script changes its aggro while it's up.

Links are the same at every level. When you pull a monster, the idle monsters of its link group that are near it join in, and each one that joins calls its own group near it, so one pull can bring in more. The groups form when the zone starts up. They're monsters of one family that link, monsters that share a link group across families (like goblins with bugbears, or Mouse Bats with Ding Bats), every monster in a Dynamis zone, and the monsters of one battlefield fight. `Links with` lists every kind of monster that can end up in the fight that way, however far away it is now. A helper still has to be near a monster in the fight and able to see it. When the list has the monster's own name, others of its kind help it. Your level, Sneak and Invisible make no difference to links.

checkmate can't know a monster's distance, which way it faces, or whether it's asleep or already fighting, so the list is who can link, not who's close enough to link right now.

## How magic works

The server works out every spell's chance against a monster the same way, and no Phoenix module changes it.

- Take your magic accuracy less the monster's magic evasion, and add 25. If that's below 0, halve it.
- Take off 4 for each level the monster has over you.
- The chance is 50% plus that, kept between 5% and 95%.

Your magic accuracy is your skill in the school, a bonus from your INT, MND or CHR against the monster's (whichever the spell uses, up to 30 either way), the spell's own bonus, and these when they apply.

- An elemental staff adds 20 for its element, or 30 for the high quality one. It takes the same off spells of the element it's strong against, like ice for a fire staff.
- Elemental Seal adds 256 for anything but dark and divine magic.
- Dark Seal adds 256 for dark magic.
- A wind instrument adds half your wind instrument skill to songs.
- The Extra magic accuracy setting adds what you set.

Soul Voice doubles it for Lullaby. Magic accuracy from gear, food and merits isn't counted, since checkmate can't see it, so add what you know with Extra magic accuracy. Troubadour isn't counted either.

The monster's magic evasion is the rank C skill cap at its level, plus any extra it has, times a multiplier for its resistance rank to that element or effect. A monster has a resistance rank from -3 to 11 for each element and some effects. The higher the rank, the harder those spells land.

Nukes and other damage spells show the chance of full damage. Enfeebles and songs show the chance they land at all, since the server gives a resisted effect more rolls. A monster's resist trait, like Resist Sleep, can stop one first. A school shows "immune" when the monster is immune to the effect, and "never" when its resistance is so high the spell never lands. Phoenix has no immunobreak, so a resistance never drops during a fight.

Each school uses one stand-in spell. The first one listed is the default, and you can change it on the Magic tab.

| School | Stand-in spells |
|---|---|
| Elemental | Tier I nuke, Tier II nuke, Tier III nuke, Tier IV nuke, each on the element the monster resists least |
| Enfeebling | Slow, Paralyze, Silence, Sleep, Bind, Gravity, Blind, Poison |
| Dark | Bio, Drain, Stun |
| Divine | Banish, Flash, Holy |
| Healing | Cure, which only shows on the undead |
| Ninjutsu | Elemental Ichi on the element the monster resists least, Kurayami: Ichi, Hojo: Ichi, Jubaku: Ichi, Dokumori: Ichi |
| Singing | Foe Lullaby, Battlefield Elegy, Foe Requiem |
| Blue | A magical spell on the element the monster resists least |

checkmate picks the element with the monster's lowest resistance rank, out of the ones that spell can be. When some tie, it takes the one with the best chance, and then the first of fire, ice, wind, earth, thunder, water and dark. An element the monster absorbs or nullifies is only picked when every one of them is like that. No nuke or elemental ninjutsu is light or dark, and no blue spell here is wind or light, so the element Magic names can be a different one from the Weak list in the Elements part.

Magic only shows for a monster checkmate has data for.

## How drops and Treasure Hunter work

Each drop has a rate in the server's loot tables. The server snaps that rate down to one of seven tiers and reads the real chance from its Treasure Hunter table.

| Rate in the loot table | TH 0 | TH 1 | TH 2 | TH 3 | TH 4 |
|---|---|---|---|---|---|
| 24% and up | 24% | 48% | 56% | 60% | 64% |
| 15% to 23.9% | 15% | 30% | 40% | 42.5% | 45% |
| 10% to 14.9% | 10% | 12% | 15% | 16.5% | 18% |
| 5% to 9.9% | 5% | 6% | 7% | 7.5% | 8% |
| 1% to 4.9% | 1% | 1.5% | 2% | 2.25% | 2.5% |
| 0.5% to 0.9% | 0.5% | 0.75% | 1% | 1.2% | 1.4% |
| Under 0.5% | 0.1% | 0.2% | 0.3% | 0.35% | 0.4% |

An item that always drops ignores Treasure Hunter. A group drop rolls once through the same table, then gives one of its items by weight. An item that more than one roll can give shows its chance from all of them together. Chances of 10% and up print as whole numbers, and smaller ones keep one decimal.

Phoenix allows Treasure Hunter 0 to 4. checkmate uses the number you set with the Treasure Hunter slider or `/checkmate th`. To see yours, hit a monster, keep it targeted and type `!th`. That's Phoenix's own command, and it shows the Treasure Hunter level on the monster.

`(plus scripted drops)` means a script adds to or changes the monster's loot, so there's more than the list shows. `(only drops if you get EXP)` was for the extra monsters Phoenix's launch module added to the starter zones, which only dropped anything when whoever got credit for the kill earned EXP. Phoenix has since retired that module, so no monster in the current data gets that note. Assault monsters have no loot table, so Drops is left out for them.

## How immunities work

The Immunities part lists the monster's flat immunities. Those are effects the server stops outright, no matter your magic accuracy. They come from the monster's data on the server and from the immunities its script gives it when it spawns. A monster whose script changes them during a fight shows the ones it starts with.

They print in this order: Sleep, Lullaby, Bind, Gravity, Silence, Stun, Paralyze, Slow, Elegy, Blind, Poison, Requiem, Petrify, Terror, Plague and Curse. Sleep is the dark sleep of spells like Sleep, Sleepga and Soporific, and Lullaby is the light sleep of Foe Lullaby, Horde Lullaby, Sheep Song and Yawn. A monster with none leaves the part out.

A monster can also resist an effect so strongly that it never lands without being immune to it. The Magic part shows that as "never".

## How elements work

The Elements part goes through the eight elements one at a time and puts each one in the Weak list, the Resists list or neither. It goes by what the server does when your spell hits, in the same order, and the first one that fits wins.

- **Nullifies** and **absorbs** come first. A few monsters take no damage from an element's damage spells, like the Evil Armory in Apollyon, and some heal from them, like a Cloister elemental from its own element. The server checks these before anything else.
- **Never lands** is resistance rank 11. An effect that goes by that element's rank never lands at all, and a nuke does an eighth of its damage.
- **Half** is resistance rank 4 and up. The server cuts that element's nuke damage in half, and its spells land less often. Rank 10 also lands only 5% of the time, so it says **rarely lands**.
- A few monsters take more or less damage from one element on top of that. It shows as how much more or less, like `+100%` or `-75%`. Anything within 5% either way is left out.
- **Weak** with nothing after it is the element with the monster's lowest resistance rank, when that rank is below 0. Its spells land a little more often than the others. Most monsters sit at -2 in most elements, so only the lowest rank counts, and a monster with every element at the same rank has no weakness.
- **Lands less** is extra magic evasion for one element and nothing else, which only a few monsters have.

`Magic damage -25%` means the monster takes that much less damage from every element, like a corse, and `+100%` means that much more. It's the same for all eight, so it's a note of its own.

Some monsters change these during a fight, like Vulpangue absorbing the day's element or an uragnite pulling into its shell. Those get a `?` at the end of the part. Day and weather, elemental staves, magic bursts and your magic attack bonus aren't part of the monster, so they're left out.

## What checkmate reads, sends and hides

By default checkmate hides the game's own line for your /check and prints its own lines in its place. It only does that for a /check you do yourself, never anyone else's. If you turn off Replace the game's /check line on the Printout tab, or type `/checkmate replace off`, checkmate leaves the game's line alone. checker, which the Phoenix launcher loads by default, also replaces that line, so with both loaded you see both addons' lines. While checker is loaded it hides the game's line whatever this setting is. If checkmate stops after an error, it leaves the game's line alone until you start it again.

With hit rate or evade turned on, checkmate sends `/checkparam <me>` a second and a half after your /check comes back, the same as if you typed it. It hides the six reply lines to that one request. A `/checkparam` you type yourself still shows in chat. If a reply about you comes in before checkmate sends its own, checkmate uses that reply, leaves it in chat and sends nothing. advcheck sends its own `/checkparam <me>` about a second after your /check and hides its own reply, so with both loaded checkmate usually uses advcheck's reply and sends nothing. If advcheck's reply takes more than half a second to come back, checkmate sends its own too. Both addons then hide the first reply, and the second one can show in chat.

If you /check again while it waits, only the newest /check gets its hit and evade. The older one prints the rest of its lines right away, all but the ones holding hit or evade, so its aggro, magic, immunities, elements and drops still show. Zoning while it waits does the same. If the extras are on the /check line and the game's line is hidden, that older /check line still prints, with hit and evade unknown, so no /check goes unanswered. With hit rate and evade both off, checkmate prints right after your /check and sends nothing.

checkmate never sends or hides anything else.

Besides Ashita's normal per-character settings file, the only file checkmate writes is `config\addons\checkmate\profiles.json`, and only when you change a profile.

| Source | What it's used for |
|---|---|
| Packet 0x029 (battle messages) | Your /check replies, with the monster's level, its con and the evasion and defense reading. Your /checkparam replies, with your accuracy and evasion. |
| Packet 0x0F4 (widescan) | A monster's level when /check can't gauge it. |
| Packet 0x00A (zoning) | Your server id, dropping the zone's monster data and widescan levels when you change zones, and reading your job again. |
| Your level, DEX, INT, MND, CHR, magic skills, buffs and zone in memory | Crit rate, magic accuracy, Signet, Elemental Seal, Dark Seal, Soul Voice, and whether a monster that can't be gauged is too weak to aggro you. |
| Your main hand and ranged items | An elemental staff's magic accuracy, and a wind instrument for songs. |
| Your main job after zoning | Loading a job's linked profile. |
| The name of the monster you /check, and item names from the game's data | The printout. |
| The monster data that ships with checkmate | Everything about the monster. It loads one zone's file the first time you /check something there and drops it when you zone. |
| The Segoe UI, Arial, Tahoma, Verdana, Calibri and Consolas files in `C:\Windows\Fonts`, when checkmate loads | Drawing the settings window. Each one loads once and stays loaded until the game closes. |

## Rebuilding the monster data

The monster data in `data\zones\`, `data\bands.lua` and `data\too_weak.lua` is built from the Phoenix server's source by `tools\export_data.py`. It reads the zone data, the module overlays, the monster scripts, Phoenix's Dynamis and the Assault tables, and works out every monster's numbers the way the server does. `/checkmate info` shows which commit the data came from and the content settings it assumes. Version 1.0.0 ships data built from `phoenix/live`, the branch the Phoenix server runs, at commit f125de32dc.

This is how each new version's data gets built, from the project folder with Python 3.12 and git. A copy you rebuild yourself is a version Phoenix staff haven't reviewed, so to play with newer data, wait for the next release.

```
python -m pip install -r tools\requirements.txt
python tools\export_data.py
```

It reads `phoenix/live` from a git clone of Phoenix, by default one in a folder named `Phoenix` next to this project, and `--repo` points it at another. It stops with an error rather than guess at anything it can't read. See `tools\README.txt` for setting up the clone, the options and what goes into each row. The tools aren't part of the addon, so don't copy them into the game.

On GitHub, a job rebuilds the data from `phoenix/live` every week. When a monster changed, it opens a pull request with a new version and a report of what changed. `tools\README.txt` covers that too.

## Files

- `checkmate.lua` connects everything to Ashita's events and holds the commands.
- `core/` holds the reading and the math. `packets.lua` and `player.lua` read packets and memory, and `monsters.lua` loads the monster data and works out the level. `checkparam.lua` times the /checkparam, `physical.lua` works out hit, evade and crit, `aggro.lua` whether it aggroes you and what links with it, `magic.lua` the magic schools, `elements.lua` the elements it's weak to and resists, and `drops.lua` the drop chances. `printout.lua` builds the chat lines.
- `ui/` holds `settings_window.lua` for the settings window, `window_font.lua` for its font, `skins.lua` for the skins and the window colors, `profiles.lua` for the profiles and `defaults.lua` for the default settings.
- `data/` holds `spells.lua` for the stand-in spells, `bands.lua` for typical monster numbers by level, `too_weak.lua` for the highest level that checks Too Weak to each of yours, and `zones/` with one file of monster data per zone.
- `tools/` holds the exporter that builds the monster data and the scripts that get a new version ready, and `.github/workflows/` holds the GitHub jobs that run them. See `tools/README.txt`. They aren't part of the addon.
- `tests/` holds offline tests that run the addon's Lua against a mock of Ashita, plus a tool that draws the settings window with real ImGui. See `tests/README.txt`. They aren't part of the addon.
- `LICENSE` is the GNU General Public License v3.0. Every release zip carries a copy at `checkmate/LICENSE`.

## License

checkmate is released under the GNU General Public License v3.0. The full text is in [LICENSE](LICENSE). The monster data is built from the Phoenix server's code, which is GPL-3.0 too.
