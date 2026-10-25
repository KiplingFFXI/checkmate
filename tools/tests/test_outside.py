"""Reviewed player job changes cannot hide an unreviewed monster job change."""
import os
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import lua_source, mobscripts, outside, sqlfile


class OutsideJobTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='checkmate_outside_')
        self.addCleanup(self.temp.cleanup)
        self.tree = Path(self.temp.name)
        self.write('modules/init.txt', '')

    def write(self, name, text):
        path = self.tree / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf8')

    def player_files(self):
        self.write('scripts/globals/monstrosity/feretory.lua',
                   'xi.monstrosity.feretoryOnZoneIn = function(player, prevZone)\n'
                   '    player:changeJob(xi.job.MON)\nend')
        self.write('scripts/globals/monstrosity/relinquish.lua',
                   'xi.monstrosity.onMonstrosityReturnToEntrance = function(player)\n'
                   '    if data.entry_zone_id == 0 then\n'
                   '        player:changeJob(data.entry_mjob ~= 0 and data.entry_mjob or xi.job.WAR)\n'
                   '        return\n    end\n'
                   '    player:changeJob(data.entry_mjob)\nend')

    def test_player_monstrosity_does_not_mark_an_ordinary_monster(self):
        self.player_files()
        outside.check_job_changes(str(self.tree))
        index = mobscripts.ScriptIndex(str(self.tree), set(), {})
        source = lua_source.LuaFile('scripts/zones/Test/mobs/Mob.lua',
                                    'entity.onMobSpawn = function(mob)\nend')
        self.assertFalse(index.file_effects(source).job_changes)

    def test_monster_receiver_in_a_reviewed_player_file_stops(self):
        self.write('scripts/globals/monstrosity/feretory.lua', 'mob:changeJob(xi.job.MON)')
        with self.assertRaisesRegex(RuntimeError, 'changes a job'):
            outside.check_job_changes(str(self.tree))

    def test_unreviewed_job_argument_in_a_player_file_stops(self):
        self.write('scripts/globals/monstrosity/relinquish.lua', 'player:changeJob(newJob)')
        with self.assertRaisesRegex(RuntimeError, 'changes a job'):
            outside.check_job_changes(str(self.tree))

    def test_unknown_monster_and_loaded_module_changes_stop(self):
        for name in ('scripts/zones/Test/mobs/Mob.lua', 'modules/test/lua/job.lua'):
            with self.subTest(name=name):
                self.write('modules/init.txt', 'test/lua/job.lua\n')
                self.write(name, 'mob:changeJob(xi.job.BLM)')
                with self.assertRaisesRegex(RuntimeError, 'changes a job'):
                    outside.check_job_changes(str(self.tree))
                (self.tree / name).unlink()

    def test_known_monster_change_remains_visible_to_the_job_reader(self):
        name = 'scripts/zones/Mine_Shaft_2716/mobs/Fantoccini.lua'
        text = 'entity.onMobSpawn = function(mob)\n    mob:changeJob(initiatorJob)\nend'
        self.write(name, text)
        outside.check_job_changes(str(self.tree))
        index = mobscripts.ScriptIndex(str(self.tree), set(), {})
        self.assertTrue(index.file_effects(lua_source.LuaFile(name, text)).job_changes)

    def test_comments_and_spacing_keep_the_exact_reviewed_call(self):
        self.write('scripts/globals/monstrosity/feretory.lua',
                   '-- mob:changeJob(newJob)\n    player:changeJob(xi.job.MON) -- Reviewed player call.\n')
        outside.check_job_changes(str(self.tree))


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'needs pinned source tree')
class ActualOutsideTests(unittest.TestCase):
    def test_all_source_job_changes_are_reviewed(self):
        outside.check_job_changes(os.environ['CHECKMATE_SOURCE_TREE'])

    def test_exported_zones_and_battlefield_changes_are_reviewed(self):
        from export_data import EXCLUDED_ZONE_IDS
        tree = os.environ['CHECKMATE_SOURCE_TREE']
        zones = {row['name'] for row in sqlfile.rows(Path(tree) / 'sql/zone_settings.sql', 'zone_settings')
                 if row['zoneid'] not in EXCLUDED_ZONE_IDS}
        index = mobscripts.ScriptIndex(tree, set(), {})
        marks = outside.scan(tree, index, zones)
        self.assertIn('scripted_aggro', marks[('Arrapago_Reef', 'Lamia_No19')])


if __name__ == '__main__':
    unittest.main()
