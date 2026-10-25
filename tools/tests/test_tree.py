"""A failed source extraction must stop git and remove only its own temporary copy."""
import io
import json
import os
from pathlib import Path
import sys
import tarfile
import tempfile
import unittest
from unittest.mock import Mock, patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import tree


class TreeTests(unittest.TestCase):
    def run_extract(self, data, status=0):
        process = Mock(stdout=io.BytesIO(data))
        process.wait.return_value = status
        process.poll.return_value = None
        created = []
        original = tempfile.mkdtemp

        def make(**kwargs):
            folder = original(**kwargs)
            created.append(folder)
            return folder

        with patch.object(tree.tempfile, 'mkdtemp', side_effect=make), patch.object(tree.subprocess, 'Popen', return_value=process):
            try:
                result = tree.extract('read-only-repository', 'source-pin')
            except BaseException:
                self.assertTrue(all(not Path(folder).exists() for folder in created))
                self.assertTrue(process.stdout.closed)
                process.kill.assert_called_once()
                raise
        return result, process

    def archive(self, files=None):
        output = io.BytesIO()
        with tarfile.open(fileobj=output, mode='w') as archive:
            for name, data in (files or {'source.txt': b'test'}).items():
                entry = tarfile.TarInfo(name)
                entry.size = len(data)
                archive.addfile(entry, io.BytesIO(data))
        return output.getvalue()

    def test_success_is_readable_and_explicit_cleanup_is_scoped(self):
        folder, process = self.run_extract(self.archive())
        try:
            self.assertEqual((Path(folder) / 'source.txt').read_bytes(), b'test')
            self.assertEqual(tree.source_paths(folder), {'source.txt': 'source.txt'})
            process.kill.assert_not_called()
            self.assertTrue(process.stdout.closed)
        finally:
            tree.remove(folder)
        self.assertFalse(Path(folder).exists())

    def test_archive_keeps_distinct_directory_case_in_the_manifest(self):
        paths = {'modules/Quests/upper.lua': b'upper', 'modules/quests/lower.lua': b'lower'}
        folder, _ = self.run_extract(self.archive(paths))
        try:
            self.assertEqual(tree.source_paths(folder), {rel.casefold(): rel for rel in paths})
            for rel, expected in paths.items():
                self.assertEqual((Path(folder) / rel).read_bytes(), expected)
        finally:
            tree.remove(folder)

    def test_case_colliding_files_stop_extraction_and_remove_the_copy(self):
        paths = {'modules/Example.lua': b'first', 'modules/example.lua': b'second'}
        with self.assertRaisesRegex(RuntimeError, 'Source files differ only by case'):
            self.run_extract(self.archive(paths))

    def test_source_path_cache_refreshes_changed_manifests(self):
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder) / tree.SOURCE_PATHS
            first = {'modules/upper.lua': 'modules/Upper.lua'}
            path.write_text(json.dumps(first), encoding='utf8')
            self.assertEqual(tree.source_paths(folder), first)
            old_stamp = path.stat()
            second = {'modules/lower.lua': 'modules/lower.lua'}
            path.write_text(json.dumps(second), encoding='utf8')
            os.utime(path, ns=(old_stamp.st_atime_ns, old_stamp.st_mtime_ns + 1_000_000_000))
            self.assertEqual(tree.source_paths(folder), second)

    def test_bad_archive_cleans_up_and_stops_the_writer(self):
        with self.assertRaises(tarfile.ReadError):
            self.run_extract(b'not an archive')

    def test_git_error_cleans_up_the_partial_copy(self):
        with self.assertRaisesRegex(RuntimeError, 'git archive failed'):
            self.run_extract(self.archive(), status=1)

    def test_cleanup_rejects_unrelated_folder(self):
        with tempfile.TemporaryDirectory() as folder:
            sentinel = Path(folder) / 'keep.txt'
            sentinel.write_text('keep', encoding='ascii')
            with self.assertRaisesRegex(RuntimeError, 'outside'):
                tree.remove(folder)
            self.assertEqual(sentinel.read_text(), 'keep')


if __name__ == '__main__':
    unittest.main()
