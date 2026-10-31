"""A failed or interrupted export must leave its previous complete output available."""
from contextlib import ExitStack, nullcontext
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import export_data
from export import output


class ExportTransactionTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.root = Path(self.temporary.name)
        self.out = self.root / 'data'
        self.source = self.root / 'source'
        self.source.mkdir()
        (self.out / 'zones').mkdir(parents=True)
        for name in output.GENERATED:
            (self.out / name).write_bytes(b'return { old = true };\r\n')
        (self.out / 'zones/1.lua').write_bytes(b'return { old_zone = 1 };\r\n')
        (self.out / 'zones/2.lua').write_bytes(b'return { obsolete_zone = 2 };\r\n')
        (self.out / 'spells.lua').write_bytes(b'-- Manual spell data.\r\nreturn {};\r\n')
        (self.out / 'notes.txt').write_bytes(b'unrelated\r\n')
        (self.out / 'zones/manual.lua').write_bytes(b'-- Not generated.\r\nreturn {};\r\n')
        (self.out / 'empty').mkdir()
        self.original = self.snapshot()
        self.cache = patch.object(output, 'LOCK_FOLDER', self.root / 'locks')
        self.cache.start()

    def tearDown(self):
        self.cache.stop()
        self.temporary.cleanup()

    def snapshot(self):
        if not self.out.exists():
            return None
        return {path.relative_to(self.out).as_posix(): path.read_bytes() if path.is_file() else None
                for path in self.out.rglob('*')}

    def generate(self, folder, allowed, stamp, out):
        destination = Path(out)
        (destination / 'zones').mkdir(exist_ok=True)
        for name in output.GENERATED:
            (destination / name).write_text("return { built = 'new' };\n", encoding='ascii')
        (destination / 'zones/3.lua').write_text('return { zone = 3 };\n', encoding='ascii')
        return {'rows': 1}

    def build(self, writer=None):
        with patch.object(export_data, '_write_files', side_effect=writer or self.generate):
            return export_data.build_files(str(self.source), None, export_data.Stamp('fixture', 'fixture'), str(self.out))

    def unchanged(self):
        self.assertEqual(self.snapshot(), self.original)
        self.assertFalse((self.root / '.data.checkmate-export').exists())

    def test_success_promotes_the_complete_set_and_keeps_unrelated_bytes(self):
        result = self.build()
        self.assertEqual(result['rows'], 1)
        self.assertIn('13 files load in LuaJIT', result['note'])
        current = self.snapshot()
        for name in ('spells.lua', 'notes.txt', 'zones/manual.lua', 'empty'):
            self.assertEqual(current[name], self.original[name])
        self.assertNotIn('zones/1.lua', current)
        self.assertNotIn('zones/2.lua', current)
        self.assertIn('zones/3.lua', current)
        self.assertFalse((self.root / '.data.checkmate-export').exists())

    def test_first_export_creates_output_only_after_validation(self):
        self.out = self.root / 'new' / 'data'
        self.build()
        self.assertTrue((self.out / 'zones/3.lua').is_file())

    def test_incomplete_first_export_does_not_create_output(self):
        self.out = self.root / 'new' / 'data'
        with patch.object(export_data, 'load_check', side_effect=RuntimeError('late LuaJIT failure')):
            with self.assertRaisesRegex(RuntimeError, 'late LuaJIT'):
                self.build()
        self.assertFalse(self.out.exists())

    def test_interrupt_after_original_zone_cleanup_is_staging_only(self):
        # This is the old failure: cleanup happened before the first aggregate writer completed.
        ctx = SimpleNamespace(roots=[], tables=None, tree=str(self.source), fixed_steal={}, fixed_seen=set(),
                              unreadable=[], exists=None)
        replacements = {
            'Context': ctx, 'zone_list': [], 'source_parity.check': 'checked', 'overlays.data_roots': [],
            'modifiers.build': {}, 'job_settings.build': {}, 'merits.build': {},
            'source_parity.check_modifiers': None, 'steal.check_roll': None, 'steal.check_traits': None,
            'steal.ability': {}, 'steal.gear': {}, 'steal.latents': {}, 'steal.check_module_sql': None,
            'defenses.build': {}, 'pdif.build': {}, 'effects.build': {}, 'crit.check_traits': None,
            'crit.gear': {}, 'crit.check_latents': None, 'crit.check_module_sql': None,
            'crit.check_yonin': None, 'crit.check_scripts': None, 'exists.check_module_sql': None,
        }
        with ExitStack() as stack:
            for name, value in replacements.items():
                stack.enter_context(patch('export_data.' + name, return_value=value))
            stack.enter_context(patch('export_data.bands.build', side_effect=KeyboardInterrupt()))
            with self.assertRaises(KeyboardInterrupt):
                export_data.build_files(str(self.source), None, export_data.Stamp('fixture', 'fixture'), str(self.out))
        self.unchanged()

    def test_late_source_failure_keeps_prior_output(self):
        def fail(*args):
            self.generate(*args)
            raise RuntimeError('late source guard')
        with self.assertRaisesRegex(RuntimeError, 'late source guard'):
            self.build(fail)
        self.unchanged()

    def test_late_luajit_failure_keeps_prior_output(self):
        def invalid(*args):
            result = self.generate(*args)
            (Path(args[-1]) / 'blue_finder.lua').write_text('return { broken = ; }', encoding='ascii')
            return result
        with self.assertRaisesRegex(RuntimeError, 'does not load in LuaJIT'):
            self.build(invalid)
        self.unchanged()

    def test_missing_luajit_cannot_promote_unchecked_files(self):
        with patch.dict(sys.modules, {'lupa': None}):
            with self.assertRaisesRegex(RuntimeError, 'needs lupa'):
                self.build()
        self.unchanged()

    def test_constant_limit_covers_aggregate_files_as_well_as_zones(self):
        def oversized(*args):
            result = self.generate(*args)
            (Path(args[-1]) / 'effects.lua').write_text('return {' + '{},' * 20 + '};', encoding='ascii')
            return result
        with patch.object(export_data, 'CONSTANT_LIMIT', 10):
            with self.assertRaisesRegex(RuntimeError, 'over the 10 limit'):
                self.build(oversized)
        self.unchanged()

    def test_cancellation_and_system_exit_keep_prior_output(self):
        for failure in (KeyboardInterrupt, SystemExit):
            with self.subTest(failure=failure):
                def cancel(*args):
                    self.generate(*args)
                    raise failure()
                with self.assertRaises(failure):
                    self.build(cancel)
                self.unchanged()

    def test_omitted_generated_file_is_not_inherited_from_old_output(self):
        def omit(*args):
            result = self.generate(*args)
            (Path(args[-1]) / 'merits.lua').unlink()
            return result
        with self.assertRaisesRegex(RuntimeError, 'missing merits.lua'):
            self.build(omit)
        self.unchanged()

    def test_empty_zone_set_cannot_replace_prior_zones(self):
        def omit(*args):
            result = self.generate(*args)
            (Path(args[-1]) / 'zones/3.lua').unlink()
            return result
        with self.assertRaisesRegex(RuntimeError, 'no complete zone files'):
            self.build(omit)
        self.unchanged()

    def test_original_directory_rename_failure_is_safe(self):
        original = output.Output._rename
        def fail(transaction, source, target):
            if source == transaction.out:
                raise OSError('original rename blocked')
            original(transaction, source, target)
        with patch.object(output.Output, '_rename', fail):
            with self.assertRaisesRegex(OSError, 'original rename blocked'):
                self.build()
        self.unchanged()

    def test_new_directory_rename_failure_rolls_back(self):
        original = output.Output._rename
        def fail(transaction, source, target):
            if source == transaction.stage:
                raise OSError('new rename blocked')
            original(transaction, source, target)
        with patch.object(output.Output, '_rename', fail):
            with self.assertRaisesRegex(OSError, 'new rename blocked'):
                self.build()
        self.unchanged()

    def test_cancellation_after_new_directory_rename_rolls_back(self):
        original = output.Output._rename
        def cancel(transaction, source, target):
            original(transaction, source, target)
            if source == transaction.stage:
                raise KeyboardInterrupt()
        with patch.object(output.Output, '_rename', cancel):
            with self.assertRaises(KeyboardInterrupt):
                self.build()
        self.unchanged()

    def test_commit_journal_failure_rolls_back(self):
        original = output.Output._write_state
        def fail(transaction, phase, had_output):
            if phase == 'committed':
                raise OSError('journal write blocked')
            original(transaction, phase, had_output)
        with patch.object(output.Output, '_write_state', fail):
            with self.assertRaisesRegex(OSError, 'journal write blocked'):
                self.build()
        self.unchanged()

    def test_cleanup_failure_keeps_complete_output_and_a_recoverable_journal(self):
        original = output.remove_inside
        def fail(path, folder):
            if path.name == 'previous':
                raise OSError('backup is open')
            original(path, folder)
        with patch.object(output, 'remove_inside', fail):
            with self.assertWarnsRegex(RuntimeWarning, 'export is complete'):
                self.build()
        completed = self.snapshot()
        self.assertIn('zones/3.lua', completed)
        self.assertTrue((self.root / '.data.checkmate-export/previous').is_dir())
        with output.Output(self.out, self.source):
            self.assertEqual(self.snapshot(), completed)
        self.assertEqual(self.snapshot(), completed)
        self.assertFalse((self.root / '.data.checkmate-export').exists())

    def test_failed_rollback_keeps_a_backup_that_next_run_recovers(self):
        original = output.Output._rename
        def fail(transaction, source, target):
            if source in {transaction.stage, transaction.previous}:
                raise OSError('rename blocked')
            original(transaction, source, target)
        with patch.object(output.Output, '_rename', fail):
            with self.assertRaisesRegex(OSError, 'rename blocked'):
                self.build()
        backup = self.root / '.data.checkmate-export/previous'
        self.assertTrue((backup / 'zones/1.lua').is_file())
        self.assertFalse(self.out.exists())
        with self.assertRaisesRegex(RuntimeError, 'stop after recovery'):
            with output.Output(self.out, self.source):
                self.assertEqual(self.snapshot(), self.original)
                raise RuntimeError('stop after recovery')
        self.unchanged()

    def child(self, body):
        prefix = ('import os, sys\nfrom pathlib import Path\n'
                  'sys.path.insert(0, %r)\nfrom export import output\n'
                  'output.LOCK_FOLDER = Path(%r)\n'
                  'out, source = Path(%r), Path(%r)\n'
                  % (str(Path(export_data.__file__).parent), str(self.root / 'locks'), str(self.out), str(self.source)))
        return subprocess.run([sys.executable, '-c', prefix + body], capture_output=True, text=True, timeout=15)

    def kill_at(self, boundary):
        code = '''
original_rename = output.Output._rename
original_state = output.Output._write_state
def rename(self, source, target):
    original_rename(self, source, target)
    if (%r == 'old' and target == self.previous) or (%r == 'new' and source == self.stage):
        os._exit(91)
def state(self, phase, had_output):
    original_state(self, phase, had_output)
    if %r == 'committed' and phase == 'committed':
        os._exit(91)
output.Output._rename = rename
output.Output._write_state = state
with output.Output(out, source) as transaction:
    (transaction.stage / 'zones').mkdir(exist_ok=True)
    for name in output.GENERATED:
        (transaction.stage / name).write_text('return { new = true };', encoding='ascii')
    (transaction.stage / 'zones/3.lua').write_text('return { new = true };', encoding='ascii')
    transaction.files()
    transaction.promote()
''' % (boundary, boundary, boundary)
        result = self.child(code)
        self.assertEqual(result.returncode, 91, result.stderr)

    def test_hard_kill_between_directory_renames_restores_previous_output(self):
        self.kill_at('old')
        self.assertFalse(self.out.exists())
        with output.Output(self.out, self.source):
            self.assertEqual(self.snapshot(), self.original)
        self.unchanged()

    def test_hard_kill_after_install_before_commit_restores_previous_output(self):
        self.kill_at('new')
        self.assertNotEqual(self.snapshot(), self.original)
        with output.Output(self.out, self.source):
            self.assertEqual(self.snapshot(), self.original)
        self.unchanged()

    def test_hard_kill_after_commit_retains_complete_new_output(self):
        self.kill_at('committed')
        completed = self.snapshot()
        self.assertNotEqual(completed, self.original)
        with output.Output(self.out, self.source):
            self.assertEqual(self.snapshot(), completed)
        self.assertEqual(self.snapshot(), completed)
        self.assertFalse((self.root / '.data.checkmate-export').exists())

    def test_post_crash_recovery_preserves_edits_to_uncommitted_current_output(self):
        self.kill_at('new')
        (self.out / 'spells.lua').write_bytes(b'manual edit after the killed build')
        current = self.snapshot()
        backup = self.root / '.data.checkmate-export/previous'
        prior = output.fingerprint(backup)
        with self.assertRaisesRegex(RuntimeError, 'interrupted export output has changed'):
            with output.Output(self.out, self.source):
                self.fail('ambiguous recovery entered')
        self.assertEqual(self.snapshot(), current)
        self.assertEqual(output.fingerprint(backup), prior)

    def test_post_crash_first_export_recovery_preserves_manual_additions(self):
        self.out = self.root / 'first-data'
        self.kill_at('new')
        (self.out / 'manual.txt').write_bytes(b'added after the killed first build')
        current = self.snapshot()
        with self.assertRaisesRegex(RuntimeError, 'interrupted export output has changed'):
            with output.Output(self.out, self.source):
                self.fail('ambiguous first recovery entered')
        self.assertEqual(self.snapshot(), current)
        self.assertTrue((self.root / '.first-data.checkmate-export/state.json').is_file())

    def test_foreign_first_output_recovery_preserves_new_manual_directory(self):
        self.out = self.root / 'first-data'
        original = output.Output._rename
        def create(transaction, source, target):
            if source == transaction.stage:
                self.out.mkdir()
                (self.out / 'manual-created.txt').write_bytes(b'new manual data')
            original(transaction, source, target)
        with patch.object(output.Output, '_rename', create):
            with self.assertRaisesRegex(RuntimeError, 'interrupted export output has changed'):
                self.build()
        self.assertEqual(self.snapshot(), {'manual-created.txt': b'new manual data'})
        self.assertTrue((self.root / '.first-data.checkmate-export/new/zones/3.lua').is_file())

    def test_foreign_output_recovery_preserves_both_new_directory_and_previous_backup(self):
        original = output.Output._rename
        def create(transaction, source, target):
            if source == transaction.stage:
                self.out.mkdir()
                (self.out / 'manual-created.txt').write_bytes(b'new manual data')
            original(transaction, source, target)
        with patch.object(output.Output, '_rename', create):
            with self.assertRaisesRegex(RuntimeError, 'interrupted export output has changed'):
                self.build()
        self.assertEqual(self.snapshot(), {'manual-created.txt': b'new manual data'})
        backup = self.root / '.data.checkmate-export/previous'
        self.assertEqual((backup / 'spells.lua').read_bytes(), self.original['spells.lua'])
        self.assertTrue((self.root / '.data.checkmate-export/new/zones/3.lua').is_file())

    def test_another_process_cannot_export_to_the_same_output(self):
        with output.Output(self.out, self.source):
            result = self.child('with output.Output(out, source):\n    raise AssertionError("lock was bypassed")\n')
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('Another export is using this output', result.stderr)
            self.assertEqual(self.snapshot(), self.original)
        self.unchanged()

    def test_cancelled_lock_wait_cannot_remove_another_exports_stage(self):
        lock_call = 'msvcrt.locking' if os.name == 'nt' else 'fcntl.flock'
        with output.Output(self.out, self.source) as owner:
            (owner.stage / 'active-write.txt').write_bytes(b'active export')
            held = output.fingerprint(owner.folder)
            for failure in (KeyboardInterrupt, SystemExit, BaseException):
                with self.subTest(failure=failure):
                    contender = output.Output(self.out, self.source)
                    with patch(lock_call, side_effect=failure('cancelled lock acquisition')):
                        with self.assertRaises(failure):
                            with contender:
                                self.fail('the contender acquired the lock')
                    self.assertIsNone(contender.lock)
                    self.assertEqual(output.fingerprint(owner.folder), held)
                    self.assertEqual(self.snapshot(), self.original)
            result = self.child('with output.Output(out, source):\n    raise AssertionError("lock was released")\n')
            self.assertIn('Another export is using this output', result.stderr)
        self.unchanged()

    def test_manual_edits_additions_and_deletions_abort_without_reverting_them(self):
        mutations = (
            ('edit', lambda: (self.out / 'spells.lua').write_bytes(b'edited manual spells\r\n')),
            ('add', lambda: (self.out / 'new-manual.txt').write_bytes(b'added during the build')),
            ('delete', lambda: (self.out / 'notes.txt').unlink()),
            ('add directory', lambda: (self.out / 'new-empty').mkdir()),
            ('remove directory', lambda: (self.out / 'empty').rmdir()),
        )
        for label, mutate in mutations:
            with self.subTest(change=label):
                expected = None
                def edit(*args):
                    nonlocal expected
                    result = self.generate(*args)
                    mutate()
                    expected = self.snapshot()
                    return result
                with self.assertRaisesRegex(RuntimeError, 'output changed during the build'):
                    self.build(edit)
                self.assertEqual(self.snapshot(), expected)
                self.assertFalse((self.root / '.data.checkmate-export').exists())

    def test_transient_copy_time_edit_cannot_escape_the_snapshot_guard(self):
        original = output.shutil.copytree
        manual = self.out / 'spells.lua'
        previous = manual.read_bytes()
        def transient(source, destination, *args, **kwargs):
            if Path(source) != self.out:
                return original(source, destination, *args, **kwargs)
            manual.write_bytes(b'transient edit while copying')
            result = original(source, destination, *args, **kwargs)
            manual.write_bytes(previous)
            return result
        with patch.object(output.shutil, 'copytree', transient):
            with self.assertRaisesRegex(RuntimeError, 'output changed while it was being copied'):
                self.build()
        self.unchanged()

    def test_copy_time_original_edit_is_preserved(self):
        original = output.shutil.copytree
        expected = None
        def edit(source, destination, *args, **kwargs):
            nonlocal expected
            if Path(source) != self.out:
                return original(source, destination, *args, **kwargs)
            result = original(source, destination, *args, **kwargs)
            (self.out / 'spells.lua').write_bytes(b'edit after copy')
            expected = self.snapshot()
            return result
        with patch.object(output.shutil, 'copytree', edit):
            with self.assertRaisesRegex(RuntimeError, 'output changed while it was being copied'):
                self.build()
        self.assertEqual(self.snapshot(), expected)
        self.assertFalse((self.root / '.data.checkmate-export').exists())

    def test_same_size_and_mtime_manual_edit_still_aborts(self):
        manual = self.out / 'spells.lua'
        original = manual.read_bytes()
        metadata = manual.stat()
        changed = original.replace(b'Manual', b'Edited')
        self.assertEqual(len(original), len(changed))
        def edit(*args):
            result = self.generate(*args)
            manual.write_bytes(changed)
            os.utime(manual, ns=(metadata.st_atime_ns, metadata.st_mtime_ns))
            self.assertEqual(manual.stat().st_mtime_ns, metadata.st_mtime_ns)
            return result
        with self.assertRaisesRegex(RuntimeError, 'output changed during the build'):
            self.build(edit)
        self.assertEqual(manual.read_bytes(), changed)
        self.assertFalse((self.root / '.data.checkmate-export').exists())

    def test_edit_just_before_original_rename_is_restored_with_the_backup(self):
        original = output.Output._rename
        expected = None
        def edit(transaction, source, target):
            nonlocal expected
            if source == transaction.out:
                (self.out / 'new-manual.txt').write_bytes(b'late manual addition')
                expected = self.snapshot()
            original(transaction, source, target)
        with patch.object(output.Output, '_rename', edit):
            with self.assertRaisesRegex(RuntimeError, 'output changed during promotion'):
                self.build()
        self.assertEqual(self.snapshot(), expected)
        self.assertFalse((self.root / '.data.checkmate-export').exists())

    def test_edit_to_open_previous_file_after_install_is_restored(self):
        original = output.Output._rename
        def edit(transaction, source, target):
            original(transaction, source, target)
            if source == transaction.stage:
                (transaction.previous / 'spells.lua').write_bytes(b'late write to the old open file')
        with patch.object(output.Output, '_rename', edit):
            with self.assertRaisesRegex(RuntimeError, 'output changed during promotion'):
                self.build()
        expected = dict(self.original, **{'spells.lua': b'late write to the old open file'})
        self.assertEqual(self.snapshot(), expected)
        self.assertFalse((self.root / '.data.checkmate-export').exists())

    def test_output_created_during_first_build_is_not_overwritten(self):
        self.out = self.root / 'first-data'
        def edit(*args):
            result = self.generate(*args)
            self.out.mkdir()
            (self.out / 'manual.txt').write_bytes(b'created during build')
            return result
        with self.assertRaisesRegex(RuntimeError, 'output changed during the build'):
            self.build(edit)
        self.assertEqual(self.snapshot(), {'manual.txt': b'created during build'})
        self.assertFalse((self.root / '.first-data.checkmate-export').exists())

    def test_lock_namespace_does_not_depend_on_temp_environment(self):
        code = ('import sys\nsys.path.insert(0, %r)\nfrom export import output\nprint(output.LOCK_FOLDER)\n'
                % str(Path(export_data.__file__).parent))
        changed = dict(os.environ, TMP=str(self.root), TEMP=str(self.root), TMPDIR=str(self.root))
        first = subprocess.check_output([sys.executable, '-c', code], text=True, timeout=15)
        second = subprocess.check_output([sys.executable, '-c', code], env=changed, text=True, timeout=15)
        self.assertEqual(first, second)

    def test_case_alias_for_generated_file_is_rejected(self):
        (self.out / 'bands.lua').rename(self.out / 'rename.tmp')
        (self.out / 'rename.tmp').rename(self.out / 'Bands.lua')
        self.original = self.snapshot()
        with self.assertRaisesRegex(RuntimeError, 'different case spelling'):
            self.build()
        self.unchanged()

    def test_case_alias_for_zone_file_is_rejected(self):
        (self.out / 'zones/1.lua').rename(self.out / 'zones/1.tmp')
        (self.out / 'zones/1.tmp').rename(self.out / 'zones/1.LUA')
        self.original = self.snapshot()
        with self.assertRaisesRegex(RuntimeError, 'different case spelling'):
            self.build()
        self.unchanged()

    def test_output_file_and_overlapping_source_are_rejected(self):
        invalid = self.root / 'file'
        invalid.write_text('keep', encoding='ascii')
        with self.assertRaisesRegex(RuntimeError, 'not a directory'):
            with output.Output(invalid, self.source):
                self.fail('invalid output entered')
        self.assertEqual(invalid.read_text(encoding='ascii'), 'keep')
        with self.assertRaisesRegex(RuntimeError, 'separate from the source'):
            with output.Output(self.root, self.source):
                self.fail('overlapping output entered')
        self.unchanged()

    def test_output_cannot_contain_its_lock_cache(self):
        with patch.object(output, 'LOCK_FOLDER', self.out / 'locks'):
            with self.assertRaisesRegex(RuntimeError, 'separate from the export lock cache'):
                self.build()
        self.unchanged()

    def test_source_cannot_be_the_reserved_transaction_folder(self):
        reserved = self.root / '.data.checkmate-export'
        reserved.mkdir()
        keep = reserved / 'keep.txt'
        keep.write_bytes(b'keep source')
        with self.assertRaisesRegex(RuntimeError, 'source tree overlaps'):
            with output.Output(self.out, reserved):
                self.fail('source entered as a transaction folder')
        self.assertEqual(keep.read_bytes(), b'keep source')
        self.assertEqual(self.snapshot(), self.original)

    def test_exporter_and_filesystem_root_cannot_be_output(self):
        for invalid in (Path(export_data.__file__).parent, Path(self.out.anchor)):
            with self.subTest(output=invalid):
                with self.assertRaisesRegex(RuntimeError, 'root or contain the exporter'):
                    with output.Output(invalid, self.source):
                        self.fail('unsafe output entered')
        self.unchanged()

    def test_directory_in_generated_file_slot_is_rejected(self):
        (self.out / 'merits.lua').unlink()
        (self.out / 'merits.lua').mkdir()
        self.original = self.snapshot()
        with self.assertRaisesRegex(RuntimeError, 'generated export file is a directory'):
            self.build()
        self.unchanged()

    def test_recovery_journal_cannot_supply_paths(self):
        transaction = self.root / '.data.checkmate-export'
        transaction.mkdir()
        (transaction / 'state.json').write_text(json.dumps({'version': 1, 'phase': 'prepared',
                                                          'had_output': True, 'previous': str(self.out)}), encoding='ascii')
        with self.assertRaisesRegex(RuntimeError, 'Invalid export recovery journal'):
            self.build()
        self.assertEqual(self.snapshot(), self.original)

    def test_regular_file_cannot_pose_as_previous_output(self):
        transaction = self.root / '.data.checkmate-export'
        transaction.mkdir()
        (transaction / 'previous').write_text('invalid backup', encoding='ascii')
        (transaction / 'state.json').write_text(json.dumps({'version': 1, 'phase': 'prepared',
                                                          'had_output': True}), encoding='ascii')
        with self.assertRaisesRegex(RuntimeError, 'Invalid export recovery entry'):
            self.build()
        self.assertEqual(self.snapshot(), self.original)

    def test_unrecognized_transaction_contents_are_left_alone(self):
        transaction = self.root / '.data.checkmate-export'
        transaction.mkdir()
        note = transaction / 'unrelated.txt'
        note.write_bytes(b'keep')
        with self.assertRaisesRegex(RuntimeError, 'Unexpected files'):
            self.build()
        self.assertEqual(note.read_bytes(), b'keep')
        self.assertEqual(self.snapshot(), self.original)

    def test_unowned_staging_folder_is_never_removed(self):
        stage = self.root / '.data.checkmate-export/new'
        stage.mkdir(parents=True)
        keep = stage / 'keep.txt'
        keep.write_bytes(b'keep')
        with self.assertRaisesRegex(RuntimeError, 'no recovery journal'):
            self.build()
        self.assertEqual(keep.read_bytes(), b'keep')
        self.assertEqual(self.snapshot(), self.original)

    def test_directory_links_are_rejected_before_copying(self):
        target = self.root / 'linked'
        target.mkdir()
        (target / 'keep.txt').write_bytes(b'keep')
        link = self.out / 'linked'
        guard = nullcontext()
        if os.name == 'nt':
            result = subprocess.run(['cmd', '/c', 'mklink', '/J', str(link), str(target)],
                                    capture_output=True, text=True, timeout=15)
            if result.returncode:
                # Some Windows test sandboxes disallow creating reparse points. Exercise the same
                # lstat contract there; Linux uses a real symlink and unrestricted Windows a junction.
                self.assertIn('Access is denied', result.stderr)
                link.mkdir()
                original = Path.lstat
                def reparse(path, *args, **kwargs):
                    info = original(path, *args, **kwargs)
                    if path == link:
                        return SimpleNamespace(st_mode=info.st_mode,
                                               st_file_attributes=getattr(info, 'st_file_attributes', 0) | 0x400)
                    return info
                guard = patch.object(Path, 'lstat', reparse)
        else:
            link.symlink_to(target, target_is_directory=True)
        try:
            with guard:
                with self.assertRaisesRegex(RuntimeError, 'links or junctions'):
                    self.build()
            self.assertEqual((target / 'keep.txt').read_bytes(), b'keep')
            self.assertEqual((self.out / 'zones/1.lua').read_bytes(), self.original['zones/1.lua'])
        finally:
            if os.name == 'nt':
                link.rmdir()
            else:
                link.unlink()


if __name__ == '__main__':
    unittest.main()
