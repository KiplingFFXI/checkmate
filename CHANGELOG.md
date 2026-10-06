# Changelog

## 1.0.1

Monster data rebuilt from phoenix/live 465ac4c076 (2026-10-05).

- Mimas in Upper Delkfutts Tower changed its levels.
- Porphyrion in Upper Delkfutts Tower changed its levels and resist traits.
- Goblin Leecher in Dangruf Wadi changed its drops.
- Witchetty Grub in Dangruf Wadi changed its drops.
- 9 more monsters changed too.

## 1.0.0

First release.

- Prints what you'd want to know about a monster after your own /check.
- The name and level always print first. When /check can't gauge a monster, the level comes from your widescan, or else from the levels that monster spawns at in the data. Turn off Show level to leave the level out.
- Show its level range too, off by default, adds the levels a monster spawns at after its known level, like `Goblin Tinkerer (Lv 19, range 18-19)`. Each spawn has its own range, and an Assault monster only shows the levels under your level cap. You can change the word `range` or leave it out, and the range has its own color.
- Difficulty and Evasion and defense are on by default, right after the name, like `Very Tough (High Evasion, Low Defense)`. Defense first puts defense before evasion, and Color by difficulty paints each con in its own color.
- checkmate replaces the game's own /check line by default, the way checker does. If your parts would print nothing, the name, level, difficulty and evasion and defense still print. `/checkmate replace off` gives the game's line back.
- Hit rate, evade and crit show an exact number when checkmate knows the monster and its level, and a range when it doesn't.
- Hit rate and evade come with an automatic `/checkparam <me>` a second and a half after your /check, and only its own six reply lines are hidden. Only the lines from the first one holding hit or evade wait for the reply, so with the default layout the /check line prints at once and hit and evade follow about two seconds later. A second /check or zoning during the wait still prints the older /check's other lines.
- Aggro is on by default. It says whether the monster will aggro you at your level, from your /check the way the server works it out, or from its level and the server's Too Weak table when it can't be gauged. It adds how the monster notices you, like `(Sight, Sound)`, a note when its aggro changes, like `(awake 6:00-20:59)`, and what it links with, like `Links with Goblin Thug, Goblin Weaver`. Color by threat paints the answer in a threat color or a safe color, red or green in the Phoenix skin.
- Magic chances for eight schools, each with a stand-in spell you can change.
- Immunities, each one on or off with your own label.
- Elements, off by default, lists the elements a monster is weak to and the ones it resists, like `Elements: Weak: Ice, Thunder * Resists: Water (half)`. It goes in the order the server checks a damage spell. Show how strong each one is adds `(half)`, `(never lands)`, `(rarely lands)`, `(absorbs)` and the like, and a `Magic damage -25%` note when every element does more or less damage. You can change the words `Weak` and `Resists`.
- Drop chances at Treasure Hunter 0 to 4.
- Your own label, line breaks and order for every part, and grade colors with your own cutoffs.
- A chat color for every piece of the printout on the Colors tab.
- A divider between parts, a black star by default, and a label divider after each label, a colon by default. You can pick other symbols or type your own text for either one.
- Six skins that set the settings window's look and every chat color, Colorblind safe among them. Undo takes back your last skin pick.
- A picker on the Look tab for each of the 41 colors the settings window draws with.
- A font for the settings window, Ashita's own or one of six Windows fonts, at 12 to 24 pixels. The Windows fonts load once, when checkmate loads. One that's missing or won't load leaves the window in Ashita's font.
- Profiles shared by all your characters, with job links.
- A settings window you can move and resize. It opens where you left it at the size you left it, and its sections sit in two columns once it's wide enough. Every setting has a (?) that explains it.
- Every setting in the settings window has a command too, with the same limits as the window. That takes in each part's label, New line and place in the order, the cutoffs, the stand-in spells, extra magic accuracy, the drop list settings, each immunity and its label, the window's corners and spacing, renaming a profile and the job links.
- `/checkmate help` lists the topics and the commands you'll use most, and `/checkmate help <topic>` lists the commands for one tab of the settings window. `/cmate` is short for `/checkmate`. A word checkmate doesn't recognize gets one line pointing to `/checkmate help`.
- `/checkmate sample` prints a made-up /check with your settings, and `/checkmate info` says what the monster data was built from.
- Monster data built from Phoenix's source on `phoenix/live`, the branch the server runs, for the open world, battlefields, Limbus, Phoenix's own Dynamis, all five Assault areas, The Ashu Talif fights and the Nyzul Isle mission fights, with each monster's aggro and links.
