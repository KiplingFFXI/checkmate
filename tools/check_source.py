"""Check addon tables and exporter behavior against one Phoenix revision."""
import argparse
import os
from pathlib import Path
import unittest

from export import source_parity, tree


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--repo', default=str(Path(__file__).resolve().parents[2] / 'Phoenix'))
    parser.add_argument('--ref', default='phoenix/live')
    parser.add_argument('--tree', help='read an already extracted source tree instead')
    args = parser.parse_args()
    folder = args.tree or tree.extract(args.repo, tree.resolve(args.repo, args.ref)[0])
    try:
        print(source_parity.check(folder), flush=True)
        os.environ['CHECKMATE_EFFECTS_TREE'] = folder
        os.environ['CHECKMATE_SOURCE_TREE'] = folder
        suite = unittest.defaultTestLoader.discover(str(Path(__file__).parent / 'tests'))
        return 0 if unittest.TextTestRunner(verbosity=2).run(suite).wasSuccessful() else 1
    finally:
        if not args.tree:
            tree.remove(folder)


if __name__ == '__main__':
    raise SystemExit(main())
