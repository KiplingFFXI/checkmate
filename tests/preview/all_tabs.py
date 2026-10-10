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

TABS = ['Display', 'Numbers', 'Aggro', 'Magic', 'Blue Magic', 'Weaknesses', 'Pets', 'Monster', 'Drops', 'Effects', 'Abbreviations', 'Appearance', 'Profiles']
SKINS = ['phoenix', 'classic', 'minimal', 'contrast', 'ember', 'mint', 'lavender', 'colorblind']

# The minimum 18px window is560 wide; navigation wraps independently of the page.
NARROW = ['--window-size', '560', '560']
FULL = ['--size', '1600', '1359', '--window-size', '840', '1300']

# --scroll moves the page child while keeping search and navigation fixed.
TALL = ['Display', 'Abbreviations', 'Appearance']
TO_THE_END = ['--scroll', '100000']
FULL_NARROW = ['--size', '1600', '1359', '--window-size', '560', '1300']

# These widths allow two columns at 18 and 24px.
WIDE_TABS = ['Display', 'Numbers', 'Aggro', 'Weaknesses', 'Drops', 'Abbreviations', 'Appearance', 'Profiles']
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

# The overlay itself, run by the whole addon in one of overlay_scene.lua's scenes and cropped to the overlay.
OVERLAY_SCENE = os.path.join(HERE, 'overlay_scene.lua').replace('\\', '/')
OVERLAY_SCENES = ['sample', 'before', 'after', 'nm', 'nodata', 'links', 'nowrap', 'no_background', 'no_border',
                  'verdana_24', 'ashita_12', 'crit_magic', 'shift', 'icons', 'icons_badges', 'icons_only', 'icons_off',
                  'icons_12', 'icons_24', 'job', 'job_icons_only', 'effects', 'effects_only', 'effects_off',
                  'effects_wrap', 'effects_12', 'effects_24']


def overlay(scene):
    return ['--full', '--window', 'checkmate_overlay', '--exec', "dofile('%s')('%s')" % (OVERLAY_SCENE, scene)]


# The overlay with the mouse resting on its first icon, so its tip shows. The wait is 9 frames at the preview's 60 a
# second, and the crop takes the tip in.
TIP_SCENES = ['tip_element', 'tip_school', 'tip_drop', 'tip_steal', 'tip_immunity', 'tip_job', 'tip_effect', 'tip_12',
              'tip_24'] + ['tip_skin_' + skin for skin in SKINS]
TIP = ['--mouse-icon', '1', '--frames', '20']


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
        yield 'skin_%s.png' % skin, ['--tab', 'Display', '--exec', "require('ui.skins').apply(settings, '%s')" % skin]
    yield 'Profiles_saved.png', ['--tab', 'Profiles', '--exec', PROFILES]
    yield 'Drops_all.png', ['--tab', 'Drops', '--set', 'drops.max_items=0', '--set', 'drops.th=4']
    yield 'whole_addon.png', ['--full', '--tab', 'Display']
    yield 'font_segoeui_16.png', ['--full', '--tab', 'Display', '--set', 'look.font=segoeui', '--set', 'look.font_size=16']
    yield 'font_consolas_12.png', ['--tab', 'Display'] + font('consolas', 12)
    yield 'font_ashita_24.png', ['--tab', 'Display'] + NARROW + font('ashita', 24)
    yield 'font_missing.png', ['--tab', 'Appearance'] + MISSING_FONT
    for scene in OVERLAY_SCENES:
        yield 'overlay_%s.png' % scene, overlay(scene)
    for skin in SKINS:
        yield 'overlay_%s.png' % skin, overlay('skin_' + skin)
    for skin in SKINS:
        yield 'overlay_badges_%s.png' % skin, overlay('badges_' + skin)
    for scene in TIP_SCENES:
        yield 'overlay_%s.png' % scene, overlay(scene) + TIP


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
