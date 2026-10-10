checkmate settings window preview
=================================

Renders checkmate's real settings window (the addon's own Lua, unmodified) with real Dear ImGui 1.92.3
(imgui_bundle) in a hidden window, and saves a PNG cropped to the settings window.

It runs on the tests' venv (see ../README.txt). It needs lupa, imgui_bundle 1.92.3, pillow, numpy and
munch. The first run pulls Ashita's Agave font out of Ashita.dll into fonts/. Ashita's libs and
Ashita.dll come from ASHITA_LIBS like the tests (default C:/Games/PhoenixXI/addons/libs, with the DLL
two folders up).


Every tab
---------

  python all_tabs.py

draws every tab to ../out/, each in its own run of preview.py. These are the files it writes.

  <Tab>.png          the window at its default size (840 by 560), with wrapping navigation
  <Tab>_full.png     the window 1300 tall on a 1600 x 1359 screen, so most tabs show whole
  <Tab>_narrow.png   the 560px window, with tabs wrapping above the scrolling page
  <Tab>_end.png      the same as _full, scrolled to the bottom, for the tabs taller than that
                     (Display, Abbreviations, Appearance)
  <Tab>_wide.png     the window at least 1028 wide and 1300 tall, for tabs with two columns
                     (including Weaknesses); navigation does not force a wider window
  skin_<id>.png      the Display tab in each skin
  Profiles_saved.png the Profiles tab with three saved profiles and two job links, one of them to a
                     profile that's gone
  Drops_all.png      the Drops tab showing every item, at Treasure Hunter 4
  whole_addon.png    the window drawn by the whole addon (checkmate.lua, /checkmate, then frames)
  font_segoeui_16.png   the whole addon with Segoe UI at 16 px. checkmate's own load event loads the font
  font_consolas_12.png  the Display tab in Consolas at 12 px, the smallest size
  font_24_<Tab>.png     every tab in Verdana at 24 px, the biggest size, full height
                        at the smallest width that size allows, and _end for the tall tabs
  font_24_<Tab>_wide.png  the same at least 1348 wide, enough for two columns at 24 px
  font_ashita_24.png    the Display tab in Ashita's font at 24 px at its smallest width
  font_missing.png      the Appearance tab after picking Segoe UI from a folder without it
  overlay_<scene>.png   the overlay itself, cropped to it, in each scene overlay_scene.lua sets up
                        in Valkurm Dunes with the real data: sample (the sample goblin with the
                        settings window open), before and after (Goblin Tinkerer before and after a
                        /check, with most parts on), nm (Valkurm Emperor after a /check), nodata (a
                        monster missing from the data), links (Most names shown set to All), nowrap,
                        no_background, no_border, verdana_24, ashita_12, crit_magic and shift (after,
                        with Shift held, so its corner shows). Then the icon scenes, on the sample
                        goblin with magic, immunities, elements, drops, steal and its jobs on: icons
                        (the game's pictures), icons_badges (Colored badges), icons_only (badges and
                        Icons only), icons_off (Show icons off), and icons_12 and icons_24 (badges at
                        font size 12 and 24). Then job and job_icons_only, a Fire Elemental after a
                        /check with the Job part on and its two heads, the second with Icons only
  overlay_<skin>.png    the overlay after a /check in each skin
  overlay_badges_<skin>.png  the icon scene with Colored badges in each skin
  overlay_tip_<part>.png     the overlay with the mouse resting on its first icon, so its tip shows,
                        cropped to take the tip in: element, school, drop, steal, immunity, job and effect
                        (the sample goblin with only that part shown), 12 and 24 (element at font
                        size 12 and 24), and skin_<id> (element in each skin)

The Abbreviations tab includes 33 Effects words. Its wide layout starts the second section at Effects.
Abbreviations_end.png and font_24_Abbreviations_end.png show the end of the longer tab.
The effects, effects_only, effects_off, effects_wrap, effects_12 and effects_24 scenes check countdown
layout; tip_effect checks its tooltip. Nonsquare countdown Dummies are excluded from mouse-icon targets.

Text hover uses --mouse-text instead of --mouse-icon. It finds a substring in an actual rendered overlay
text run and moves the mouse to its item bounds. A missing final tooltip fails the run, and any mouse
capture fails too. details_scene.lua supplies level, magic, links and ph scenes with every icon off:

  python preview.py --full --frames 40 --size 1200 901 --window checkmate_overlay --mouse-text "Goblin Tinkerer" --exec "dofile(ADDON_DIR .. '/../tests/preview/details_scene.lua')('level')" --out text_level.png

Use "Elemental" for magic, "+" for links, and "PH for" for ph. The Links scene uses the real list's
hidden-count text, so it does not depend on a fixed count. An odd screen height avoids the screenshot
row-swap artifact. Monster includes a scrollable full Target details view for lists over 20 names.
The target-details scene uses a real 150-name Dynamis list; render once normally and once with --scroll 100000
to inspect the full section's top and bottom:

  python preview.py --full --tab Monster --size 1200 901 --window-size 980 760 --window "checkmate##settings" --exec "dofile(ADDON_DIR .. '/../tests/preview/details_scene.lua')('details')" --out target_details.png

The Windows fonts come from C:\Windows\Fonts, loaded with the addon's own ui\window_font.lua.
overlay_scene.lua's scenes run the whole addon with --full and --exec, and its top comment says what
each one shows.

It prints preview.py's line for each and exits with 1 when any render failed.


Usage
-----

  python preview.py --out <png> [options]

  --addon DIR          folder with checkmate.lua, ui/, core/ (read only, never written).
                       Defaults to ../../checkmate.
  --out PNG            where the PNG goes (not written when the run fails)
  --tab NAME           tab to show, matched to the visible tab label, any case ("Display", "Appearance").
                       Clicks that tab's navigation button until its page opens. The run fails if
                       no tab has that label, and lists the labels it saw.
  --size W H           game screen size (ImGui display size), default 1600 1200
  --frames N           frames drawn before the screenshot, default 4. Auto-fit windows are hidden on
                       their first frame, so use 2 or more.
  --set key.path=val   change a settings value before drawing (repeatable). Paths start at the
                       settings table: printout.separator=' | ', look.imgui.rounding=6,
                       window.width=800. A value can be 12, 0.5, true, false, nil, #rrggbb or
                       #rrggbbaa (a color table) or 1,0.5,0,1 (a list table). Anything else is a
                       string. Missing parent tables are created, with a warning.
  --window-size W H    force the settings window to W x H every frame, like a user dragging its
                       corner. Size constraints the addon sets still apply.
  --scroll Y           scroll the settings window down Y pixels every frame. ImGui stops at the
                       bottom, so a big number shows the end of a tab taller than the screen.
  --window TEXT        crop to the window whose name contains TEXT (default: the biggest window
                       whose name doesn't start with ##)
  --margin PX          pixels kept around the window in the crop, default 10
  --no-crop            save the whole screen
  --full               run the whole addon instead: dofile checkmate.lua, fire 'load', run
                       "/checkmate", then fire d3d_present each frame. checkmate's own pcall is
                       watched for "Stopped after an error", and the overlay's for "The overlay
                       stopped after an error".
  --exec LUA           Lua run after the settings load and --set, before the first frame.
                       `settings` is the settings table. Repeatable. For example
                       --exec "require('ui.skins').apply(settings, 'ember')".
  --script LUA_FILE    draw this Lua file instead of the settings window (the addon still loads, so
                       require('ui.skins') and the rest work). The file returns a function called once per
                       frame. It can call PREVIEW.log(...) and read PREVIEW.frame / PREVIEW.last_frame.
                       The last frame's log lines go to stderr as "log: ...". Use --window to pick
                       the window to crop to.
  --mouse-icon N       from the second frame on, put the mouse in the middle of the Nth icon (a Dummy)
                       the last frame drew, 1 for the first, so the overlay shows that icon's tip. The
                       tip waits 9 frames. The crop takes the tip in, and the run fails if ImGui ever
                       wants the mouse while it's there, since a click would then not reach the game.
                       It warns when no tip showed on the last frame.
  --font PATH          default ImGui font (default: fonts/Agave_Regular.ttf, Ashita's own)
  --font-size PX       default font size, default 18 (Ashita's)

Examples

  python preview.py --tab Display --out printout.png
  python preview.py --tab Appearance --out appearance.png --exec "require('ui.skins').apply(settings, 'classic')"
  python preview.py --tab Profiles --out wide.png --window-size 900 480
  python preview.py --tab Drops --out small_screen.png --size 1280 720


Output
------

stdout is one line:

  OK window='checkmate##settings' pos=(120,20) size=840x560 content=797x1166 scrollbar=y tab=Display
     screen=1600x1200 frames=4 font=Agave_Regular.ttf crop=(110, 10, 970, 590) out=printout.png

  size     the window's outer size on the last frame
  content  ImGui's content size (what the cursor reached, without padding and decorations)
  scrollbar=y / x   shown when the window has a scrollbar
  tab      the tab(s) whose BeginTabItem returned true on the last frame
  loaded=FILE@SIZE  each font the addon loaded with AddFontFromFileTTF, and the size it loaded at
  mouse_icon=N tip_frames=K   with --mouse-icon, the icon the mouse rests on and how many frames
                    drew a tip
  warnings=N        count of warnings, each printed on stderr as "warning: ..."

On failure the line starts with FAIL, ends with "error: <first error>" (the rest are on stderr as
"error: ..."), no PNG is written and the exit code is 1 (2 for a missing addon folder).
A run fails on a Lua error in the addon, an ImGui assert (IM_ASSERT, raised by imgui_bundle), a call
to an imgui function the bridge doesn't have, a bad argument shape (like Checkbox given true instead
of { true }), ImGui stacks left unbalanced by the draw (Push without Pop), --tab never opening, and in
--full mode checkmate reporting "Stopped after an error" or "The overlay stopped after an error".
These only warn, and the exit code stays 0. An ImGui constant the addon names that Ashita's
libs/imgui.lua doesn't define (nil in game, found by scanning the addon's .lua files, all but
data\zones, and again when the line runs). The window running off the screen (crop clipped). The
window still hidden on the last frame. --set creating tables.


How it works
------------

preview.py          CLI, Lua setup, hello_imgui run (hidden window, OpenGL), screenshot, crop.
all_tabs.py         runs preview.py once per tab, size and skin, and once per overlay scene.
overlay_scene.lua   sets up each overlay scene for --full --exec: Valkurm Dunes, a target, a /check
                    and the settings each scene needs.
imgui_bridge.py     Ashita GuiManager functions -> imgui_bundle, with Ashita's argument shapes.
imgui_bridge.lua    builds the GuiManager stand-in (unknown names raise
                    "imgui bridge: imgui.X is not implemented by the preview bridge"), wraps draw
                    lists, GetIO(), GetStyle(), GetMainViewport() and keeps each one it hands out
                    for the whole run, since one let go too soon read as the wrong object in about
                    one icon render in six. Then it loads Ashita's real
                    C:/Games/PhoenixXI/addons/libs/imgui.lua on top of it, like the game does. So
                    imgui.col32, FLT_MAX, ShowHelp and the ICON_FA globals are Ashita's own.
imgui_enums.py      exact C enum names from imgui_bundle's .pyi stubs ("# ImGuiCol_Text ... original
                    C++ signature" comments), so ResizeNS, DisplayRGB, COUNT come out right.
extract_ashita_fonts.py   pulls the fonts compiled into Ashita.dll (ImGui base85 + stb compressed):
                    Agave Regular and Font Awesome 7. preview.py runs it by itself if fonts/ is empty.

Everything else comes from ../mock_ashita.lua, loaded the same way ../run.py does, with the bridge
put in place of its recorded imgui. The settings the window edits are MOCK.settings.current
(settings.load(defaults.make()) with its chat colors fixed and the skin's window look filled in, like
checkmate.lua).

Default mode calls settings_window.draw(settings, addon.version) directly each frame, with the
version read from checkmate.lua. --full drives the whole addon instead.

ImGui starts from its default style plus StyleColorsDark, and hello_imgui's theme is undone before the
first frame. FontSizeBase is 18, the font scale and framebuffer scale are 1, and there's no ini file,
so every run is ImGui's first use of the window. The mouse sits off the screen, so nothing is
hovered, unless --mouse-icon puts it on an icon, and error recovery asserts are on. The background
behind the window is a dark blue-grey (19, 22, 26).


Enum values
-----------

Names come from Ashita's libs/imgui.lua. Values come from imgui_bundle, so a flag means the same
thing to the ImGui drawing the preview. They agree everywhere except ImGuiStyleVar: imgui_bundle's
ImGui carries an extra ImGuiStyleVar_LayoutAlign (its stack-layout patch) at 24, so TabRounding and
everything after it is one higher than in Ashita (Ashita TabRounding = 24, bundle 25). Mapping by name
handles that. An addon that pushed a style var by raw number would get the wrong var here.


Bindings still needing an in-game check
--------------------------------------

Checked against annotations/SDK/IGuiManager.lua, but not against Ashita's C++ binding, which isn't
available:

- Begin / BeginTabItem / BeginPopupModal given a boolean instead of a table: treated as no close
  button. A table { bool } gets a close button and is set false when clicked.
- Out-param tables are written back only when ImGui reports a change.
- GetColorU32(number): a number below ImGuiCol_COUNT is a color index, anything else a packed color.
  The packed color is worked out in Python with ImGui's own formula, because imgui_bundle binds an
  ImU32 below 2^31 to its ImGuiCol overload, which reads out of bounds.
- Combo(label, { index }, items, count): the index is ImGui's 0-based one, items a Lua array.
- Text / labels given a number are converted like Lua's tostring (%.14g for non-integers).
- Text, TextColored, TextDisabled, TextWrapped, SetTooltip...: never printf-formatted ("100%" draws
  as is), matching Ashita's "Renders an unformatted text string".
- InputText's buffer size isn't used, since imgui_bundle grows the text as needed. In game the size
  caps what you can type. Whether it counts the end byte isn't known.
- Slider formats go to ImGui as they are, so one with no %d (the Drops tab's "All") draws as plain
  text.
- PushFont(font) with no size passes 0 (1.92: keep the current size).
- AddFontFromFileTTF(path, size) adds the font to imgui_bundle's atlas and returns it. imgui_bundle's
  OpenGL backend updates the atlas at any time, even mid-frame. Adding a font in the middle of a frame
  can crash the game, which is why checkmate only loads fonts on its load event.
- Packed colors are masked to 32 bits (LuaJIT bit ops return them negative).
- BeginChild with a boolean child_flags is rejected on purpose (untested with the 1.92 binding).


Known gaps
----------

- Ashita's own default ImGui style isn't known. ImGui's default dark style is assumed. checkmate
  pushes nearly every color and the spacing it cares about, so this only shows in things it doesn't
  push (ItemInnerSpacing, ScrollbarSize, IndentSpacing...).
- Input is limited to --mouse-icon and --mouse-text hovering overlay items, plus forced --scroll.
  Buttons are not pressed or dragged, so the tips behind each (?), open combos and the resize grip
  highlight are not exercised. IsItemDeactivatedAfterEdit and the like are always false.
- Font rasterizing is imgui_bundle's (stb_truetype, OpenGL). The game draws through Direct3D 8 via
  dgVoodoo, so edge anti-aliasing can differ slightly. Glyph metrics and layout are the same font.
- Keep --size at 1600 1200 or bigger. On a 1000 x 1000 screen the hidden window's framebuffer
  doesn't line up with ImGui's pixels, and text in some table rows comes out split by a blank
  pixel row even though ImGui places it on whole pixels.
- Keep --size within the monitor too. Windows won't make the hidden window taller than the monitor
  allows, and the screenshot of a taller --size comes back shrunk, with thin lines under text and
  swatches. The run warns when that happens.
- Give --size an odd height when the window reaches the middle of the screen. The screenshot of an
  even-height screen comes back with its two middle rows swapped, which draws a line under text on
  those rows. The run warns when the window covers them. The default 1600 x 1200 screen is even, but
  a window at its default size ends above the middle.
- The game screen size is whatever --size says. The real one is the player's resolution.
- These aren't bridged, and calling one raises the clear error: callbacks (size constraints, InputText),
  multi-select, drag and drop, docking, plots, images, ListBox(), Value(), logging, clipboard, ini
  functions, and draw-list calls other than AddLine, AddRect, AddRectFilled, AddRectFilledMultiColor,
  AddCircle(Filled), AddTriangleFilled, AddQuadFilled, AddText, AddImage and Push/PopClipRect.
  AddImage draws a grey box with a cross where a game picture would go, since the preview has no game
  art and never uses any.
- GetStyle().Colors[...] isn't bridged (imgui_bundle has no plain colors array). Use
  GetStyleColorVec4. io.Fonts methods aren't bridged either.

Weapon damage
-------------

The fixed Weapons scene checks the real printout, overlay and hover layout with mocked target data.
It uses a 28-pixel font, a narrow wrap setting and no pictures:

  python preview.py --full --size 1200 901 --frames 40 --window checkmate_overlay --mouse-text Hand-to-hand --exec "dofile(ADDON_DIR .. '/../tests/preview/weapon_scene.lua')" --out weapons.png

Each type stays with its signed percentage. A whole entry can be wider than the wrap setting,
just like other unbroken overlay entries. Remove --mouse-text to capture only the wrapped lines.
The offline image bridge still uses placeholders for all loaded pictures, including the bundled
BG Wiki PNGs. The no-picture scene verifies the full text and tooltip fallback, not Direct3D.

Monster, search and undo
------------------------

expansion_scene.lua supplies fixed Monster data and four settings states: monster (normal settings),
search (Show script warning highlighted), details_search (Blue Magic notes filtered by eligible), and
undo (a saved profile just deleted). Use these without --full for settings previews. Choose the Monster,
Weaknesses, Monster or Profiles tab to match. The overlay scene uses --full and --mouse-text "HP ~" to
check full notes on wrapped text with icons off. Every scene uses mocked game state.

  python preview.py --tab Monster --exec "dofile(ADDON_DIR .. '/../tests/preview/expansion_scene.lua')('monster')" --out monster.png
  python preview.py --tab Weaknesses --frames 10 --exec "dofile(ADDON_DIR .. '/../tests/preview/expansion_scene.lua')('search')" --out search.png
  python preview.py --tab Monster --set look.font_size=24 --exec "dofile(ADDON_DIR .. '/../tests/preview/expansion_scene.lua')('details_search')" --out details.png
  python preview.py --tab Profiles --exec "dofile(ADDON_DIR .. '/../tests/preview/expansion_scene.lua')('undo')" --out undo.png
  python preview.py --full --window checkmate_overlay --size 1200 901 --frames 40 --mouse-text "HP ~" --exec "dofile(ADDON_DIR .. '/../tests/preview/expansion_scene.lua')('overlay')" --out monster_hover.png

On a small screen, the tab bar scrolls so every tab stays reachable at a large font size. Target
details uses normal window scrolling, and Copy details includes enabled sections hidden by a filter or
collapsed heading.

Settings page scrolling
-----------------------

The settings window keeps its search and wrapping navigation above a scrolling child page.
--scroll moves that page, so end-of-page previews keep the header visible. Appearance and
Abbreviations groups can fold closed; a search opens them until it is cleared.
