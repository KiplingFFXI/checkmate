"""Reviewed era NM timers retain initialization, despawn and unknown-state notes."""
import os
from pathlib import Path
import sys
from types import SimpleNamespace
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import aggro, content, encounters


TEXT = """local timedNMs =
{
    { 'Test', 'Known', 7200, 10800 },
}
if not xi.pre(xi.expansion.WOTG) then
    table.insert(timedNMs, { 'Test', 'Later', 3600, 3600 })
end
"""


class TimedRulesTests(unittest.TestCase):
    def test_literal_windows_and_content_condition(self):
        era = content.Content(True, ['rotz', 'cop', 'toau'])
        self.assertEqual(encounters.timed_rules(TEXT, era), {('Test', 'Known'): (7200, 10800)})
        for allowed in (content.Content(True, ['wotg']), content.Content(False, [])):
            self.assertEqual(encounters.timed_rules(TEXT, allowed)['Test', 'Later'], (3600, 3600))

    def test_unreadable_repeated_and_invalid_windows_stop(self):
        for text in (TEXT.replace('7200, 10800', 'minimum, 10800'),
                     TEXT.replace('7200, 10800', '10800, 7200'),
                     TEXT.replace('7200, 10800', '0, 10800'),
                     TEXT.replace("{ 'Test', 'Known', 7200, 10800 },",
                                  "{ 'Test', 'Known', 7200, 10800 }, { 'Test', 'Known', 7200, 10800 },"),
                     TEXT.replace('if not xi.pre(xi.expansion.WOTG) then', 'if unknown then')):
            with self.subTest(text=text), self.assertRaises(RuntimeError):
                encounters.timed_rules(text, content.Content(True, []))

    def test_spawn_uses_era_delay_without_inventing_remaining_time(self):
        reader = encounters.Reader.__new__(encounters.Reader)
        reader.timed = {('Promyvion-Dem', 'Satiator'): (14400, 14400)}
        reader.pop_items = lambda zone: {}
        kind = SimpleNamespace(zone_dir='Promyvion-Dem', script='Satiator', nm=True)
        result = reader.spawn(kind, {'spawn': {'respawn': 3600, 'type': 'scripted'}}, 'setRespawnTime')
        self.assertEqual(result['value'], 'Respawn 4 hours')
        text = ' '.join(result['notes'])
        self.assertIn('initialization and after despawn', text)
        self.assertIn('Saved timers can replace', text)
        self.assertIn('no remaining time', text)
        self.assertNotIn('base delay', text)


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'CHECKMATE_SOURCE_TREE not set')
class TimedSourceTests(unittest.TestCase):
    def test_loaded_source_has_satiators_four_hour_delay(self):
        tree = Path(os.environ['CHECKMATE_SOURCE_TREE'])
        self.assertIn(encounters.TIMED, aggro.lua_files_loaded(tree))
        rules = encounters.timed_rules(encounters.text_at(tree, encounters.TIMED), content.Content(True, ['rotz', 'cop', 'toau']))
        self.assertEqual(rules['Promyvion-Dem', 'Satiator'], (14400, 14400))
        self.assertEqual(len(rules), 8)

    def test_changed_loader_or_timed_module_stops_the_export(self):
        tree = Path(os.environ['CHECKMATE_SOURCE_TREE'])
        original = Path.read_text
        for relative, before, after in (
            (encounters.TIMED, "'Satiator',           14400,  14400", "'Satiator',           14401,  14400"),
            ('src/map/data/yaml/merge.cpp', 'dataRoot /= *entry.begin();', 'dataRoot /= "other";'),
        ):
            def changed(path, *args, **kwargs):
                text = original(path, *args, **kwargs)
                if path == tree / relative:
                    self.assertIn(before, text)
                    return text.replace(before, after)
                return text
            with self.subTest(relative=relative), patch.object(Path, 'read_text', changed), self.assertRaises(RuntimeError):
                encounters.check_source(tree, [])


if __name__ == '__main__':
    unittest.main()
