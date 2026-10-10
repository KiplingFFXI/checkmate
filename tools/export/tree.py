"""
Copies the Phoenix source at one commit into a fresh temporary folder.

The exporter only reads that copy. It never checks anything out or writes inside the Phoenix repo.
"""
import shutil
from pathlib import Path
import subprocess
import tarfile
import tempfile

# The parts of the Phoenix source the exporter reads.
TREE_PATHS = [
    'data',
    'modules',
    # Every script but the tests, specs and GM commands, since the steal, job and crit checks read them all.
    'scripts',
    ':(exclude)scripts/tests',
    ':(exclude)scripts/specs',
    ':(exclude)scripts/commands',
    'settings/default/map.lua',
    'settings/default/main.lua',
    'src/common/xirand.h',
    'sql',
    'src/map/utils/mobutils.cpp',
    'src/map/utils/petutils.cpp',
    'src/map/utils/petutils.h',
    'src/map/utils/battleutils.cpp',
    'src/map/utils/battleutils.h',
    'src/map/entities/battle_entity.cpp',
    'src/map/entities/mob_entity.cpp',
    'src/map/grades.cpp',
    'src/map/instance_loader.cpp',
    'src/map/ai/controllers/mob_controller.cpp',
    'src/map/ai/states/magic_state.cpp',
    'src/map/ai/states/item_state.cpp',
    'src/map/ai/helpers/targetfind.cpp',
    'src/map/status_effect_container.cpp',
    'src/map/action/action.cpp',
    'src/map/packets/s2c/0x028_battle2.cpp',
    'src/map/action/interrupts.cpp',
    'src/map/enums/action/category.h',
    'src/map/data/shared_types/mob_attributes/dataset.cpp',
    'src/map/lua/lua_base_entity.cpp',
    'src/map/lua/luautils.cpp',
    'src/map/spawn_handler.cpp',
    'src/map/utils/blueutils.cpp',
    'src/map/spell.cpp',
    'src/map/mobskill.cpp',
    'src/map/mob_spell_list.cpp',
    'src/map/utils/zoneutils.cpp',
    'src/map/attackround.cpp',
    'src/map/attack.cpp',
    'src/map/utils/attackutils.cpp',
    'src/map/utils/charutils.cpp',
    'src/map/status_effect_container.h',
    'src/map/lua/lua_item.cpp',
    'src/map/items/item_equipment.cpp',
    'src/map/utils/itemutils.cpp',
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
    proc = None
    try:
        proc = subprocess.Popen(['git', '-C', repo, 'archive', '--format=tar', commit] + TREE_PATHS,
                                stdout=subprocess.PIPE)
        with tarfile.open(fileobj=proc.stdout, mode='r|') as archive:
            archive.extractall(folder, filter='data')
        # Drain git's padding so it can finish writing before wait().
        proc.stdout.read()
        if proc.wait() != 0:
            raise RuntimeError('git archive failed for %s' % commit)
        return folder
    except BaseException:
        if proc is not None and proc.poll() is None:
            proc.kill()
            proc.wait()
        remove(folder)
        raise
    finally:
        if proc is not None and proc.stdout is not None:
            proc.stdout.close()


def remove(folder):
    path = Path(folder).resolve()
    if path.parent != Path(tempfile.gettempdir()).resolve() or not path.name.startswith('checkmate_tree_'):
        raise RuntimeError('Refusing to remove a folder outside the exporter temporary directory.')
    shutil.rmtree(path, ignore_errors=True)
