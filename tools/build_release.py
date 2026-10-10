"""
Checks and zips the release files, then prints the zip's SHA-256.

    python tools\\build_release.py [--out FOLDER]

The zip is checkmate-<version>.zip, with the version from addon.version in checkmate\\checkmate.lua. It holds the
addon folder, under its own name, so checkmate.lua sits at checkmate/checkmate.lua inside it. The repo's LICENSE
goes in at checkmate/LICENSE, so every copy of the addon carries the license.
"""
import argparse
import hashlib
import os
from pathlib import Path
import re
import sys
import tempfile
import zipfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ADDON = os.path.join(ROOT, 'checkmate')
LICENSE = os.path.join(ROOT, 'LICENSE')

# The version line in the addon header, like addon.version = '1.0.0'.
VERSION_LINE = re.compile(r"^addon\.version\s*=\s*'([^']+)';", re.M)

# New runtime files or zones need an explicit entry before they can ship.
CORE = 'aggro blue_finder check_details checkparam dangers defenses diagnostics drops effects elements info lessons magic modifiers monsters packets parts pdif pet physical player printout steal target weapons wording'.split()
UI = 'blue_finder chat_colors defaults display history icons navigation overlay presets preview profiles search settings_window skins tips window_font'.split()
DATA = 'bands blue_finder crit defenses effects modifiers pdif pets spells steal too_weak'.split()
ZONES = (
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 27, 28, 29,
    30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 46, 47, 48, 51, 52, 54, 55, 56, 57, 58, 59,
    60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 72, 77, 79, 100, 101, 102, 103, 104, 105, 106, 107, 108,
    109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128,
    130, 134, 135, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 157,
    158, 159, 160, 161, 162, 163, 165, 166, 167, 168, 169, 170, 172, 173, 174, 176, 177, 178, 179, 180,
    181, 184, 185, 186, 187, 188, 190, 191, 192, 193, 194, 195, 196, 197, 198, 200, 201, 202, 203, 204,
    205, 206, 207, 208, 209, 211, 212, 213, 220, 221, 227, 228,
)
ASSETS = {'assets/weapons/' + name for name in ('Blunt.png', 'H2H.png', 'Piercingv2.png', 'Slashing.png', 'SOURCES.txt')}
# Keep the original images described in their source notice.
ASSET_HASHES = {
    'Blunt.png': 'f6016ff3a137eed9bbae68b4607cec64c819d537daaa576526ae00bfbab461eb',
    'H2H.png': 'd850b28ebfe4f208ce5b83c66e35d6aa800e26b956688b44d744f4d70ab94e7c',
    'Piercingv2.png': '87a94df056d653068bdb424d16893b5d1bb266d8621b9f38b7b4ad7a0e0d67da',
    'Slashing.png': '8f17f889075b3bc1acd20dbb9d7a0b8996a835a3b3db5c6e00ae04d2d7883527',
}
PUBLIC_DOCS = ('README.md', 'CHANGELOG.md', 'docs/GUIDE.md')
FILES = ({'checkmate.lua'} | {'core/%s.lua' % name for name in CORE} | {'ui/%s.lua' % name for name in UI}
         | {'data/%s.lua' % name for name in DATA} | {'data/zones/%d.lua' % zone for zone in ZONES} | ASSETS)
DIRECTORIES = {str(parent).replace('\\', '/') for name in FILES for parent in Path(name).parents if str(parent) != '.'}
PRIVATE_PATH = re.compile(r'(?i)(?:[a-z]:[\\/]+Users[\\/]+|/(?:home|Users)/)[^\s\x00\'"<>]+')
PRIVATE_MARKERS = re.compile(r'(?i)checkmate-context-recovery|[\\/]\.(?:claude|codex)[\\/]|'
                             r'-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----|'
                             r'\b(?:ghp_[a-zA-Z0-9]{30,}|github_pat_[a-zA-Z0-9_]{40,})\b')


def addon_version(addon=None):
    with open(os.path.join(addon or ADDON, 'checkmate.lua'), encoding='ascii') as handle:
        match = VERSION_LINE.search(handle.read())
    if not match:
        raise RuntimeError('checkmate.lua has no addon.version line.')
    if not re.fullmatch(r'\d+\.\d+\.\d+', match.group(1)):
        raise RuntimeError('addon.version must have three numeric parts.')
    return match.group(1)


def linked(path):
    return os.path.islink(path) or (hasattr(os.path, 'isjunction') and os.path.isjunction(path))


def addon_files(addon=None):
    """Reject extra or missing files before collecting the release manifest."""
    addon = Path(addon or ADDON)
    if linked(addon):
        raise RuntimeError('The addon folder must not be a linked path.')
    found = set()
    for folder, subfolders, names in os.walk(addon):
        subfolders.sort()
        for name in subfolders:
            path = Path(folder) / name
            relative = path.relative_to(addon).as_posix()
            if linked(path) or relative not in DIRECTORIES:
                raise RuntimeError('Unexpected or linked release folder: %s' % relative)
        for name in sorted(names):
            path = Path(folder) / name
            relative = path.relative_to(addon).as_posix()
            if linked(path) or relative not in FILES:
                raise RuntimeError('Unexpected or linked release file: %s' % relative)
            found.add(relative)
    missing = FILES - found
    if missing:
        raise RuntimeError('Release files are missing: %s' % ', '.join(sorted(missing)))
    return [(str(addon / name), 'checkmate/' + name) for name in sorted(found)]


def checked_bytes(source, name):
    if linked(source):
        raise RuntimeError('Linked release file: %s' % name)
    data = Path(source).read_bytes()
    if name.endswith('.png'):
        if data[:8] != b'\x89PNG\r\n\x1a\n' or data[12:16] != b'IHDR' or data[16:24] != b'\x00\x00\x00\x10' * 2:
            raise RuntimeError('Expected an original 16x16 PNG: %s' % name)
        expected = ASSET_HASHES.get(Path(name).name)
        if expected is None or hashlib.sha256(data).hexdigest() != expected:
            raise RuntimeError('Release image differs from its reviewed original: %s' % name)
    else:
        text = data.decode('utf-8')
        if PRIVATE_PATH.search(text) or PRIVATE_MARKERS.search(text):
            raise RuntimeError('Private path or credential marker in release file: %s' % name)
        data = data.replace(b'\r\n', b'\n')
    return data


def build(out, addon=None, license_path=None):
    addon = Path(addon or ADDON)
    out = Path(out)
    if out.resolve().is_relative_to(addon.resolve()):
        raise RuntimeError('Write release archives outside the addon folder.')
    files = [(license_path or LICENSE, 'checkmate/LICENSE')] + addon_files(addon)
    version = addon_version(addon)
    for name in PUBLIC_DOCS:
        document = addon.parent / name
        if document.exists() or linked(document):
            checked_bytes(document, name)
    out.mkdir(parents=True, exist_ok=True)
    path = out / ('checkmate-%s.zip' % version)
    temporary = None
    try:
        with tempfile.NamedTemporaryFile(prefix='.checkmate-', suffix='.zip', dir=out, delete=False) as handle:
            temporary = Path(handle.name)
        with zipfile.ZipFile(temporary, 'w', zipfile.ZIP_DEFLATED) as archive:
            for source, name in files:
                entry = zipfile.ZipInfo(name, date_time=(1980, 1, 1, 0, 0, 0))
                entry.create_system = 3
                entry.external_attr = 0o100644 << 16
                entry.compress_type = zipfile.ZIP_DEFLATED
                archive.writestr(entry, checked_bytes(source, name))
        with zipfile.ZipFile(temporary) as archive:
            bad = archive.testzip()
            if bad or archive.namelist() != [name for _, name in files]:
                raise RuntimeError('Release archive validation failed: %s' % (bad or 'file list'))
        os.replace(temporary, path)
    finally:
        if temporary is not None and temporary.exists():
            temporary.unlink()
    digest = hashlib.sha256(path.read_bytes()).hexdigest()
    return path, len(files), digest


def main():
    parser = argparse.ArgumentParser(description='Zip the checkmate addon folder for a release.')
    parser.add_argument('--out', default=os.path.join(ROOT, 'dist'), help='the folder to write the zip into')
    args = parser.parse_args()

    path, count, digest = build(args.out)
    print('Wrote %s with %d files, %.1f MB.' % (path, count, os.path.getsize(path) / 1048576.0))
    print('SHA-256 %s' % digest)


if __name__ == '__main__':
    sys.exit(main())
