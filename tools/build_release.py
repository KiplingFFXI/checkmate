"""
Zips the addon folder for a release and prints the zip's SHA-256.

    python tools\\build_release.py [--out FOLDER]

The zip is checkmate-<version>.zip, with the version from addon.version in checkmate\\checkmate.lua. It holds the
addon folder, under its own name, so checkmate.lua sits at checkmate/checkmate.lua inside it. The repo's LICENSE
goes in at checkmate/LICENSE, so every copy of the addon carries the license.
"""
import argparse
import hashlib
import os
import re
import sys
import zipfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ADDON = os.path.join(ROOT, 'checkmate')
LICENSE = os.path.join(ROOT, 'LICENSE')

# The version line in the addon header, like addon.version = '1.0.0'.
VERSION_LINE = re.compile(r"^addon\.version\s*=\s*'([^']+)';", re.M)


def addon_version():
    with open(os.path.join(ADDON, 'checkmate.lua'), encoding='ascii') as handle:
        match = VERSION_LINE.search(handle.read())
    if not match:
        raise RuntimeError('checkmate.lua has no addon.version line.')
    return match.group(1)


def addon_files():
    """(path on disk, path in the zip) for every file in the addon folder, folder by folder in name order."""
    files = []
    for folder, subfolders, names in os.walk(ADDON):
        subfolders.sort()
        for name in sorted(names):
            path = os.path.join(folder, name)
            files.append((path, os.path.relpath(path, ROOT).replace(os.sep, '/')))
    return files


def main():
    parser = argparse.ArgumentParser(description='Zip the checkmate addon folder for a release.')
    parser.add_argument('--out', default=os.path.join(ROOT, 'dist'), help='the folder to write the zip into')
    args = parser.parse_args()

    os.makedirs(args.out, exist_ok=True)
    path = os.path.join(args.out, 'checkmate-%s.zip' % addon_version())
    # The license sits at the top of the repo. The zip puts it in the addon folder.
    files = [(LICENSE, 'checkmate/LICENSE')] + addon_files()
    with zipfile.ZipFile(path, 'w', zipfile.ZIP_DEFLATED) as archive:
        for source, name in files:
            archive.write(source, name)
    with open(path, 'rb') as handle:
        digest = hashlib.sha256(handle.read()).hexdigest()
    print('Wrote %s with %d files, %.1f MB.' % (path, len(files), os.path.getsize(path) / 1048576.0))
    print('SHA-256 %s' % digest)


if __name__ == '__main__':
    sys.exit(main())
