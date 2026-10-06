"""
Renders every tab of checkmate's settings window to ../out/ with preview.py. README.txt lists the
files it writes.

    python all_tabs.py

Each render runs preview.py in its own process. The exit code is 1 when any render failed.
"""
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(os.path.dirname(HERE), 'out')
PREVIEW = os.path.join(HERE, 'preview.py')

TABS = ['Printout', 'Colors', 'Numbers', 'Aggro', 'Magic', 'Drops', 'Immunities', 'Look', 'Profiles']
SKINS = ['phoenix', 'classic', 'minimal', 'contrast', 'ember', 'colorblind']

# The window's smallest width and default height, and the tallest window the screen holds. A screen
# taller than the monitor allows gets its screenshot shrunk, so these stay at 1359. Its height is odd,
# since the screenshot of an even-height screen swaps its two middle rows.
NARROW = ['--window-size', '700', '560']
FULL = ['--size', '1600', '1359', '--window-size', '720', '1300']

# Tabs too tall for the screen, at 18 or 24 px, and a scroll past their bottom (ImGui stops at the end).
TALL = ['Printout', 'Colors', 'Look']
TO_THE_END = ['--scroll', '100000']

# The full height at the smallest width. At 24 px the smallest width is 933.
FULL_NARROW = ['--size', '1600', '1359', '--window-size', '700', '1300']

# The tabs whose sections sit side by side in a wide window, and the narrowest window that does it: two
# 480 px columns 24 apart and 44 for the window's edges, at 18 px and at 24 px. The screen for 24 px is
# wider so the whole window fits.
WIDE_TABS = ['Printout', 'Colors', 'Numbers', 'Aggro', 'Magic', 'Drops', 'Look', 'Profiles']
WIDE = ['--size', '1600', '1359', '--window-size', '1028', '1300']
WIDE_24 = ['--size', '1500', '1359', '--window-size', '1348', '1300']


def font(name, size):
    """A Windows font at a size. Every font loads before the first frame, the way checkmate's load event does it."""
    return ['--set', 'look.font=%s' % name, '--set', 'look.font_size=%d' % size,
            '--exec', "require('ui.window_font').load_all()"]


# Segoe UI picked in a folder without it.
MISSING_FONT = ['--set', 'look.font=segoeui', '--exec', "local f = require('ui.window_font'); "
                "f.FOLDER = 'C:/checkmate_no_fonts_here/'; f.load_all()"]

# Three saved profiles, one job link and one link to a profile that's gone.
PROFILES = ("local p = require('ui.profiles'); p.save(settings, 'Solo BLM'); p.save(settings, 'Party healer'); "
            "p.save(settings, 'Farming TH'); settings.job_links.BLM = 'Solo BLM'; settings.job_links.WHM = 'Old one'")


def renders():
    for tab in TABS:
        yield tab + '.png', ['--tab', tab]
        yield tab + '_full.png', ['--tab', tab] + FULL
        yield tab + '_narrow.png', ['--tab', tab] + NARROW
        if tab in TALL:
            yield tab + '_end.png', ['--tab', tab] + FULL + TO_THE_END
        yield 'font_24_%s.png' % tab, ['--tab', tab] + FULL_NARROW + font('verdana', 24)
        if tab in TALL:
            yield 'font_24_%s_end.png' % tab, ['--tab', tab] + FULL_NARROW + TO_THE_END + font('verdana', 24)
        if tab in WIDE_TABS:
            yield tab + '_wide.png', ['--tab', tab] + WIDE
            yield 'font_24_%s_wide.png' % tab, ['--tab', tab] + WIDE_24 + font('verdana', 24)
    for skin in SKINS:
        yield 'skin_%s.png' % skin, ['--tab', 'Printout', '--exec', "require('ui.skins').apply(settings, '%s')" % skin]
    yield 'Profiles_saved.png', ['--tab', 'Profiles', '--exec', PROFILES]
    yield 'Drops_all.png', ['--tab', 'Drops', '--set', 'drops.max_items=0', '--set', 'drops.th=4']
    yield 'whole_addon.png', ['--full', '--tab', 'Printout']
    yield 'font_segoeui_16.png', ['--full', '--tab', 'Printout', '--set', 'look.font=segoeui', '--set', 'look.font_size=16']
    yield 'font_consolas_12.png', ['--tab', 'Printout'] + font('consolas', 12)
    yield 'font_missing.png', ['--tab', 'Look'] + MISSING_FONT


def main():
    os.makedirs(OUT, exist_ok=True)
    failed = 0
    for name, args in renders():
        result = subprocess.run([sys.executable, PREVIEW, '--out', os.path.join(OUT, name)] + args,
                                capture_output=True, text=True)
        line = result.stdout.strip().splitlines()[-1] if result.stdout.strip() else '(no output)'
        print('%-22s %s' % (name, line))
        for warning in result.stderr.strip().splitlines():
            print('    ' + warning)
        if result.returncode != 0:
            failed += 1
    print('\n%d renders failed.' % failed if failed else '\nEvery render worked.')
    return 1 if failed else 0


if __name__ == '__main__':
    sys.exit(main())
