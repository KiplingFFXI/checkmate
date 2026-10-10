"""Release archives contain only reviewed files and never replace a good zip after a failed check."""
import hashlib
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch
import zipfile

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build_release


class ReleaseTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.root = Path(self.temporary.name)
        self.addon = self.root / 'checkmate'
        self.addon.mkdir()
        (self.addon / 'core').mkdir()
        (self.addon / 'checkmate.lua').write_text("addon.version = '1.10.0';\n", encoding='ascii')
        (self.addon / 'core/main.lua').write_text('return {};\n', encoding='ascii')
        self.license = self.root / 'LICENSE'
        self.license.write_text('Public license notice.\n', encoding='ascii')
        self.allowed = patch.object(build_release, 'FILES', {'checkmate.lua', 'core/main.lua'})
        self.directories = patch.object(build_release, 'DIRECTORIES', {'core'})
        self.allowed.start()
        self.directories.start()

    def tearDown(self):
        self.directories.stop()
        self.allowed.stop()
        self.temporary.cleanup()

    def build(self):
        return build_release.build(self.root / 'out', self.addon, self.license)

    def test_manifest_and_license_are_the_whole_archive(self):
        path, count, digest = self.build()
        with zipfile.ZipFile(path) as archive:
            self.assertEqual(archive.namelist(), ['checkmate/LICENSE', 'checkmate/checkmate.lua', 'checkmate/core/main.lua'])
            self.assertTrue(all(info.date_time == (1980, 1, 1, 0, 0, 0) for info in archive.infolist()))
            self.assertEqual(archive.read('checkmate/LICENSE'), self.license.read_bytes())
        self.assertEqual(count, 3)
        self.assertEqual(digest, hashlib.sha256(path.read_bytes()).hexdigest())

    def test_repeated_build_is_byte_identical(self):
        path, _, first = self.build()
        (self.addon / 'core/main.lua').touch()
        _, _, second = self.build()
        self.assertEqual(first, second)
        self.assertTrue(path.is_file())

    def test_private_note_and_extra_lua_are_rejected(self):
        for name in ('notes.txt', 'test_probe.lua', '.env', 'checkmate.lua.bak'):
            path = self.addon / name
            path.write_text('not for release', encoding='ascii')
            with self.assertRaisesRegex(RuntimeError, 'Unexpected.*file'):
                self.build()
            path.unlink()

    def test_even_empty_developer_folder_is_rejected(self):
        (self.addon / 'tests').mkdir()
        with self.assertRaisesRegex(RuntimeError, 'Unexpected.*folder'):
            self.build()

    def test_missing_runtime_file_is_rejected(self):
        (self.addon / 'core/main.lua').unlink()
        with self.assertRaisesRegex(RuntimeError, 'missing.*core/main.lua'):
            self.build()

    def test_private_path_fails_without_printing_the_path(self):
        (self.addon / 'core/main.lua').write_text("-- C:\\Users\\PrivatePerson\\secret.txt\nreturn {};", encoding='ascii')
        with self.assertRaisesRegex(RuntimeError, 'Private path.*core/main.lua') as caught:
            self.build()
        self.assertNotIn('PrivatePerson', str(caught.exception))

    def test_system_font_path_and_public_author_are_allowed(self):
        (self.addon / 'core/main.lua').write_text("-- Public author.\nreturn 'C:\\\\Windows\\\\Fonts';", encoding='ascii')
        self.build()

    def test_failed_content_check_keeps_previous_archive(self):
        path, _, digest = self.build()
        (self.addon / 'core/main.lua').write_text('-----BEGIN PRIVATE KEY-----', encoding='ascii')
        with self.assertRaisesRegex(RuntimeError, 'credential'):
            self.build()
        self.assertEqual(hashlib.sha256(path.read_bytes()).hexdigest(), digest)
        self.assertEqual(list(path.parent.glob('.checkmate-*')), [])

    def test_public_docs_are_checked_without_packing_them(self):
        self.assertIn('docs/GUIDE.md', build_release.PUBLIC_DOCS)
        for name in build_release.PUBLIC_DOCS:
            document = self.root / name
            document.parent.mkdir(parents=True, exist_ok=True)
            document.write_text('Public project documentation.\n', encoding='ascii')
        path, count, _ = self.build()
        self.assertEqual(count, 3)
        with zipfile.ZipFile(path) as archive:
            self.assertFalse(any(name.endswith(build_release.PUBLIC_DOCS) for name in archive.namelist()))

    def test_private_public_doc_keeps_previous_archive(self):
        path, _, digest = self.build()
        for name in ('README.md', 'CHANGELOG.md', 'docs/GUIDE.md'):
            with self.subTest(name=name):
                document = self.root / name
                document.parent.mkdir(parents=True, exist_ok=True)
                document.write_text('Saved to C:\\Users\\PrivatePerson\\notes.txt', encoding='ascii')
                with self.assertRaisesRegex(RuntimeError, 'Private path.*' + name) as caught:
                    self.build()
                self.assertNotIn('PrivatePerson', str(caught.exception))
                self.assertEqual(hashlib.sha256(path.read_bytes()).hexdigest(), digest)
                self.assertEqual(list(path.parent.glob('.checkmate-*')), [])
                document.unlink()

    def test_linked_public_doc_is_rejected(self):
        original = build_release.linked
        for name in build_release.PUBLIC_DOCS:
            with self.subTest(name=name):
                document = self.root / name
                with patch.object(build_release, 'linked', side_effect=lambda path: Path(path) == document or original(path)):
                    with self.assertRaisesRegex(RuntimeError, 'Linked release file: ' + name):
                        self.build()

    def test_original_icons_match_and_changed_bytes_are_rejected(self):
        source = Path(build_release.ADDON) / 'assets/weapons'
        for name in build_release.ASSET_HASHES:
            with self.subTest(name=name):
                original = (source / name).read_bytes()
                icon = self.root / name
                icon.write_bytes(original)
                self.assertEqual(build_release.checked_bytes(icon, name), original)
                icon.write_bytes(original + b'Private embedded note.')
                with self.assertRaisesRegex(RuntimeError, 'differs from its reviewed original'):
                    build_release.checked_bytes(icon, name)

    def test_same_size_substituted_icon_is_rejected(self):
        source = Path(build_release.ADDON) / 'assets/weapons'
        with self.assertRaisesRegex(RuntimeError, 'differs from its reviewed original'):
            build_release.checked_bytes(source / 'Blunt.png', 'Slashing.png')

    def test_failed_replacement_keeps_previous_archive_and_removes_temporary(self):
        path, _, digest = self.build()
        (self.addon / 'core/main.lua').write_text('return { changed = true };\n', encoding='ascii')
        with patch.object(build_release.os, 'replace', side_effect=PermissionError('Destination unavailable.')):
            with self.assertRaises(PermissionError):
                self.build()
        self.assertEqual(hashlib.sha256(path.read_bytes()).hexdigest(), digest)
        self.assertEqual(list(path.parent.glob('.checkmate-*')), [])

    def test_linked_file_is_rejected(self):
        original = build_release.linked
        with patch.object(build_release, 'linked', side_effect=lambda path: str(path).endswith('main.lua') or original(path)):
            with self.assertRaisesRegex(RuntimeError, 'linked release file'):
                self.build()

    def test_output_inside_addon_is_rejected(self):
        with self.assertRaisesRegex(RuntimeError, 'outside the addon'):
            build_release.build(self.addon / 'dist', self.addon, self.license)

    def test_unsafe_version_is_rejected(self):
        (self.addon / 'checkmate.lua').write_text("addon.version = '../bad';", encoding='ascii')
        with self.assertRaisesRegex(RuntimeError, 'three numeric parts'):
            self.build()


if __name__ == '__main__':
    unittest.main()
