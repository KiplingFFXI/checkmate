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

  <Tab>.png          the window at its default size (720 x 560), as it first opens
  <Tab>_full.png     the window 1300 tall on a 1600 x 1359 screen, so most tabs show whole
  <Tab>_narrow.png   the window at its smallest width (700)
  <Tab>_end.png      the same as _full, scrolled to the bottom, for the tabs taller than that
                     (Printout, Colors, Look)
  <Tab>_wide.png     the window 1028 wide, just wide enough for two columns, 1300 tall, for the
                     tabs with sections (all but Immunities)
  skin_<id>.png      the Printout tab in each skin
  Profiles_saved.png the Profiles tab with three saved profiles and two job links, one of them to a
                     profile that's gone
  Drops_all.png      the Drops tab showing every item, at Treasure Hunter 4
  whole_addon.png    the window drawn by the whole addon (checkmate.lua, /checkmate, then frames)
  font_segoeui_16.png   the whole addon with Segoe UI at 16 px. checkmate's own load event loads the font
  font_consolas_12.png  the Printout tab in Consolas at 12 px, the smallest size
  font_24_<Tab>.png     every tab in Verdana, the widest font, at 24 px, the biggest size, full height
                        at the smallest width that size allows (933), and _end for the tall tabs
  font_24_<Tab>_wide.png  the same at 1348 wide, just wide enough for two columns at 24 px
  font_missing.png      the Look tab after picking Segoe UI from a folder without it

The Windows fonts come from C:\Windows\Fonts, loaded with the addon's own ui\window_font.lua.

It prints preview.py's line for each and exits with 1 when any render failed.


Usage
-----

  python preview.py --out <png> [options]

  --addon DIR          folder with checkmate.lua, ui/, core/ (read only, never written).
                       Defaults to ../../checkmate.
  --out PNG            where the PNG goes (not written when the run fails)
  --tab NAME           tab to show, matched to the visible tab label, any case ("Printout", "Look").
                       Sent as ImGuiTabItemFlags_SetSelected until that tab opens. The run fails if
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
                       watched for "Stopped after an error".
  --exec LUA           Lua run after the settings load and --set, before the first frame.
                       `settings` is the settings table. Repeatable. For example
                       --exec "require('ui.skins').apply(settings, 'ember')".
  --script LUA_FILE    draw this Lua file instead of the settings window (the addon still loads, so
                       require('ui.skins') and the rest work). The file returns a function called once per
                       frame. It can call PREVIEW.log(...) and read PREVIEW.frame / PREVIEW.last_frame.
                       The last frame's log lines go to stderr as "log: ...". Use --window to pick
                       the window to crop to.
  --font PATH          default ImGui font (default: fonts/Agave_Regular.ttf, Ashita's own)
  --font-size PX       default font size, default 18 (Ashita's)

Examples

  python preview.py --tab Printout --out printout.png
  python preview.py --tab Look --out look.png --exec "require('ui.skins').apply(settings, 'classic')"
  python preview.py --tab Profiles --out wide.png --window-size 900 480
  python preview.py --tab Drops --out small_screen.png --size 1280 720


Output
------

stdout is one line:

  OK window='checkmate##settings' pos=(120,20) size=720x560 content=677x893 scrollbar=y tab=Printout
     screen=1600x1200 frames=4 font=Agave_Regular.ttf crop=(110, 10, 850, 590) out=printout.png

  size     the window's outer size on the last frame
  content  ImGui's content size (what the cursor reached, without padding and decorations)
  scrollbar=y / x   shown when the window has a scrollbar
  tab      the tab(s) whose BeginTabItem returned true on the last frame
  loaded=FILE@SIZE  each font the addon loaded with AddFontFromFileTTF, and the size it loaded at
  warnings=N        count of warnings, each printed on stderr as "warning: ..."

On failure the line starts with FAIL, ends with "error: <first error>" (the rest are on stderr as
"error: ..."), no PNG is written and the exit code is 1 (2 for a missing addon folder).
A run fails on a Lua error in the addon, an ImGui assert (IM_ASSERT, raised by imgui_bundle), a call
to an imgui function the bridge doesn't have, a bad argument shape (like Checkbox given true instead
of { true }), ImGui stacks left unbalanced by the draw (Push without Pop), --tab never opening, and in
--full mode checkmate reporting "Stopped after an error".
These only warn, and the exit code stays 0. An ImGui constant the addon names that Ashita's
libs/imgui.lua doesn't define (nil in game, found by scanning the addon's .lua files, all but
data\zones, and again when the line runs). The window running off the screen (crop clipped). The
window still hidden on the last frame. --set creating tables.


How it works
------------

preview.py          CLI, Lua setup, hello_imgui run (hidden window, OpenGL), screenshot, crop.
all_tabs.py         runs preview.py once per tab, size and skin.
imgui_bridge.py     Ashita GuiManager functions -> imgui_bundle, with Ashita's argument shapes.
imgui_bridge.lua    builds the GuiManager stand-in (unknown names raise
                    "imgui bridge: imgui.X is not implemented by the preview bridge"), wraps draw
                    lists, GetIO(), GetStyle(), GetMainViewport(), then loads Ashita's real
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
hovered, and error recovery asserts are on. The background behind the window is a dark blue-grey
(19, 22, 26).


Enum values
-----------

Names come from Ashita's libs/imgui.lua. Values come from imgui_bundle, so a flag means the same
thing to the ImGui drawing the preview. They agree everywhere except ImGuiStyleVar: imgui_bundle's
ImGui carries an extra ImGuiStyleVar_LayoutAlign (its stack-layout patch) at 24, so TabRounding and
everything after it is one higher than in Ashita (Ashita TabRounding = 24, bundle 25). Mapping by name
handles that. An addon that pushed a style var by raw number would get the wrong var here.


Binding semantics that are guesses
----------------------------------

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
- There's no input. Nothing is hovered, pressed or dragged, so hover colors, the tips behind each (?),
  open combos and the resize grip highlight never show. IsItemDeactivatedAfterEdit and the like are
  always false.
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
  AddCircle(Filled), AddTriangleFilled, AddQuadFilled, AddText and Push/PopClipRect.
- GetStyle().Colors[...] isn't bridged (imgui_bundle has no plain colors array). Use
  GetStyleColorVec4. io.Fonts methods aren't bridged either.
