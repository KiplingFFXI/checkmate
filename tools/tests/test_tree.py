"""A failed source extraction must stop git and remove only its own temporary copy."""
import io
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

    def archive(self):
        output = io.BytesIO()
        with tarfile.open(fileobj=output, mode='w') as archive:
            entry = tarfile.TarInfo('source.txt')
            entry.size = 4
            archive.addfile(entry, io.BytesIO(b'test'))
        return output.getvalue()

    def test_success_is_readable_and_explicit_cleanup_is_scoped(self):
        folder, process = self.run_extract(self.archive())
        try:
            self.assertEqual((Path(folder) / 'source.txt').read_bytes(), b'test')
            process.kill.assert_not_called()
            self.assertTrue(process.stdout.closed)
        finally:
            tree.remove(folder)
        self.assertFalse(Path(folder).exists())

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
