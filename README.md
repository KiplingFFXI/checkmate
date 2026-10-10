# checkmate

checkmate is an Ashita v4 addon for Phoenix. It adds monster details and combat estimates to your `/check`, with an optional target overlay. Choose what shows, arrange the rows, and change the words, colors and abbreviations.

Phoenix staff approved checkmate for use on Phoenix. Author: **Kipling**.

[Download the latest release](https://github.com/KiplingFFXI/checkmate/releases/latest) | [Full guide](docs/GUIDE.md) | [What's changed](CHANGELOG.md)

## Install or update

1. Download `checkmate-<version>.zip` from the release page.
2. Extract it into your Phoenix `addons` folder. You should have `addons\checkmate\checkmate.lua`.
3. For a first load, type `/addon load checkmate`. After replacing an existing install, use `/addon reload checkmate` if it is already loaded.

To load it automatically, enable checkmate under **Manually installed** on the Phoenix launcher's Addons page. Alternatively, add `/addon load checkmate` to `scripts\default.txt`, outside the launcher's managed block. Use one method.

Updates replace the `addons\checkmate` folder. Leave `config\addons\checkmate\` in place; it holds your settings and shared profiles.

## Start here

Type `/checkmate` to open settings. Choose a starter preset under **Profiles**, or use **Display** to select chat and overlay rows independently. Presets enable the overlay; you can turn it off with `/checkmate overlay off`.

- **Preview** shows sample or current-target text before you change your layout. **Print a sample** shows the actual chat output.
- **Find settings** searches controls and their help. **Appearance** holds skins, colors, fonts and visible tabs.
- **Target details** keeps the full supported notes and Links and Dangers lists. Search them or copy the details, even from your last manual `/check` with the overlay off.
- **Undo last change** restores recent settings edits. Save a profile when you have a setup you want to keep.

## What it can show

- Levels, aggro, family-grouped links, spawn conditions and monster facts.
- Hit, evade and critical chances; normal-attack pDIF; shield block and parry estimates.
- Magic chances, elemental and weapon weaknesses, immunities and Charm eligibility.
- Dangers with supported move details, and observed buffs and debuffs.
- Possible Blue Magic lessons, spellbook status, optional observed move use and a spell finder.
- Conditional drops, Steal, rewards and supported pet estimates.

These are source-based estimates, not a live server lookup. Ranges, `~`, `?` and unknown values keep missing or changing information visible. Hover a result for its inputs and conditions. If checked inputs change, retained estimates say **Check again**; another manual `/check` refreshes them. [Read the conditions and limits](docs/GUIDE.md#understand-estimates-and-refresh-readings).

Passive displays send no requests. A manual `/check` can trigger a shared `/checkparam <me>` or a supported pet request for enabled calculations. Settings stay local. [What checkmate reads and sends](docs/GUIDE.md#what-checkmate-reads-sends-and-saves).

## Source and license

Data and calculations follow [Phoenix's source](https://github.com/phoenixffxi/Phoenix). checkmate uses [GNU GPL v3.0](LICENSE). Bundled weapon icons have separate [source and license notes](checkmate/assets/weapons/SOURCES.txt); other item and status pictures come from your client.
