"""Stage a complete data export and keep the previous output until promotion succeeds."""
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import stat
import warnings


GENERATED = frozenset({
    'bands.lua', 'too_weak.lua', 'pets.lua', 'steal.lua', 'crit.lua', 'effects.lua',
    'modifiers.lua', 'job_settings.lua', 'pdif.lua', 'defenses.lua', 'merits.lua', 'blue_finder.lua',
})
ZONE_FILE = re.compile(r'[0-9]+\.lua\Z', re.ASCII)
LOCK_FOLDER = Path.home() / '.cache' / 'checkmate' / 'export-locks'


def plain_path(path):
    """Reject links, junctions and special files before using a path."""
    path = Path(path)
    for part in reversed((path,) + tuple(path.parents)):
        try:
            info = part.lstat()
        except FileNotFoundError:
            continue
        if stat.S_ISLNK(info.st_mode) or getattr(info, 'st_file_attributes', 0) & 0x400:
            raise RuntimeError('Export paths cannot contain links or junctions: %s' % part)
        if not (stat.S_ISDIR(info.st_mode) or stat.S_ISREG(info.st_mode)):
            raise RuntimeError('Export paths must be regular files or directories: %s' % part)
    return path


def plain_tree(path):
    """Check every copied or removed entry, including ambiguous case spellings."""
    path = plain_path(path)
    if not path.is_dir():
        raise RuntimeError('Expected an export directory: %s' % path)
    for parent, directories, files in os.walk(path, followlinks=False):
        seen = {}
        for name in directories + files:
            if name.casefold() in seen:
                raise RuntimeError('Export entries differ only by case: %s and %s' % (seen[name.casefold()], name))
            seen[name.casefold()] = name
            plain_path(Path(parent) / name)


def remove_inside(path, folder):
    """Only remove a checked child of this transaction folder."""
    path, folder = plain_path(path), plain_path(folder)
    if not path.resolve().is_relative_to(folder.resolve()) or path.resolve() == folder.resolve():
        raise RuntimeError('Refusing to remove a path outside the export transaction.')
    if path.is_dir():
        plain_tree(path)
        shutil.rmtree(path)
    elif path.exists():
        path.unlink()


def generated_spelling(folder):
    expected = {name.casefold(): name for name in GENERATED | {'zones', 'spells.lua'}}
    for child in folder.iterdir():
        canonical = expected.get(child.name.casefold())
        if canonical is not None and child.name != canonical:
            raise RuntimeError('An export path has a different case spelling: %s' % child)
    zones = folder / 'zones'
    if zones.is_dir():
        for child in zones.iterdir():
            if ZONE_FILE.fullmatch(child.name.casefold()) and not ZONE_FILE.fullmatch(child.name):
                raise RuntimeError('A zone output has a different case spelling: %s' % child)


def fingerprint(folder):
    """Include file bytes and every directory, including empty manual folders."""
    if not folder.exists():
        return None
    plain_tree(folder)
    entries = []
    for path in sorted(folder.rglob('*')):
        name = path.relative_to(folder).as_posix()
        if path.is_dir():
            entries.append((name, None))
        else:
            with path.open('rb') as stream:
                digest = hashlib.file_digest(stream, 'sha256').hexdigest()
            entries.append((name, digest))
    return entries


def tree_digest(entries):
    if entries is None:
        return None
    return hashlib.sha256(json.dumps(entries, separators=(',', ':')).encode('ascii')).hexdigest()


class Output:
    def __init__(self, out, source):
        self.out = Path(os.path.abspath(os.fspath(out)))
        self.source = Path(source).resolve()
        self.folder = self.out.parent / ('.' + self.out.name + '.checkmate-export')
        self.stage = self.folder / 'new'
        self.previous = self.folder / 'previous'
        self.discard = self.folder / 'discard'
        self.state = self.folder / 'state.json'
        self.lock = None
        self.committed = False
        self.original = None
        self.candidate = None

    def _destination(self):
        plain_path(self.out)
        if self.out == self.out.parent or Path(__file__).resolve().is_relative_to(self.out):
            raise RuntimeError('The export output cannot be a filesystem root or contain the exporter.')
        if self.out.is_relative_to(self.source) or self.source.is_relative_to(self.out):
            raise RuntimeError('The export output must be separate from the source tree.')
        lock_folder = Path(os.path.abspath(LOCK_FOLDER))
        if self.out.is_relative_to(lock_folder) or lock_folder.is_relative_to(self.out):
            raise RuntimeError('The export output must be separate from the export lock cache.')
        if self.folder.is_relative_to(self.source) or self.source.is_relative_to(self.folder):
            raise RuntimeError('The source tree overlaps the export transaction folder.')
        if self.out.exists() and not self.out.is_dir():
            raise RuntimeError('The export output is not a directory: %s' % self.out)
        self.out.parent.mkdir(parents=True, exist_ok=True)
        plain_path(self.out.parent)
        for entry in self.out.parent.iterdir():
            if entry.name.casefold() == self.out.name.casefold() and entry.name != self.out.name:
                raise RuntimeError('The export output has a different case spelling: %s' % entry)
        if self.out.exists():
            plain_tree(self.out)
            generated_spelling(self.out)

    def _lock(self):
        # Keep lock files outside the addon. They stay in place so open handles always refer to the same lock.
        folder = LOCK_FOLDER
        plain_path(folder)
        folder.mkdir(parents=True, exist_ok=True)
        key = os.path.normcase(str(self.out.resolve())).encode('utf-8')
        path = folder / (hashlib.sha256(key).hexdigest() + '.lock')
        plain_path(path)
        descriptor = os.open(path, os.O_RDWR | os.O_CREAT | getattr(os, 'O_NOFOLLOW', 0), 0o600)
        self.lock = os.fdopen(descriptor, 'r+b', buffering=0)
        try:
            if os.name == 'nt':
                import msvcrt
                if os.fstat(self.lock.fileno()).st_size == 0:
                    self.lock.write(b'\0')
                self.lock.seek(0)
                msvcrt.locking(self.lock.fileno(), msvcrt.LK_NBLCK, 1)
            else:
                import fcntl
                fcntl.flock(self.lock.fileno(), fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BaseException as error:
            self.lock.close()
            self.lock = None
            if isinstance(error, OSError):
                raise RuntimeError('Another export is using this output: %s' % self.out) from error
            raise

    def _close_lock(self):
        if self.lock is not None:
            # Closing the handle releases the OS lock, including after a killed process.
            self.lock.close()
            self.lock = None

    def _write_state(self, phase, had_output):
        temporary = self.folder / 'state.tmp'
        with temporary.open('w', encoding='ascii', newline='\n') as stream:
            json.dump({'version': 1, 'phase': phase, 'had_output': had_output, 'candidate': self.candidate}, stream)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, self.state)

    def _rename(self, source, target):
        plain_path(source)
        plain_path(target)
        allowed = {self.out, self.stage, self.previous, self.discard}
        if source not in allowed or target not in allowed:
            raise RuntimeError('Refusing to rename a path outside the export transaction.')
        os.replace(source, target)

    def _recover(self):
        if not self.folder.exists():
            return
        plain_tree(self.folder)
        if any(child.name not in {'new', 'previous', 'discard', 'state.json', 'state.tmp'}
               for child in self.folder.iterdir()):
            raise RuntimeError('Unexpected files in the export transaction: %s' % self.folder)
        for child in self.folder.iterdir():
            directory = child.name in {'new', 'previous', 'discard'}
            if directory != child.is_dir():
                raise RuntimeError('Invalid export recovery entry: %s' % child)
        journal = None
        if self.state.exists():
            if self.state.stat().st_size > 1024:
                raise RuntimeError('Invalid export recovery journal: %s' % self.state)
            try:
                journal = json.loads(self.state.read_text(encoding='ascii'))
            except (ValueError, UnicodeError) as error:
                raise RuntimeError('Invalid export recovery journal: %s' % self.state) from error
            if (not isinstance(journal, dict) or set(journal) != {'version', 'phase', 'had_output', 'candidate'}
                    or type(journal['version']) is not int or journal['version'] != 1
                    or type(journal['phase']) is not str
                    or journal['phase'] not in {'building', 'prepared', 'committed'}
                    or type(journal['had_output']) is not bool):
                raise RuntimeError('Invalid export recovery journal: %s' % self.state)
            if ((journal['phase'] == 'building' and journal['candidate'] is not None)
                    or (journal['phase'] != 'building' and (type(journal['candidate']) is not str
                        or re.fullmatch(r'[0-9a-f]{64}', journal['candidate']) is None))):
                raise RuntimeError('Invalid export candidate digest: %s' % self.state)
        if (journal is not None and journal['phase'] == 'prepared' and self.out.exists()
                and (self.previous.exists() or not journal['had_output'])):
            # A remaining stage means its rename never succeeded, so this output is not ours.
            # Once installed, its digest must still match before recovery can move or remove it.
            if self.stage.exists() or tree_digest(fingerprint(self.out)) != journal['candidate']:
                raise RuntimeError('The interrupted export output has changed. Current output and transaction files '
                                   'were kept for review: %s and %s' % (self.out, self.folder))
        if journal is None:
            if self.previous.exists() or self.discard.exists() or self.stage.exists():
                raise RuntimeError('An export folder has no recovery journal: %s' % self.folder)
        elif journal['phase'] == 'building':
            if self.previous.exists() or self.discard.exists():
                raise RuntimeError('An unfinished build has an unexpected backup: %s' % self.folder)
        elif journal['phase'] == 'committed':
            if not self.out.is_dir():
                raise RuntimeError('The completed export is missing; previous output remains at %s' % self.previous)
            if not journal['had_output'] and self.previous.exists():
                raise RuntimeError('Unexpected previous output in the export transaction: %s' % self.previous)
        elif journal['had_output']:
            if self.previous.exists():
                if self.out.exists():
                    if self.discard.exists():
                        raise RuntimeError('Export recovery needs review: %s' % self.folder)
                    self._rename(self.out, self.discard)
                self._rename(self.previous, self.out)
            elif not self.out.is_dir():
                raise RuntimeError('The previous export and its backup are missing: %s' % self.folder)
        elif self.previous.exists():
            raise RuntimeError('Unexpected previous output in the export transaction: %s' % self.previous)
        elif self.out.exists():
            if self.discard.exists():
                raise RuntimeError('Export recovery needs review: %s' % self.folder)
            self._rename(self.out, self.discard)
        for path in (self.stage, self.previous, self.discard, self.folder / 'state.tmp'):
            remove_inside(path, self.folder)
        # Remove the journal last. An interrupted cleanup can be repeated on the next run.
        if self.state.exists():
            self.state.unlink()
        self.folder.rmdir()

    def __enter__(self):
        try:
            self._destination()
            self._lock()
            self._destination()
            self._recover()
            self.original = fingerprint(self.out)
            self.folder.mkdir()
            self._write_state('building', self.out.exists())
            if self.out.exists():
                shutil.copytree(self.out, self.stage, copy_function=shutil.copy2)
            else:
                self.stage.mkdir()
            if (fingerprint(self.out) != self.original
                    or (self.original is not None and fingerprint(self.stage) != self.original)):
                raise RuntimeError('The export output changed while it was being copied; no files were replaced.')
            plain_tree(self.stage)
            for name in GENERATED:
                path = self.stage / name
                if path.exists():
                    if not path.is_file():
                        raise RuntimeError('A generated export file is a directory: %s' % path)
                    path.unlink()
            zones = self.stage / 'zones'
            if zones.exists():
                if not zones.is_dir():
                    raise RuntimeError('The export zones path is not a directory: %s' % zones)
                for path in zones.iterdir():
                    if ZONE_FILE.fullmatch(path.name):
                        if not path.is_file():
                            raise RuntimeError('A generated zone file is a directory: %s' % path)
                        path.unlink()
            return self
        except BaseException:
            try:
                if self.lock is not None:
                    self._recover()
            finally:
                self._close_lock()
            raise

    def files(self):
        """Require every generated file, while leaving manual and unrelated files alone."""
        plain_tree(self.stage)
        generated_spelling(self.stage)
        for name in GENERATED:
            if not (self.stage / name).is_file():
                raise RuntimeError('The generated export is missing %s' % name)
        zones = self.stage / 'zones'
        if not zones.is_dir():
            raise RuntimeError('The generated export has no zones directory.')
        paths = sorted(path for path in zones.iterdir() if ZONE_FILE.fullmatch(path.name))
        if not paths or any(not path.is_file() for path in paths):
            raise RuntimeError('The generated export has no complete zone files.')
        return paths + [self.stage / name for name in sorted(GENERATED)]

    def promote(self):
        """A journal and backup make either directory rename recoverable after interruption."""
        if fingerprint(self.out) != self.original:
            raise RuntimeError('The export output changed during the build; no files were replaced.')
        had_output = self.out.exists()
        self.candidate = tree_digest(fingerprint(self.stage))
        self._write_state('prepared', had_output)
        try:
            if had_output:
                self._rename(self.out, self.previous)
                if fingerprint(self.previous) != self.original:
                    raise RuntimeError('The export output changed during promotion; restoring the previous output.')
            self._rename(self.stage, self.out)
            if had_output and fingerprint(self.previous) != self.original:
                raise RuntimeError('The export output changed during promotion; restoring the previous output.')
            self._write_state('committed', had_output)
        except BaseException:
            self._recover()
            raise
        self.committed = True

    def __exit__(self, error_type, error, traceback):
        try:
            # Recovery also removes a failed staging build, without changing the prior output.
            try:
                self._recover()
            except OSError as cleanup_error:
                if not self.committed:
                    if error is None:
                        raise
                    error.add_note('Export recovery could not finish. The backup is kept at %s: %s'
                                   % (self.previous, cleanup_error))
                else:
                    warnings.warn('The export is complete, but its backup could not be removed: %s (%s)'
                                  % (self.folder, cleanup_error), RuntimeWarning)
        finally:
            self._close_lock()
