# Changelog

Older entries describe that release. Later entries may change its behavior.

## 1.14.4

Since 1.1.0, checkmate adds a target overlay, more combat and monster details, and more ways to set up your display.

- Added an optional target overlay with separate chat and overlay choices. Set each row's label, order and line breaks. Hover for inputs and conditions, or open Target details for full notes and lists.
- Added off-hand and ranged hit rates, incoming crits, pDIF, Shield block and Parry. pDIF can show the normal attack multiplier range, Attack/Defense ratio or both. Block and Parry show chances for eligible normal attacks. Combat estimates include supported gear, merits and buffs, with missing inputs kept unknown.
- Hit, evade and pDIF rows can use the stat reply from your manual `/check` in either display. After your inputs change, the overlay keeps the previous estimate and its original inputs with a Check again note. Passive updates never request stats.
- Weaknesses combines elements, weapon damage types, immunities and Charm. Effects shows buffs and debuffs your client observed, with estimated timers where supported. Source changes and uncertain values keep their explanations.
- Added separate monster rows for family, HP/MP estimates, movement, pursuit, spawn, claim rules, traits, crystals, rewards and fight rules. PH, drop and Steal details explain supported chances and conditions. Rewards includes gil and Mug where supported.
- Dangers lists supported debuffs, moves that can crit and harmful effects from normal attacks, with their conditions. Filters and display limits keep it short; Target details keeps the full list with known targeting, shadow and removal notes. Incomplete move lists say so.
- Blue Magic shows possible lessons and your client's learned state. Optional learning requirements and observed move use add context. The spell finder lists possible monsters, zones, levels and source conditions; it does not track live spawns or guarantee learning.
- Links can group names by family when their linking conditions match, with exact names kept in hover help and Target details. Pet estimates can appear in chat and the overlay, using valid readings for the same pet and target.
- Reworked settings with a combined Display table, search, wrapping tabs, tab visibility and separate Appearance and Abbreviations controls. Added eight starter presets, Chat and Overlay previews, Undo, section resets and safer profile changes. Mint and Lavender join the available skins.
- Reduced repeated work in combat refreshes and settings previews. Updated the guide, help text and source notes while keeping existing settings and command aliases.

## 1.14.3

- Links groups matching names by family when they have the same linking conditions. Names without a matching family and link conditions stay separate. Exact names remain in hover help and Target details.
- Added Group names by family under Aggro and `/checkmate linkfamilies on|off`. Most entries shown now applies after grouping.

## 1.14.2

- The overlay keeps the last calculated hit, evade and pDIF estimates after your inputs change. Older readings keep their original inputs and reply time, with a Check again note until you refresh them.
- Reordering the same buffs no longer clears a stat reading. Actual buff changes still mark the older estimate.

## 1.14.1

- Delayed chat readings now discard stale accuracy and evasion, just like the overlay. Changes to HP or TP keep the estimate with a note about conditional bonuses.
- Changing characters or resetting settings clears pending stat requests and old readings. Partial chat replies keep their actual receipt time.
- Missing gear or buff information leaves pDIF and stat-reply estimates unknown until those inputs can be read again.
- Reduced repeated overlay calculations after HP or TP has already marked a stat reading as an estimate.
- Fixed saved profile names containing `##` and corrected help text and guide details.
- `/checkmate info` now checks for missing or mixed source revisions and content settings in the shared data files and current zone.

## 1.14.0

- Added Hit rate, Off-hand hit rate, Ranged hit rate and Evade to the overlay. Enable them under Display; they fill in after your manual `/check` receives its stat reply.
- Changed gear, buffs, attributes or skills clear those readings. HP and TP changes mark them as estimates because conditional bonuses may have changed. Hover help shows the reply's age and when you need to check again.
- Overlay-only Pet rows can now use the stat request after a manual check. Chat and overlay switches still work separately.
- Melee, Ranged and Tank presets include their matching overlay rates when applied.

## 1.13.1

- Added Mint and Lavender skins, with mint green and soft purple highlights. Choose them in Appearance or use `/checkmate skin mint` or `/checkmate skin lavender`.

## 1.13.0

- Added Minimal, Melee, Mage, Ranged, Tank, Blue Mage, Pet Job and Thief starter presets. Each has a preview and explains its changes before you apply it.
- Combined Printout and Overlay into Display, with chat and overlay switches beside each row. Layout controls expand under the row in narrow windows. Existing commands and saved choices still work.
- Grouped Numbers into Offense, Defense and Advanced. Overlay styling now sits in Appearance.
- Added embedded Chat and Overlay previews, a Target details button on every tab, and Previous/Next search matches.
- Added Undo last change, Reset this section, a modified-profile indicator and guarded Undo overwrite for saved profiles.
- Shortened hover help while keeping full notes in Target details. Known unavailable reasons appear on the row; missing information stays unknown.

## 1.12.0

- Added optional Shield block and Parry rows for chat and the overlay, with their own labels, colors and layout controls.
- The chances use current skills, jobs and equipped gear with Phoenix's source rules. Hover help explains the inputs, eligibility and unresolved bonuses.
- Both rows update from local inputs without requesting parameters. Their percentages describe eligible normal attacks, with unavailable and unknown states kept separate.

## 1.11.0

- Added optional main-hand, off-hand and ranged pDIF rows for chat and the overlay. Choose the normal attack multiplier range, Attack/Defense ratio, or both under Numbers.
- Ratio includes the Attack and Defense inputs. Hover help keeps both views, the curve cap, snapshot age and any source limits.
- pDIF shares the existing stat request after a manual check. Changed player inputs discard the old Attack reading, and missing values stay unknown.

## 1.10.1

- Reduced repeated work in the overlay, Blue Magic finder and Target details.
- Labels, help and comments use the current tab names. The player guide and release notes are shorter and easier to follow.
- Release packages include only the addon, its assets and its license.

## 1.10.0

- Monster has a compact Category, Chat and Overlay table. Its target header shows the monster, reading type and input age, with a shortcut to Target details.
- Move and Blue Magic details use separate lines. Search has Clear and a match count. Copy shown follows your filters; Copy details keeps the full list.
- Dangers includes supported additional effects from normal attacks and more scripted spell lists, with their conditions.
- Blue Magic has a spell finder with monsters, zones, level ranges and source conditions. It can hide learned spells. It does not check live spawns or promise a learning roll.
- Shared danger records reduce the size and memory use of zone data.

## 1.9.0

- Dangers shows when a list is incomplete or unresolved. Spells follow known level restrictions, and forced casts keep their script conditions.
- Danger filters cover debuffs, critical hits, buff removal, drains and other threats. Chat and the overlay can limit the number shown; Target details keeps every move.
- Move details include known ranges, target shapes, shadow behavior and removal options. These can have conditions and are not safe-distance advice.
- Blue Magic can mark moves you saw the monster finish using. The marker does not establish learning eligibility.
- Target details keeps your latest manual /check when the overlay is off. Old replies cannot replace a newer check or restore a monster that disappeared.

## 1.8.0

- Dangers reads harmful effects and critical-hit behavior from move and spell scripts, shared helpers and loaded Phoenix overrides.
- Moves that need Mighty Strikes or another buff to crit keep that condition and only appear when the monster has a known way to gain it.
- Long danger tooltips point to Target details for the full notes.

## 1.7.0

- Weaknesses includes general melee and ranged damage changes, absorption and nullification.
- Monsters that disappear lose their old observed levels and pet stat replies.
- Search and tabs stay visible while settings scroll. Appearance and Abbreviations have collapsible sections.
- Blue Magic can hide learned spells and show required skill, along with the job, skill, HP and distance read with the result.

## 1.6.1

- Settings can be made narrower or wider. Tabs wrap and controls use the available space.
- Appearance can hide settings tabs or restore them all. Hiding a tab keeps its settings, and loading a profile keeps your character's tab choices.
- Added `/checkmate tab <name> on|off` and `/checkmate tabs all`.

## 1.6.0

- Monster facts have their own rows, labels and order in Printout and Overlay, with New line on by default.
- Weaknesses combines elements, weapon damage types, immunities and Charm. Blue Magic keeps possible lessons and spell chance together. Both have separate choices for chat and the overlay.
- Pets can appear in the overlay using available source estimates or a retained stat reply for the same target.
- Appearance combines Colors and Look. Abbreviations replaces Short. Existing commands and saved settings still work.

## 1.5.2

- Blue Magic and Pets have their own tabs. Pursuit moves to Aggro, and observed buffs and debuffs move to Effects.
- Weaknesses collects elements, weapon damage types, immunities and Charm.
- Monster holds the full target notes, search and Copy details.

## 1.5.1

- Gil and Mug details appear only when the source confirms that the monster can drop ordinary gil.
- Blue Magic distinguishes named lessons, a confirmed empty list and an unresolved list, with the reason in the details.
- Dangers lists supported threats with their conditions.

## 1.5.0

- Added optional monster facts: family, Charm, HP/MP estimates, movement, pursuit, spawn and claim rules, dangers, Blue Magic, fight rules, traits, crystals and rewards.
- The elemental script warning can be hidden. Its source note stays in the details.
- Settings search highlights matching controls. Target details can be searched and folded closed.
- Profile deletion can be undone until Checkmate unloads.

## 1.4.0

- Added weapon damage weaknesses and resistances with signed percentages and BG Wiki icons.
- Rogue's Ring shows a Steal chance range when its base HP requirement cannot be resolved.
- Effects keeps the gear, buffs and merits read when the action message arrives.
- Incomplete packets are ignored, and profile saves preserve the old file until the replacement is ready.

## 1.3.0

- Overlay calculations refresh after relevant gear, buff, stat, HP and TP changes.
- Crit and magic count supported gear, buffs and era merits. A `~` marks estimates affected by uncertain monster effects.
- Jug pets keep the Beast Affinity rank from their summon. Unknown summon inputs stay uncertain.
- Drop, Steal and placeholder details explain known conditions. Hover help works with icons off.

## 1.2.0

- Added observed buffs and debuffs with estimated time left. Effects clears old observations and keeps unknown durations uncertain.
- Added a target overlay with its own layout, icons, colors and display choices.
- Added offhand and ranged hit rates, critical hits taken and Steal details.
- Expanded profiles, job links and display customization.

## 1.1.0

- Added pet hit and evade rates, including level ranges when the pet's exact level is unknown.
- Added link senses, monster IDs and placeholder names.
- Spaced stat requests to avoid sending them too close together. New colors follow your chosen skin.

## 1.0.1

- Updated monster data from `phoenix/live` at `465ac4c076`.
- Updated levels for Mimas and Porphyrion, Porphyrion's resist traits, and drops for Goblin Leecher and Witchetty Grub, along with nine other monsters.

## 1.0.0

- First release: monster checks, combat estimates, aggro and links, magic chances, immunities, elements and drop chances.
- Added configurable printout rows, colors, skins, abbreviations, profiles and job links.
- Included Phoenix monster data for supported open-world and instanced areas.
