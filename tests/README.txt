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
\129\154. Files the addon writes, like profiles.json, go to checkmate_tests in your temp folder and
are cleared before each file.


What's here
-----------

  run.py                  the test runner
  mock_ashita.lua         the stand-in for the game, the settings library and imgui. Its imgui
                          checks every call against Ashita's function list, fails on a nil argument
                          or an unbalanced Push/Pop (fonts included), and lets a test click, type
                          and drag. It records each ImGui color the window pushes, each font it
                          draws with, what each (?) follows and, while a test hovers them, each tip.
                          It also records where the window is told to open, where a test moved it
                          and each table's column count. AddFontFromFileTTF hands back a made-up
                          font, or fails or hands back nothing for a file a test names, and every
                          call is recorded with the event it ran in
  fixtures\               a made-up zone 900 in the monster data format, one row per case to test.
                          A test points addon.path there to use it
  test_math.lua           the math on its own against worked examples in the file: hit rate
                          rounding at -92, -36 and -34, crit steps, magic examples A, B and C,
                          and the Treasure Hunter examples at TH 0, 2 and 4
  test_levels.lua         which level a monster is: the /check level less level_mod, a /check level
                          of -1, widescan, the data's range and spawns found by name. Then the
                          numbers over a range, the level range after a known level, levels in two
                          blocks like Assault, and each spawn's own range
  test_checkparam.lua     the automatic /checkparam: when it's sent, hiding only its own six reply
                          lines, a reply that comes first (advcheck), a second /check while waiting,
                          the timeout and zoning, with the game's /check line shown
  test_replace.lua        replacing the game's own /check line: which lines are hidden and which
                          never are, a line checker hid first, what prints at once, when the request
                          goes and what waits for the reply, the timeout, and zoning, a layout
                          change or a second /check during the wait. It also covers a /check that
                          gives up on the reply in each layout, the plain /check line when nothing
                          else prints, can't be gauged, and a stopped checkmate
  test_readout.lua        your stats, skills, gear and buffs from game memory: Signet, crit, each
                          magic school's extras (staff, seals, Soul Voice, wind instrument), resist
                          traits by level, Healing on undead, and the drop settings
  test_aggro.lua          the aggro part: every answer from the /check con, always aggro, impossible
                          to gauge at a known level, across the Too Weak level and with no level,
                          not aggressive and never, how it finds you with Detection on and off, the
                          notes, the links with the most names shown, "+N more", the names off and
                          no links, Color by threat on and off, its place in the printout, and real
                          monsters from the generated data through a real /check
  test_elements.lua       the elements part: every step of the rule (nullify, absorb, ranks 11, 10
                          and 4, damage taken for one element and the 5% band, the lowest rank,
                          extra magic evasion), the magic damage note, the scripted mark, a level's
                          own fields, real monsters worked out from the Phoenix source, the words,
                          Show how strong and names sharing a strength, the label divider, every
                          color down to the bytes, every skin's colors, its place in the printout,
                          a settings file without it, the sample, and real monsters through a /check
  test_printout.lua       the chat lines: name and level first, the level range, part order, new
                          lines, the extras on their own line or the same line, labels, colors and
                          grades, number styles and cleaning labels. It also covers every con and
                          evasion and defense reading, where the reading goes, every chat color
                          down to the bytes, every divider and label divider, the plain /check line
                          and can't be gauged with the game's line hidden, the lines that wait for
                          hit and evade, and settings files with missing or broken settings
  test_commands.lua       every /checkmate command and the words it refuses, with what each one says
                          back and that each change is saved. That takes in color and windowcolor
                          for every setting, every part's label, New line and move, each cutoff,
                          every stand-in spell, each immunity and its label, the number commands at
                          and past their limits, quotes, empty quotes and text cleaned to plain
                          ASCII, profile rename and job links, the font commands with a font that's
                          missing and one that won't load, /cmate for every command, and the one
                          line an unknown word gets. Text typed in chat comes in Shift-JIS, and
                          every command that keeps text drops Japanese characters, half-width
                          katakana and auto-translate phrases whole, even a phrase a space or quote
                          splits, and a lone lead byte at the end. A profile name with nothing left
                          is refused, and one cut at 32 characters loses a space at the cut and says
                          the name it saved. It also covers help, every help topic, help
                          windowcolors, help with a word that isn't a topic, and a help line for
                          every command
  test_colorblind.lua     the Colorblind safe skin: every two colors that mean different things stay
                          far enough apart with normal vision, protanopia and deuteranopia
  test_skins.lua          what each skin holds, every skin setting every chat color and all 41 window
                          colors, picking one, Reset to skin, Custom, Undo, the Colorblind safe tip,
                          skins leaving the dividers and the font alone, and /checkmate reset asking
                          first. It also fills the window look on a first install, after a reset
                          and from a broken file
  test_profiles.lua       save, load, rename and delete, what the shared file holds (window colors,
                          the font, the label divider and the level range included), a profile with
                          settings missing, one with wrong types, a broken file, and job links
                          loading a profile when you zone in on another job
  test_window.lua         every control in the settings window and the setting it edits, what greys
                          out and when, every window color, the font list and size, a missing font
                          and ones that failed to load, what saves when, and a frame error stopping
                          checkmate once. It also checks a (?) with a tip on every control, the tips
                          on each tab, the short note when a part or the grade colors are off,
                          where the window opens and saves (pulled back onto the screen, cut down
                          to a smaller screen, left out of profiles, put back by reset), and two
                          columns going by the window's width, with colors two to a row only where
                          they fit
  test_window_commands.lua
                          each settings window control and its /checkmate command, from the
                          defaults, setting the same value and saving the same copy. Print a sample
                          matching /checkmate sample, the window showing what a command set, and a
                          profile keeping every value those commands set, in profiles.json and
                          after a reset and a load
  test_zone_data.lua      every generated zone file loads with the shape the addon reads, rows worked
                          out by hand match (open world, NMs, battlefields, Limbus, Dynamis, Assault,
                          The Ashu Talif and the Nyzul Isle mission fights), and real monsters print
                          through the addon, with the level range too
  test_addon.lua          the header, the file layout, every font loading on the load event and
                          never after, a /check printing, a quiet frame reading no game memory,
                          reading your job once after zoning, and saving on unload

  preview\                draws the real settings window with real Dear ImGui 1.92.3 (the version
                          Ashita uses). preview\all_tabs.py draws every tab to out\, and the
                          window in Windows fonts at 12, 16 and 24 pixels. See preview\README.txt.
