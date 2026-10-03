"""
Copies the Phoenix source at one commit into a fresh temporary folder.

The exporter only reads that copy. It never checks anything out or writes inside the Phoenix repo.
"""
import shutil
import subprocess
import tarfile
import tempfile

# The parts of the Phoenix source the exporter reads.
TREE_PATHS = [
    'data',
    'modules',
    'scripts/zones',
    'scripts/mixins',
    'scripts/globals',
    'scripts/battlefields',
    'scripts/data/experience_table.lua',
    'scripts/enum/mob_difficulty.lua',
    'scripts/enum/trait.lua',
    'settings/default/map.lua',
    'sql',
    'src/map/utils/mobutils.cpp',
    # Zone regions.yaml files are about 55 MB and the exporter never reads them.
    ':(exclude)data/zones/*/regions.yaml',
]


def git(repo, *args):
    return subprocess.check_output(['git', '-C', repo] + list(args), text=True).strip()


def resolve(repo, ref):
    """Returns the full and short commit hash the ref points at."""
    full = git(repo, 'rev-parse', '--verify', ref + '^{commit}')
    short = git(repo, 'rev-parse', '--short=10', full)
    return full, short


def extract(repo, commit):
    """Unpacks the commit into a new temp folder and returns its path."""
    folder = tempfile.mkdtemp(prefix='checkmate_tree_')
    proc = subprocess.Popen(['git', '-C', repo, 'archive', '--format=tar', commit] + TREE_PATHS,
                            stdout=subprocess.PIPE)
    with tarfile.open(fileobj=proc.stdout, mode='r|') as archive:
        archive.extractall(folder, filter='data')
    if proc.wait() != 0:
        shutil.rmtree(folder, ignore_errors=True)
        raise RuntimeError('git archive failed for %s' % commit)
    return folder


def remove(folder):
    shutil.rmtree(folder, ignore_errors=True)
