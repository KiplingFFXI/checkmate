# checkmate guide

[Back to the overview](../README.md) | [Latest release](https://github.com/KiplingFFXI/checkmate/releases/latest) | [Release changes](../CHANGELOG.md)

- [Install or update](#install-or-update)
- [Set up your display](#set-up-your-display)
- [Use presets, previews and undo](#use-presets-previews-and-undo)
- [Choose what to show](#choose-what-to-show)
- [Understand estimates and refresh readings](#understand-estimates-and-refresh-readings)
- [Filter Dangers and read move details](#filter-dangers-and-read-move-details)
- [Find and track Blue Magic lessons](#find-and-track-blue-magic-lessons)
- [Read Effects and pet estimates](#read-effects-and-pet-estimates)
- [Use commands](#use-commands)
- [What checkmate reads, sends and saves](#what-checkmate-reads-sends-and-saves)
- [Source and license](#source-and-license)

checkmate is an Ashita v4 addon for Phoenix. It adds monster details and combat estimates to your `/check`, with an optional target overlay. Choose what shows, put each part where you want it, and change its words, colors and abbreviations.

Phoenix staff approved checkmate for use on Phoenix.

## Install or update

1. Download `checkmate-<version>.zip` from the [latest release](https://github.com/KiplingFFXI/checkmate/releases/latest).
2. Extract it into your Phoenix `addons` folder. The result should be `addons\checkmate\checkmate.lua`.
3. Type `/addon load checkmate` in game.
4. To load it automatically, enable checkmate under **Manually installed** in the Phoenix launcher's Addons page. Or add `/addon load checkmate` to `scripts\default.txt`, outside the launcher's managed block. Use one method.

For an update, replace the old `addons\checkmate` folder with the new one, then type `/addon reload checkmate` if the addon is already loaded. Otherwise use `/addon load checkmate`. Settings and profiles are kept separately in `config\addons\checkmate\`; leave that folder in place.

## Set up your display

Type `/checkmate` to open settings. **Find settings** searches controls and their help. **Previous match** and **Next match** step through results on the current tab. The tabs and search stay at the top while the page scrolls. Resize the panel to fit your screen; controls wrap as the width changes.

- **Display** puts chat and overlay rows in one table, with shared labels, order and line breaks. Use **Enabled only** to shorten the list. At smaller widths, use **+** beside a row for its layout controls. **Options** opens its settings.
- **Numbers** groups combat settings under Offense, Defense and Advanced. Grade cutoffs and merit inputs are under Advanced.
- **Appearance** holds skins, colors, fonts and tab visibility. Hiding a tab does not turn off its features, and Appearance always stays available.
- **Abbreviations** lets you shorten the addon's words separately in chat and the overlay.
- **Profiles** offers starter presets and saves a setup for reuse across characters or a main job. Profile changes leave your window position and hidden tabs alone.

Hover a control's help marker for its explanation. In the overlay, hover text or icons for a short result, inputs and conditions. **Target details**, available at the top of every tab, keeps supported combat and monster notes and full Links and Dangers lists, including your last manual `/check` when the overlay is off. Its search, filters and folded sections do not remove anything from **Copy details**.

Choose **Mint** for dark green panels and mint highlights, or **Lavender** for dark plum panels and soft purple highlights. Both are under **Appearance > Window style > Skin**. You can also use `/checkmate skin mint` or `/checkmate skin lavender`.

## Use presets, previews and undo

Open **Profiles** and choose a preset. The list explains its changes before you apply it. **Preview preset** shows it with sample data; **Apply preset** makes it your current layout.

| Preset | Focus |
|---|---|
| Minimal | Difficulty, aggro and links. |
| Melee | Hit rate, pDIF, crits, weaknesses and effects. |
| Mage | Elemental and Enfeebling estimates, weaknesses and effects. |
| Ranged | Ranged hit rate and pDIF, weaknesses and distance. |
| Tank | Evade, shield block, parry, incoming crits and dangers. |
| Blue Mage | Unlearned spells, learning requirements and monster information. |
| Pet Job | Pet estimates, weaknesses, Charm eligibility and aggro. |
| Thief | Rewards, drops and Steal, with their conditions. |

Presets enable the overlay, change the selected rows and their order, and limit long lists to three entries. Full Links and Dangers lists remain in Target details. To see more drops, raise Most items shown under Drops. Presets keep your colors, fonts, labels, abbreviations, window positions, hidden tabs, merits, Treasure Hunter and manual accuracy inputs. A preset does not add an estimate that the selected monster or your current inputs cannot support.

### Preview and undo

**Preview** at the top of settings shows either Chat or Overlay, using Sample or Current target data. It reads the result already available and sends no requests. The preview uses text for game symbols; **Print a sample** shows the real chat output.

**Undo last change** restores recent settings changes during this session, including loading a profile or applying a preset. **Reset this section** resets the current tab while keeping manual combat inputs, custom labels and window positions. Appearance resets styling, Abbreviations resets custom words, and Profiles clears job links without deleting saved profiles. **Undo overwrite** restores the previous saved version of a profile if it has not changed again. The heading tells you when your settings are modified from a preset or saved profile.

## Choose what to show

| Part | What it tells you |
|---|---|
| Name and level | The monster's name, exact observed level or source level range, difficulty, and optional ID or NM placeholder note. |
| Combat numbers | Your hit rate, evade rate, crit rate, crit taken, off-hand and ranged estimates. Magic uses a selected spell for each school. |
| pDIF | Your normal attack multiplier range, Attack/Defense ratio, or both. Main-hand, off-hand and ranged each have their own row. |
| Shield block and Parry | Separate chances for eligible normal attacks, using your jobs, current skills and equipped gear. |
| Aggro and Links | Detection methods, source conditions and monsters that can link. Full link lists remain in Target details. |
| Weaknesses | One row for elements, weapon damage types, immunities and Charm. Select its components separately for chat and overlay. |
| Effects | Buffs and debuffs seen in action messages, with estimated time left where a duration is supported. |
| Monster facts | Separate rows for Family, HP and MP, Movement, Pursuit, Spawn, Claim shield, Dangers, Blue Magic, Fight rules, Traits, Crystal and Rewards. |
| Drops and Steal | Source drop chances, Treasure Hunter options, possible Steal items and a conditional Steal chance where supported. |
| Pet | Your pet's level range, hit rate and evade rate when enough information is available. |

**Weaknesses** brings the related controls together. **Blue Magic** and **Pets** have their own tabs, **Pursuit** is on Aggro, and Effects stays on its own tab. Display controls which rows appear, their order and their line breaks. Name and level stays first; the evasion and defense reading follows difficulty.

**Links** groups matching names by family, such as **Goblin family (Sight)**. Two or more names can group when their family and linking conditions match. Other names stay separate. These labels cover the listed names, not every monster in that family or the monsters currently nearby. Hover for names or open **Target details** for the full list. Under **Aggro**, turn off **Group names by family** to keep each name separate, or use `/checkmate linkfamilies off`. **Most entries shown** applies after grouping.

The overlay and optional rows can be turned on as needed. It hides for the map, cutscenes and hidden game interface according to its settings. Hold Shift to move it or change its width when it is unlocked. Missing pictures leave readable text; weapon names and percentages stay visible even with Icons only.

## Understand estimates and refresh readings

The bundled data comes from Phoenix's source code at a particular revision. It describes that source, not hidden fight state or a live server lookup. Later server changes can make it stale. `/checkmate info` shows the addon version, source revision and content settings. It checks the shared data files and current zone for missing or mixed revisions and content settings. It cannot verify the running server's deployed revision.

- **Exact level, range or unknown:** a `/check` or widescan can supply a level. Otherwise a source range may be available. A monster's level is forgotten when its observed identity dies, leaves sight or the zone changes.
- **Ranges and `~`:** a range reflects missing or varying inputs. `~` can mark a midpoint or an estimate affected by a known uncertainty. Hover the number for its reason.
- **The `?` on Weaknesses:** those stored values can change during the fight. You can hide the Elements marker without removing its explanation from hover help.
- **Unknown:** the source or client does not establish the answer. It does not mean no, safe, immune or unavailable.
- **Source maximums:** HP and MP are estimated maximums for the level or range, not current remaining HP or MP.

### Combat inputs and stat replies

Hit rate, off-hand hit rate, ranged hit rate and Evade can appear in either display. Enable their Overlay switches under Display. They fill in after your manual `/check` receives its stat reply. If your gear, buffs or stats change, the overlay keeps the last calculated numbers with a **Check again** note. Their hover help keeps the original inputs and reply age. Another `/check` refreshes them. HP and TP changes add an estimate marker because conditional bonuses may have changed. The passive overlay never requests stats.

Checked numbers have no time limit. The monster dying or leaving sight clears its saved readings. Zoning, turning the overlay off or resetting settings clears all saved readings. With **Remember** off, changing targets clears them too.

Combat numbers use the inputs available when the result is built. A `/checkparam` reading is a snapshot; later gear, buffs, debuffs or fight changes can affect it. Magic hover help names the selected spell and explains whether its percentage means landing at all or doing full, unresisted damage.

Under **Magic**, **Include known gear and merits** controls the manual accuracy field. With it on, enter only bonuses checkmate has not already counted, such as food. With it off, enter your complete direct magic accuracy bonus from gear, food and merits. Skills and attributes are counted separately in either mode. Do not add bonuses already included automatically a second time.

### pDIF

Choose the pDIF rows and their display mode under **Numbers**. They start off. Ratio mode includes the Attack and Defense inputs: 558 Attack against 365 Defense gives a ratio of 1.53. Range mode shows the possible multiplier for ordinary, noncritical attacks. It is not average or final damage, and does not describe weapon skills. Hover help keeps both views and explains the curve cap.

pDIF uses your Attack from the stat reply and the monster's bundled Defense for its known level or range. After your inputs change, the overlay keeps that monster's last calculated estimate with a **Check again** note. It does not combine the old Attack with your new gear or stats. Scripted Defense changes and observed Defense effects keep their warnings; values that were never known stay unknown. Where the source cannot establish the server's level-correction setting, the range covers both possibilities and says so.

### Shield block and Parry

**Shield block** and **Parry** start off and have separate chat and overlay switches under Numbers. They read your current skills and gear without requesting stats. Shield block uses your equipped shield, Shield skill and the monster's combat skill rating. Parry uses your weapon, Parrying skill, supported bonuses and the monster's level. Gear bonus coverage follows Phoenix's level-75 cap. Hover help names the inputs and any missing conditions.

These are chances when the attack reaches an eligible block or parry roll. Both require you to face the attacker and be able to act; parrying also requires you to be engaged. Blocking reduces damage. Parrying avoids the hit. The percentages do not add to Evade or describe your total damage avoidance. Known reasons, such as **No shield equipped** or an unsupported job, appear on the row. Unreadable inputs still say **unknown**. Monsters without ordinary swings explain why the estimate is unavailable. Unresolved bonuses keep an estimate marker and explanation.

### Weaknesses, spawn rules and loot

Weapon percentages describe the target's damage-type multiplier, not your final damage. General melee and ranged damage changes, absorption and nullification have separate entries. Attack, defense, shields and other effects still matter. Magical, hybrid and formless attacks can follow different rules.

PH details show the supported lottery chance, conditions and cooldown after the NM despawns. They do not establish an open spawn window. Drops retain script and EXP conditions. Steal also depends on an item being available and your ability to receive it.

## Filter Dangers and read move details

Dangers lists supported debuffs, critical-hit moves and other notable threats from the monster's source moves. Normal attacks can appear when a supported harmful additional effect is present. Conditional critical hits keep their conditions; ordinary swing crit chance is shown by Crit taken.

Use category filters and the move limit to keep the chat and overlay short. Target details keeps the full enabled list. Move help can include source targeting, activation distance, effect radius, shadow behavior and supported removal options. A source distance is not a safe distance, and a listed removal option is not a guarantee.

`No listed threats` means none were found in the resolved source list for the known level or range. `Move list unresolved` or `list incomplete` means moves may be missing. None of these predicts the next action or makes a safety promise.

## Find and track Blue Magic lessons

The Blue Magic row combines possible lessons with an optional spell-chance estimate. Select lessons and chance separately for chat and overlay. Magic's gear, merit and accuracy options also apply to the Blue chance.

Possible lessons come from the monster's supported source move list. Your client's spellbook supplies **known**, **not learned** or **spellbook unknown**. Only unlearned hides confirmed known spells; unreadable entries stay visible. A resolved list with no lessons says so. Incomplete lists keep their known candidates and explain the gap.

**Show learning requirements** adds minimum Blue Magic skill and the inputs read with the result to hover help and Target details. These are a snapshot. The monster must use the move, the server checks the other conditions on defeat, and learning still has a chance to fail. A spell's casting level is not a minimum learning level.

**Show observed move use** can mark a completed move as seen. Misses and resists count; ready messages and interruptions do not. Not observed can mean the move happened before tracking began or out of view. Tracking starts off and does not establish learning eligibility.

**Spell finder** works without a selected monster. Choose a spell, then search its possible monsters and zones. It keeps exact source level ranges and known spawn or fight conditions. You can filter to unlearned spells or your current zone and copy the matching places. It does not find living monsters. An absent entry does not prove that a monster cannot teach the spell.

## Read Effects and pet estimates

Effects tracks what your client sees land or get removed. Its timers are estimates based on supported source durations and available inputs. Resists, unknown potency and early removals can change them. No observed effects means there are no matching observations, not that the monster has no effects.

Pet estimates depend on pet type, level and available parameters. A pet's overlay row reuses a valid reading for that pet and target. A manual `/check` can refresh its stats; the passive overlay never requests parameters. Changing pets or losing the observed target invalidates the old reading.

The Pet row supports jug pets, charmed monsters, wyverns and automatons. Avatars and spirits have no Pet readout. Charmed monsters use their monster data; the other supported types use `/checkparam <pet>`.

A pet already out when checkmate loads can have a wide level range because the addon did not see its summon inputs. A jug's later level rolls cannot exceed its original rolled level, and a stat reply does not reveal that original cap. Starting or ending Level Sync does not recover an unseen jug summon.

For a fresh summon estimate, keep checkmate loaded while you dismiss the pet and summon a new one, then manually `/check` a monster to refresh its stats. This lets checkmate observe the new summon inputs. The result can still be a range because of the random jug level roll or missing merit information.

## Use commands

Use commands for quick changes or to open a settings view. `/checkmate preset <name>` applies a starter preset, `/checkmate undo` restores the last settings change, and `/checkmate resetsection <tab>` resets one section. `/checkmate preview` and `/checkmate details` open those views. `/checkmate help <topic>` lists the commands for a tab, and the settings help gives their exact forms.

| Command | Purpose |
|---|---|
| `/checkmate` | Open or close settings. |
| `/checkmate help` | Show help topics and common commands. |
| `/checkmate sample` | Print an example using your settings. |
| `/checkmate pdifmode range\|ratio\|both` | Choose what the pDIF rows display. |
| `/checkmate info` | Show addon and bundled-source information. |
| `/checkmate show <part>` / `hide <part>` | Enable or disable a chat row. |
| `/checkmate overlayshow <part>` / `overlayhide <part>` | Enable or disable an overlay row. |
| `/checkmate overlay on\|off` | Show or hide the target overlay. |
| `/checkmate label <part> <text>` | Change a row label. Use `""` for no label. |
| `/checkmate newline <part> on\|off` | Set a row's chat line break. |
| `/checkmate move <part> up\|down` | Change row order. |
| `/checkmate abbreviations on\|off` | Use abbreviations in chat. |
| `/checkmate overlayabbreviations on\|off` | Use abbreviations in the overlay. |
| `/checkmate tab "Blue Magic" off` | Hide a settings tab without disabling its features. |
| `/checkmate tabs all` | Restore every settings tab. |
| `/checkmate replace off` | Keep the game's original `/check` line. |
| `/checkmate reset` | Reset this character's settings. Repeat within 10 seconds to confirm; saved profiles remain. |

Help topics are `display`, `numbers`, `aggro`, `magic`, `blue`, `weaknesses`, `pets`, `monster`, `drops`, `effects`, `abbreviations`, `appearance`, `profiles` and `presets`. The older `printout` and `overlay` topics still work.

## What checkmate reads, sends and saves

checkmate uses the monster data bundled with it, your local client state and packets the client already receives. Passive overlay updates, Effects, Blue tracking and the spell finder send no game commands or requests.

After a manual `/check`, enabled hit, off-hand, ranged, evade or pDIF calculations can request `/checkparam <me>`. Rows enabled only in the active overlay can use this request too. All player rows share one request; off-hand and ranged need the relevant weapon equipped. The Pet row in either display can request `/checkparam <pet>` for supported pet types. These requests wait between checks and only their own replies are hidden. A parameter command you type yourself remains visible. The passive overlay never sends a parameter request.

By default, checkmate replaces the game's original `/check` line with its own. Use Replace the game's /check line or `/checkmate replace off` to keep it. Other addons that replace the same line or request parameters can produce duplicate output.

Settings and profiles stay in Ashita's configuration folder. checkmate does not upload them. Shared profiles are replaced only after a new file has been written successfully; a failed save keeps the previous profiles.

## Source and license

Monster data and calculations are based on the [Phoenix server source](https://github.com/phoenixffxi/Phoenix). The original weapon-type icons come from [BG Wiki's Damage Type page](https://www.bg-wiki.com/ffxi/Damage_Type); their source notes and license limits are in [SOURCES.txt](../checkmate/assets/weapons/SOURCES.txt). Other item and status pictures come from your game client.

checkmate is licensed under [GNU GPL v3.0](../LICENSE). Every release includes the license. The GPL notice does not claim a license for the third-party weapon icons. See [CHANGELOG.md](../CHANGELOG.md) for release changes and [tools/README.txt](../tools/README.txt) for rebuilding the source data.

Author: Kipling.

[Back to the top](#checkmate-guide) | [Back to the overview](../README.md)
