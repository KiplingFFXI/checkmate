"""Skill-list IDs cannot be mistaken for monster-spawning skill IDs."""
import os
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import content, exists


class ExistsSqlTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='checkmate_exists_sql_')
        self.addCleanup(self.temp.cleanup)
        self.tree = Path(self.temp.name)
        self.write('modules/init.txt', 'test/sql/skills.sql\n')
        self.write('scripts/actions/mobskills/call_wyvern.lua', 'mobskill.onMobWeaponSkill = function()\nSpawnMob(17000000)\nend')
        self.write('scripts/actions/mobskills/head_butt_jugpet.lua', 'mobskill.onMobWeaponSkill = function()\nreturn 0\nend')
        self.skills = [('734', "'call_wyvern'"), ('3843', "'head_butt_jugpet'")]
        self.lists = [("'Jug_Mandragora'", '734', '3843')]
        self.index = exists.Index.__new__(exists.Index)
        self.index.tree, self.index.cache = str(self.tree), {}
        self.save()

    def write(self, name, text):
        path = self.tree / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf8')

    def table(self, name, columns, rows):
        text = 'CREATE TABLE `%s` (\n%s\n);\n' % (name, ',\n'.join('  `%s` int' % column for column in columns))
        text += ''.join('INSERT INTO `%s` VALUES (%s);\n' % (name, ','.join(row)) for row in rows)
        self.write('sql/' + name + '.sql', text)

    def save(self, statement=''):
        self.table('mob_skills', ['mob_skill_id', 'mob_skill_name'], self.skills)
        self.table('mob_skill_lists', ['skill_list_name', 'skill_list_id', 'mob_skill_id'], self.lists)
        self.write('modules/test/sql/skills.sql', statement)

    def test_jug_list_id_is_not_a_spawning_skill_id(self):
        self.save("DELETE FROM mob_skill_lists WHERE skill_list_name IN ('Jug_Mandragora');\n"
                  "INSERT INTO mob_skill_lists VALUES ('Jug_Mandragora',734,3843);")
        exists.check_module_sql(str(self.tree), self.index)

    def test_removing_an_actual_spawning_move_stops(self):
        self.lists.append(("'Jug_Mandragora'", '734', '734'))
        self.save("DELETE FROM mob_skill_lists WHERE skill_list_name IN ('Jug_Mandragora');")
        with self.assertRaisesRegex(RuntimeError, 'spawns monsters'):
            exists.check_module_sql(str(self.tree), self.index)

    def test_inserting_an_actual_spawning_move_stops(self):
        self.save("INSERT INTO mob_skill_lists VALUES ('Other',20,734);")
        with self.assertRaisesRegex(RuntimeError, 'spawns monsters'):
            exists.check_module_sql(str(self.tree), self.index)

    def test_replacing_or_renaming_a_move_with_a_spawner_stops(self):
        for statement in ("UPDATE mob_skill_lists SET mob_skill_id = 734 WHERE skill_list_id = 734;",
                          "UPDATE mob_skills SET mob_skill_name = 'call_wyvern' WHERE mob_skill_id = 3843;"):
            with self.subTest(statement=statement):
                self.save(statement)
                with self.assertRaisesRegex(RuntimeError, 'spawns monsters'):
                    exists.check_module_sql(str(self.tree), self.index)

    def test_unreadable_selection_or_unknown_column_stops(self):
        for statement in ("DELETE FROM mob_skill_lists WHERE skill_list_id > 700;",
                          "UPDATE mob_skill_lists SET new_column = 734 WHERE skill_list_id = 734;",
                          "DELETE FROM mob_skill_lists WHERE unknown_column = 734;"):
            with self.subTest(statement=statement):
                self.save(statement)
                with self.assertRaises(RuntimeError):
                    exists.check_module_sql(str(self.tree), self.index)

    def test_a_nonspawning_skill_update_does_not_treat_its_value_as_an_id(self):
        self.save('UPDATE mob_skills SET mob_skill_id = 7340 WHERE mob_skill_id = 3843;')
        exists.check_module_sql(str(self.tree), self.index)


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'needs pinned source tree')
class ActualExistsSqlTests(unittest.TestCase):
    def test_all_loaded_skill_mutations_preserve_spawn_routes(self):
        tree = os.environ['CHECKMATE_SOURCE_TREE']
        index = exists.Index(tree, content.Content(True, content.DEFAULT_ON))
        exists.check_module_sql(tree, index)


if __name__ == '__main__':
    unittest.main()
