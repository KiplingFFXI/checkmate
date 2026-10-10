"""
Phoenix module YAML overlays, merged the way the server's modules/temp_patch/lsb-yaml.patch merges them.

A line in modules/init.txt names a data root when one of its path parts is `data`, or when it is a bare module
name (then the root is modules/<name>/data). Roots apply in file order, each file once. Each overlay is an
RFC 7396 merge patch: maps merge key by key, lists replace whole, and null deletes the key.
"""
import os

import yaml

LOADER = yaml.CSafeLoader


def load_yaml(path):
    with open(path, encoding='utf-8') as handle:
        return yaml.load(handle, Loader=LOADER)


def merge_patch(target, patch):
    if not isinstance(patch, dict):
        return patch
    target = dict(target) if isinstance(target, dict) else {}
    for key, value in patch.items():
        if value is None:
            target.pop(key, None)
        else:
            target[key] = merge_patch(target.get(key), value)
    return target


def init_entries(tree):
    entries = []
    with open(os.path.join(tree, 'modules', 'init.txt'), encoding='utf-8') as source_file:
        for line in source_file:
            entry = line.strip()
            if entry and not entry.startswith('#'):
                entries.append(entry.rstrip('/'))
    return entries


def data_roots(tree):
    roots = []
    for entry in init_entries(tree):
        parts = entry.split('/')
        if 'data' not in parts and len(parts) != 1:
            continue
        root = os.path.join(tree, 'modules', *parts)
        if 'data' not in parts:
            root = os.path.join(root, 'data')
        if root not in roots:
            roots.append(root)
    return roots


def overlay_files(roots, name):
    """Overlay files for one dataset name, such as zones/east_ronfaure/mobs, in merge order."""
    found = []
    for root in roots:
        path = os.path.join(root, name + '.yaml')
        if os.path.exists(path):
            found.append(path)
    return found


def load_merged(tree, roots, name):
    """The base data/<name>.yaml with every overlay merged over it."""
    return merge_overlays(load_yaml(os.path.join(tree, 'data', name + '.yaml')) or {}, roots, name)


def merge_overlays(document, roots, name):
    """Every overlay for name merged over document. document itself stays as it was."""
    for path in overlay_files(roots, name):
        patch = load_yaml(path) or {}
        for key, value in patch.items():
            # A null here would delete the whole block, which the server can't load.
            if value is None:
                raise RuntimeError('%s sets top-level %s to null' % (path, key))
        document = merge_patch(document, patch)
    return document
