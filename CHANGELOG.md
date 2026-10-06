# Changelog

## 1.1.0

Your pet on the same /check, how each monster that links joins the fight, and a monster's ID and whether it's a PH.

- A new Pet part, off by default, shows your pet on the same /check, like `Pet: Wyvern (Lv 75) * Hit: 88% * Evade: 31%`. Hit is how often your pet hits the monster, and Evade is how often the monster misses your pet. It works for a jug pet, a charmed monster, a wyvern and an automaton, as long as it's out when your /check comes back. It comes last and starts its own line by default.
- With the Pet part on, checkmate sends `/checkparam <pet>` for your jug pet, wyvern or automaton and hides the five reply lines to that one request. It goes a second and a half after your /check, or a second and a half after checkmate's own `/checkparam <me>` when hit rate or evade is on, since the game ignores one sent right after another. Only the Pet line waits for it. A charmed monster's numbers come from checkmate's data, so its line prints right away.
- The game picks a jug pet's level at random when you call it, and a wyvern or jug pet keeps its level when you level up, so its level can show as a range, like `Lv 73-75`. Monster Gloves count when you're 75 and have them on as your jug pet comes out, until a level sync or level cap picks its level again. Beast Affinity counts too, from the merit list the server sends when you zone. When the sync target levels up or down, a level sync moves your level but not your pet's, so checkmate doesn't move it either.
- The Pet part's options are in a new PET section on the Numbers tab: Show its name, Show its level, and the words before its two numbers. Each one has a command, listed by `/checkmate help numbers`. Its five chat colors are on the Colors tab, and every skin sets them. Its numbers use the Hit rate and Evade cutoffs and the grade colors, so "Color the hit rate, evade and crit numbers" on the Colors tab is now "Color the hit, evade, crit and pet numbers".
- checkmate now waits a second and a half after any /check or /checkparam that goes out, yours or another addon's, or after the reply to one it didn't send, before sending one, so the game doesn't ignore it.
- The data now has `data\pets.lua`, with each jug pet's highest level, the avatars' names, the gear that narrows a jug pet's level and the Beast Affinity merit, built from Phoenix's source with the rest.
- A chat color your settings file or a profile doesn't have yet, like the new Pet colors, now comes from your own skin, so a skin you picked stays picked after an update.
- The aggro part now says how each monster it links with joins the fight, after its name, like `Links with Abyssdiver (Sight), Helldiver (Sight), Zu (Sound)`. Sight means it has to be facing the fight, Sound means it joins from any side, and Superlink means it joins from anywhere in the zone. A monster that sees through Invisible or hears through Sneak says True Sight or True Sound, like after Aggressive. One that neither sees nor hears says what it notices instead, like `(Magic)`, and one that only notices scent gets nothing after its name. With the names off it says them all together, like `Links (Sight, Sound)`. Untick Show how each one links on the Aggro tab, or type `/checkmate linkhow off`, to leave them out.
- The monster data now keeps how each monster links, and it reads the fomor patrols and guards in Lufaise Meadows, Misareaux Coast, Phomiuna Aqueducts and the Sacrarium, which superlink. So the fomors there now link with the monsters the server gives them, like a Fomor Paladin at Bluefell Falls linking only with its guard. An antlion waiting underground, like the Pit Antlions in Attohwa Chasm and Tuchulcha's hunters, no longer shows as a link, since the server never lets one link while it's hidden. It's built from the same Phoenix commit as 1.0.1, so nothing else in it changed, apart from the placeholders below.
- Show its ID, off by default, adds the monster's ID after its level, like `Goblin Tinkerer (Lv 19) (ID 17199202)`. Tick it on the Printout tab or type `/checkmate id on`. You can change the word `ID` or leave it out, and the ID has its own color.
- Show if it's a PH, off by default, adds the NM a placeholder can pop, after its level and ID, like `Damselfly (Lv 21) (ID 17199434) (PH for Valkurm Emperor)`. Tick it on the Printout tab or type `/checkmate ph on`. You can change `PH for` or leave it out, and the note has its own color. It only says the monster is a PH, not when the NM can pop again, the chance it pops or whether it's up.
- The monster data now keeps which spawns are placeholders and the NMs each one can pop, from Phoenix's own scripts. A spawn only counts when its own despawn rolls for the NM and the NM's list holds that spawn, so list entries Phoenix never rolls, like the Dynamis ones, are left out.

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
