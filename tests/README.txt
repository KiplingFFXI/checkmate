checkmate tests
===============

These run checkmate's real Lua outside the game. A mock of Ashita (mock_ashita.lua) stands in for the
game. Each test feeds it packets, frames and commands, then checks what checkmate printed, sent, hid
or saved. The monster data they load is the real generated data in ..\checkmate\data. Nothing here
is loaded by the addon or copied into the game.


Setup (once)
------------

You need Python 3.12. Run these from this folder.

  python -m venv .venv
  .venv\Scripts\python -m pip install -r requirements.txt

The tests load Ashita's own common.lua, chat.lua, json.lua and imgui.lua from
C:/Games/PhoenixXI/addons/libs, and the list of imgui functions from its annotations. The game, the
settings library and the GUI manager under imgui.lua are mocked in mock_ashita.lua. Set ASHITA_LIBS to
use a different Ashita install.


Running
-------

  Double-click run_tests.bat. It sets up .venv the first time, runs every test and keeps the window
  open so you can read the result. You can also run them from a terminal.

  .venv\Scripts\python run.py                   every test_*.lua
  .venv\Scripts\python run.py test_window.lua   just the ones named

Each file records its checks with check() or expect(), which live in mock_ashita.lua, and ends by
returning MOCK.report(). A file fails when it errors or reports "N FAILED". The last line says
how many files passed. Chat bytes over 127, like the star divider's, print as Lua escapes such as
\129\154. Files the addon writes, like profiles.json, go to a separate checkmate_tests_ folder for
each run. They are cleared before each file, and the folder is removed when the run ends.

The Verify workflow runs exporter fixture tests and addon tests on pull requests. Draft releases
must pass the same job before their zip is built. Source-backed exporter checks also run during
the weekly data refresh; ordinary code checks do not regenerate the bundled data.


What's here
-----------

  test_info.lua            source sections, level ranges, per-spawn overrides and learned Blue spells
  test_blue_learning.lua   unlearned filtering, minimum skill and readable learning inputs
  test_blue_controls.lua   Blue commands, saved profiles, display filtering and spellbook updates
  test_blue_finder.lua     source lesson lookup, spellbook caching, level gaps, filters and copied places
  test_detail_usability.lua compact controls, target header, readable details, search and copy choices
  test_observation_expiry.lua disappearing targets and pets lose old observed inputs
  test_settings_layout.lua fixed navigation, scrolling pages, collapsible groups and hidden matches
  test_danger_display.lua  long danger lists stay complete while hover text stays short
  test_dangers.lua         structured move filters, level ranges, coverage, search and complete copies
  test_lessons.lua         bounded completed-move observations, identities, invalid packets and resets
  test_lessons_integration.lua live and saved Blue markers, unchanged snapshot inputs and Copy details
  test_check_details.lua   latest manual check ownership, late replies, lifecycle and overlay-off details
  test_info_integration.lua Monster commands, cached target details and spellbook packet refresh
  test_expansion_ui.lua    Monster controls, hidden element marks, search focus and wrapped details
  test_profile_undo.lua    deletion undo, name collisions, job links and failed writes
  test_weapons.lua         weapon damage percentages, source warnings and level-dependent values
  test_weapon_damage_ui.lua chat, overlay icons, missing icons, settings and source notes
  test_weapons_integration.lua controller commands and cached overlay weapon data
  test_rogues_ring.lua     Steal ranges when base HP or Level Sync leaves the Ring latent uncertain
  test_settings_search.lua visible controls and help lead to the right settings tab
  test_profile_io.lua      failed reads, writes and file replacement preserve saved profiles
  test_packets.lua         fixed-field packet bounds and no state changes from truncated packets
  test_current_inputs.lua  gear, buffs and stats refresh while keeping the same target
  test_modifiers.lua       known gear and merits, manual totals and missing combat inputs
  test_magic_migration.lua saved magic totals keep their old meaning after upgrading
  test_ui_details.lua      search, target details, effect timers and ranged distance
  test_target_details.lua  target details clear when the target changes
  test_hover_boundaries.lua text tips stop before the next part of the overlay
  test_effects_packets.lua action packet bounds, variable result blocks, truncation and player helpers
  test_effects.lua         tracker durations from generated Phoenix data, observed removal, ownership,
                          gear and merits, overwrites, unknown timeouts, Sleep/DoT, zoning and cleanup
  test_effects_integration.lua real event handlers, off gates, chat, filtering, countdown slots,
                          target cache, tooltips, error recovery and settings commands
  run.py                  the test runner
  mock_ashita.lua         the stand-in for the game, the settings library and imgui. Its imgui
                          checks every call against Ashita's function list, catches missing required
                          arguments and unbalanced Push/Pop calls (fonts included), and lets a test click, type
                          and drag. It records each ImGui color the window pushes, each font it
                          draws with, what each (?) follows and, while a test hovers them, each tip.
                          It also records where the window is told to open, where a test moved it
                          and each table's column count. AddFontFromFileTTF hands back a made-up
                          font, or fails or hands back nothing for a file a test names, and every
                          call is recorded with the event it ran in. Your pet is the entity at
                          MOCK.player.pet_index. MOCK.summon, MOCK.charm and MOCK.dismiss change it
                          and send the pet update the way the server does, and MOCK.summon_quietly
                          brings one out without it. MOCK.reply sends your six /checkparam reply
                          lines, with the off-hand and ranged accuracy at 0 unless a test gives
                          them. MOCK.pet_reply sends the five /checkparam <pet> reply lines,
                          MOCK.merit_packet builds a merit list, and MOCK.send_out fires packet_out
                          for a packet going out. QueueCommand never fires packet_out.
                          For the overlay, your target is in MOCK.target. MOCK.monster puts a
                          monster in, MOCK.target_monster targets one, and MOCK.pick and
                          MOCK.pick_with_nothing bring up the cursor you pick a spell's target
                          with. ashita.memory finds the patterns a test plants, and
                          MOCK.plant_flags and MOCK.set_flag plant the game's cutscene, hidden
                          interface and map flags and turn them on and off. MOCK.level_up sends
                          your stats with a new level and your support job, and the zone packet
                          carries the zone. Your HP, the max HP the game shows with your gear and
                          food, and your TP are MOCK.player.hp, hp_max and tp, which party and
                          player memory answer, and MOCK.job_info_packet builds the job info
                          packet with your max HP before gear and food.
                          Target slot, flag and memory reads all count in MOCK.reads, while
                          GetEntity, GetPlayerEntity, pattern finds, GetFont and GetIO have counts
                          of their own. Each window keeps its own spot and size, so the overlay
                          and the settings window don't move each other. MOCK.overlay_size sizes
                          the overlay and MOCK.overlay_drag drags it, and MOCK.overlay_lines puts
                          back together the lines it drew from each TextColored and SameLine.
                          A stand-in for ffi lets MOCK.shift hold Shift down, and counts each time
                          checkmate asks about it. MOCK.chat_input opens the chat line, and each
                          IsInputOpen is counted too. MOCK.text_input is ImGui's WantTextInput,
                          there only to show the overlay never reads it, and each read of it is
                          counted. MOCK.mouse, MOCK.mouse_clicked and MOCK.mouse_down are the mouse,
                          and MOCK.mouse_button says which button that is, the left one by default.
                          Like ImGui, IsWindowHovered answers from where the mouse is and whether the
                          window took the mouse last frame. The last SetNextFrameWantCaptureMouse is
                          kept, the window's draw list records each triangle it draws with its color
                          and checks its clip rects balance, and each InvisibleButton is kept with the
                          cursor and clip rect it had.
                          The ffi and d3d8 stand-ins turn MOCK.picture's made-up pictures into
                          numbered textures, and count each load in MOCK.texture_loads and each time
                          d3d8 is required in MOCK.d3d8_requires. MOCK.picture can also give one
                          status effect another's picture, like the game's own shared ones. The
                          resource manager counts item and status lookups, and each item's own in
                          MOCK.item_lookups_of. A Dummy in the overlay is an icon, and
                          MOCK.overlay_lines shows it as [item 930], [status 179] or a badge's
                          letter, like [I]. BeginTooltip answers true. A tooltip begun outside
                          every window is the overlay's: its text goes in MOCK.gui.overlay_tip with
                          the font size and wrap it had, and MOCK.overlay_tips_shown counts each
                          one. MOCK.other_window = true puts another window under the mouse, over the
                          one being drawn, so IsWindowHovered answers false, and true with
                          ImGuiHoveredFlags_AnyWindow. 'popup' and 'active' only count when the flags
                          also allow a window blocked by a popup or an active item, the way ImGui
                          answers while a dropdown is open or a text box has the caret, and
                          MOCK.gui.hover_flags keeps each call's flags.
                          In the overlay each text and icon moves the cursor on, so each icon has
                          its own spot, and MOCK.overlay_icon_spot(n) gives the middle of the nth
                          icon drawn last frame, or nil past the last one
  fixtures\               a made-up zone 900 in the monster data format, one row per case to test.
                          A test points addon.path there to use it. Three of its rows have
                          something to steal, and one of them has two items. Four have a job:
                          WAR/THF, BLM/BLM, PLD with no support job, and MNK/PLD, whose heads look
                          alike. Only Fixture Goblin has DEX at its levels, so crit taken is unknown
                          for the rest
  test_math.lua           the math on its own against worked examples in the file: hit rate
                          rounding at -92, -36 and -34, crit steps, off-hand and ranged with the
                          5% ranged floor, 25 yalms and the Lv75 RNG and Lv30 NIN examples, magic
                          examples A, B and C, and the Treasure Hunter examples at TH 0, 2 and 4
  test_levels.lua         which level a monster is: the /check level less level_mod, a /check level
                          of -1, widescan, the data's range and spawns found by name. Then the
                          numbers over a range, the level range after a known level, levels in two
                          blocks like Assault, and each spawn's own range. It also covers a charmed
                          pet's level, from your latest /check or widescan of it first, unless it
                          died since
  test_checkparam.lua     the automatic /checkparam: when it's sent, hiding only its own six reply
                          lines, a reply that comes first (another addon), a second /check while waiting,
                          the timeout and zoning, with the game's /check line shown, a reply
                          about your pet with nothing waiting showing in chat, and your off-hand
                          and ranged accuracy kept from your reply but never from your pet's
  test_replace.lua        replacing the game's own /check line: which lines are hidden and which
                          never are, a line checker hid first, what prints at once, when the request
                          goes and what waits for the reply, the timeout, and zoning, a layout
                          change or a second /check during the wait. It also covers a /check that
                          gives up on the reply in each layout, the plain /check line when nothing
                          else prints, can't be gauged, and a stopped checkmate
  test_readout.lua        your stats, skills, gear and buffs from game memory: Signet, crit, each
                          magic school's extras (staff, seals, Soul Voice, wind instrument), resist
                          traits by level, Healing on undead, and the drop settings, with each
                          item's id kept next to its name
  test_aggro.lua          the aggro and links parts: every answer from the /check con, always aggro,
                          impossible to gauge at a known level, across the Too Weak level and with
                          no level, not aggressive and never, how it finds you with Detection on and
                          off, the notes, the links with the most names shown, "+N more", how each
                          one links with its switch on and off (Magic for one that notices magic,
                          nothing for one that only notices scent), the names off and no links,
                          Color by threat on and off, the Links colors and the divider before Links,
                          each part on and off with the game's line shown and hidden, Links on a new
                          line, with a label, above Aggro, after another part, on the /check line
                          and in Aggro's place with Aggro off, their place in the printout, and real
                          monsters from the generated data through a real /check, with the show,
                          hide and link commands and the sample. Those real monsters list only
                          monsters that come up on Phoenix: Expeditionary Force and Garrison
                          monsters link only inside their own event and the monsters around them
                          don't list them, a Limbus floor links only with itself, an add that's only
                          up while its owner fights doesn't link, Cherry Saplings link with each
                          other but not the Cherry, and Omaern and Pandemonium Lamp show as the game
                          names them. It also covers settings files from before Links was a part of
                          its own: Links on only where Aggro was, the link settings moved, the aggro
                          colors kept for Links and the /check lines the same to the byte
  test_elements.lua       the elements part: every step of the rule (nullify, absorb, ranks 11, 10
                          and 4, damage taken for one element and the 5% band, the lowest rank,
                          extra magic evasion), the magic damage note, the scripted mark, a level's
                          own fields, real monsters worked out from the Phoenix source, the words,
                          Show how strong and names sharing a strength, the label divider, every
                          color down to the bytes, every skin's colors, its place in the printout,
                          a settings file without it, the sample, and real monsters through a /check
  test_pet.lua            the pet part: which pet, avatars left out, its level for each kind
                          including the jug window, levels kept through a level-up and moved by a
                          sync but not by the sync's level moving, a sync or level cap end whose new
                          level comes before its buff goes, Monster Gloves when it comes out
                          at their level until a sync picks the level again, and Beast Affinity
                          from the merit list, the math against worked examples, when /checkparam
                          <pet> goes, including after another addon's, and which five lines it
                          hides, replies in either order, timeouts, a second /check, zoning, a
                          dismissed pet alone on its line or sharing one, the pet line never
                          holding up the lines under it and still printing after a layout change,
                          and the printout down to the bytes
  test_weapons.lua        the off-hand and ranged parts through a real /check: which gear gives each
                          one (a weapon in each hand, but not a shield, a grip or hand-to-hand, and a
                          bow, crossbow or gun with its ammo or something to throw, but not a bow or
                          ammo alone or an instrument), the Lv30 NIN and Lv75 RNG examples against
                          real monsters, a monster with no row, the middle of a range, Show it outside
                          the sweet spot too, a reply of 0, when the /checkparam goes with only one of
                          them on, can't be gauged, the timeout, a newer /check and a reply that
                          comes first
  test_steal.lua          the Steal part: the roll against worked examples from the real data, THF
                          as your main or support job, gear under its own level and under a level
                          sync, Btm. Knife on a support THF, Rogue's Ring's HP and TP line with
                          them read once, against the max HP the game shows and then the one from
                          the job info packet, the item alone on other jobs, before THF 5 and
                          with a restricted support job, lists, nothing, an unknown level, real
                          monsters through a /check, its line before and after the /checkparam
                          reply, its label, New line and the Classic skin to the bytes, what it
                          reads, every other line staying the same with it off, the sample, and
                          the overlay going stale like crit and magic until a /check, a new
                          target, a level change or a support job change works it out again
  test_crit_taken.lua     the Crit taken part and the two crit merits: the math on its own, the worked
                          examples through the readout with real monsters, with and without merits, at
                          and under the level caps, each piece of gear at and under its level, a
                          monster that swings with nothing but TP moves, one that never swings and one
                          of those that counters, in chat and the overlay.
                          Then real monsters through a /check: its place right after Crit with nothing
                          sent for it, its label, New line and arrows, its colors to the bytes in the
                          Phoenix and Classic skins, its grades going the other way at the cutoffs, a
                          range and its middle, the ?, unknown, can't be gauged, the typical numbers,
                          short words, your gear read once and never with the part off, the merit
                          commands, a level sync and a hand-edited file. It also covers the merit list
                          filling both in, a hand change holding until you zone or change that merit,
                          the switch, profiles and job links leaving your merits out, reset, help, the
                          Numbers tab's sliders, the overlay going stale like crit and magic, and the
                          sample
  test_job.lua            the Job part: the letters and the support job rule, the 22 jobs and
                          their artifact heads, real monsters through a /check, the rows whose data
                          names no job or whose job is set at spawn, the overlay's pictures with
                          Icons only and a picture that won't load, the settings and commands, an
                          older settings file, and the other lines staying the same with it off
  test_short.lua          short words: the word table and its defaults, with the senses as S, H, TS
                          and TH, the element letters the same as the badges' and the 22 jobs, every
                          key a readout hands over being in it, every word swapped where it prints,
                          empty boxes, the count, typed text that looks like a format, both switches
                          off leaving every line alone to the byte, the sample and the README's
                          examples, the Links, Steal and Job parts, the chat's element icons and the
                          overlay's pictures before a short word, the tips staying in full words, the
                          chat and overlay switches on their own, wrapping with a short count and a
                          lone bracket, clashes and their notes on the Short tab, each row's tip, the
                          commands and help short, and an older settings file
  test_printout.lua       the chat lines: name and level first, the level range, the monster's ID,
                          the PH note, part order, new lines, the extras on their own line or the same
                          line, labels, colors and grades, number styles and cleaning labels. It also
                          covers every con and evasion and defense reading, where the reading goes,
                          every chat color down to the bytes, every divider and label divider, the
                          plain /check line and can't be gauged with the game's line hidden, the
                          off-hand and ranged parts with Show it outside the sweet spot too, the lines
                          that wait for hit, off-hand, ranged and evade, the line holding the pet
                          part, settings files with missing or broken settings, and the chat's
                          element icons, with the bytes the same with them off
  test_overlay.lua        the overlay. Off by default it reads and draws nothing, and the chat
                          printout is byte for byte the same with it on. With it on: the data's
                          level before a /check and the /check after it, widescans, deaths, zoning
                          and level changes, Remember, which entities show, picking a target with
                          and without Follow the cursor, each part, Aggro and Links each on and off
                          with Links on Aggro's line or its own, the name switches with the
                          chat's words, every divider and label divider, Put each part on its own
                          line, a /check the chat prints nothing for, item names cleaned, crit and
                          magic over a level range and going stale, and real Valkurm Dunes
                          monsters. It also covers what a frame reads, the game's flags with their
                          patterns found and missing, hiding, the sample goblin, sliders showing
                          before they save, clicks going through it unless you hold Shift, moving
                          it and dragging its corner to set the wrap with Shift, the narrowest and
                          widest the corner goes, the corner only moving the wrap the way you drag
                          it, even with a piece wider than the wrap or a readout narrower than the
                          narrowest, letting go of Shift in the middle of a drag, and a click the game
                          already got never grabbing it, nor the click right after it. That click
                          leaves the game the mouse until you let go, even if the overlay hides, with
                          a button under it so the game keeps your keys too, and the overlay keeps
                          last frame's size the frame after it. A right or middle click the game got
                          does the same without the button, and one once it has the mouse never grabs
                          it. It also covers a click right as you let go of Shift still grabbing it,
                          dragging it away and back, the chat line and Lock it in place each stopping
                          the move and the corner, a text box that still has the caret not stopping
                          them, saving once you let go, a pulled in overlay keeping its spot when you
                          change its width or click it the frame it's pulled in, Shift never read with
                          the overlay off or nothing to show, the spot pulled onto the screen, the
                          font, every skin's look, wrapping at every width and with odd custom
                          dividers, errors in the drawing and in each packet handler never stopping
                          the chat printout, a restart after an error, loading the zone's data and
                          cleaning a broken settings file. A custom divider that's a comma and a space
                          never splits the reading or drops its comma, and with one that's only a
                          closing bracket the line can still wrap after the reading. Then its icons:
                          game pictures, badges in each of their eight colors, Icons only and the
                          immunities that share a picture, a picture that won't load, each loaded once
                          and never on a steady frame, and the chat's icon settings staying out of it.
                          Then its tips: the mouse test, the wait, none while a button is down or
                          another window is under the mouse, the panel staying click-through, every
                          icon on the sample goblin having one, and nothing read with tips off or no
                          icon on show
  test_tips.lua           the words of each overlay icon's tip: every reason an element is weak or
                          resisted, a Magic school's element, drops, Steal, every immunity and every
                          job
  test_commands.lua       every /checkmate command and the words it refuses, with what each one says
                          back and that each change is saved. That takes in color and windowcolor for
                          every setting, every part's label, New line and move, each cutoff, the pet
                          part's switches and words, linkhow, linknames and maxlinks setting the
                          links part, Links moving apart from Aggro, the overlay's commands and the
                          parts and dividers it refuses, every stand-in spell, each immunity and its
                          label, the number commands at and past their limits, quotes, empty quotes
                          and text cleaned to plain ASCII, profile rename and job links, the font
                          commands with a font that's missing and one that won't load, /cmate
                          for every command, and the one line an unknown word gets. Text typed in
                          chat comes in Shift-JIS, and every command that keeps text drops Japanese
                          characters, half-width katakana and auto-translate phrases whole, even a
                          phrase a space or quote splits, and a lone lead byte at the end. A profile
                          name with nothing left is refused, and one cut at 32 characters loses a
                          space at the cut and says the name it saved. It also covers help, every
                          help topic, help windowcolors, help with a word that isn't a topic, and a
                          help line for every command
  test_colorblind.lua     the Colorblind safe skin: every two colors that mean different things stay
                          far enough apart with normal vision, protanopia and deuteranopia, and so
                          do the overlay's eight element badges
  test_skins.lua          what each skin holds, every skin setting every chat color and all 41 window
                          colors, picking one, Reset to skin, Custom, Undo, the Colorblind safe tip,
                          skins leaving the dividers, the font and the overlay's own settings alone,
                          and /checkmate reset asking first. It also fills the window look on a first
                          install, after a reset and from a broken file. A Classic settings file
                          without the pet, ID and PH colors gets them from Classic, an Ember one
                          without the off-hand and ranged colors gets them from Ember, a High
                          contrast one without the steal colors gets them from High contrast, and a
                          Colorblind safe one without the element badge colors gets them from
                          Colorblind safe. Every skin sets the badges, all cream in Minimal and
                          eight different colors in the rest. Every skin paints crit taken in its
                          crit colors, and a Classic file without them gets them from Classic
  test_profiles.lua       save, load, rename and delete, what the shared file holds (window colors,
                          the font, the label divider, the level range, the ID, the PH note and Show
                          how each one links included), a profile with settings missing, chat colors
                          it lacks filled from its own skin, one with wrong types, a broken file, job
                          links loading a profile when you zone in on another job, an Ember profile
                          from before off-hand and ranged, a Colorblind safe one from before Steal,
                          a High contrast one from before the Job part, and ones from before Links
                          was a part of its own, which load Links on only where Aggro was, with
                          their link settings and aggro colors. The overlay's settings save and
                          load, where it sits never saves, and a profile from before the overlay,
                          loaded by hand or by a job link, leaves yours as they were. The icon
                          settings save and load, and a profile from before them gets the defaults and
                          its skin's badge colors. Both short words switches and every short form save
                          and load, a profile from before them, by hand or by a job link, leaves yours
                          as they were, and one missing a few short forms gets those from the defaults
  test_window.lua         every control in the settings window and the setting it edits, what greys
                          out and when, every window color, the font list and size, a missing font and
                          ones that failed to load, what saves when, and a frame error stopping
                          checkmate once. It also checks a (?) with a tip on every control, the tips
                          on each tab, the short note when a part or the grade colors are off, the PET
                          and RANGED sections, the Pet, Off-hand, Ranged, Steal, Job and Links rows,
                          the LINKS section saying when Links is off, Show how each one links, the
                          chat's Element icons, the overlay's ICONS section and the Element badges
                          and Links colors, where the window opens and saves (pulled back onto the
                          screen, cut down to a smaller screen, left out of profiles, put back by
                          reset), and two columns going by the window's width, with colors two to a
                          row only where they fit. The Overlay tab comes second of eleven, with its
                          parts table in the chat's order, its boxes, the Divider list with only the
                          plain dividers, its own font, and sliders and text boxes telling the overlay
                          they changed something before it saves. The Short tab comes after
                          Immunities, with a box for every word, both switches, the boxes greyed while
                          neither display uses them, two words to a row with a gap between them, even
                          at 12 px in the smallest window, or one to a row when the sections sit side
                          by side or a short form needs a wider box, every box wide enough for the
                          short form it comes with, Reset every short word and a clash note. The
                          window first opens 840 wide and never gets narrower than its eleven tabs
                          need
  test_window_commands.lua
                          each settings window control and its /checkmate command, the pet, off-hand,
                          ranged, steal, job, links, icon and short words ones, linkhow and every
                          Overlay tab control included, from the defaults, setting the same value and
                          saving the same copy. Print a sample on the Printout, Colors and Short tabs
                          matching /checkmate sample, the window showing what a command set, and a
                          profile keeping every value those commands set but your merits, in
                          profiles.json and after a reset and a load
  test_zone_data.lua      every generated zone file loads with the shape the addon reads, with each
                          link list written once and grouped by how each one links, and each
                          placeholder naming an NM in the same file, rows worked out by hand match
                          (open world, NMs, placeholders, battlefields, Limbus, Dynamis, Assault,
                          The Ashu Talif and the Nyzul Isle mission fights, steal items, DEX, crit
                          rates and the monsters that swing with nothing but TP moves, never swing or
                          counter included), links only name monsters that come up on
                          Phoenix, with each event and Limbus floor linking inside itself and the
                          game's names for them, and real monsters print through the addon, with the
                          level range, ID and PH note too, data\pets.lua holds the jug pets, the
                          avatars, the jug level gear and Beast Affinity, data\steal.lua holds
                          Steal's job and level and the gear that adds to it, and data\crit.lua
                          holds the two crit merits, the levels they count from and the gear that
                          changes the crits you take. Each job is one the addon has letters for, and
                          the rows whose data names no job, or whose job is set at spawn, have none
  test_addon.lua          the header, the file layout, every font loading on the load event and
                          never after, a /check printing, a quiet frame reading no game memory,
                          and only your target with the overlay on, reading your job once after
                          zoning, saving on unload, d3d8 loading on the load event only with the
                          overlay and its icons on, and the overlay keeping going when it won't load

  preview\                draws the real settings window with real Dear ImGui 1.92.3 (the version
                          Ashita uses). preview\all_tabs.py draws every tab to out\, the window in
                          Windows fonts at 12, 16 and 24 pixels, and the overlay in each of
                          preview\overlay_scene.lua's scenes. See preview\README.txt.
