"""Skill YAML follows native rank defaults, cap bounds and loaded module order."""
import copy
import json
import os
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import tables


class SkillTableTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='checkmate_skill_tables_')
        self.addCleanup(self.temp.cleanup)
        self.tree = Path(self.temp.name)
        self.write('modules/init.txt', 'era/data\nsecond/data\n')
        self.write_yaml('data/enums/skill_type.yaml', {'values': {'none': 0, 'sword': 3, 'evasion': 29, 'blue_magic': 43}})
        self.write_yaml('data/enums/job.yaml', {'values': {'none': 0, 'war': 1, 'blu': 16, 'mon': 23}})
        self.rank_ids = {'none': 0, **{name: rank for rank, name in enumerate(tables.SKILL_CAP_RANKS, 1)}}
        self.write_yaml('data/enums/skill_rank.yaml', {'values': self.rank_ids})
        self.data = {'skills': {'ranks': {'sword': {'war': 'a_plus'}, 'blue_magic': {'blu': 'a'}},
                                'caps': {level: {name: level * 10 + rank for name, rank in self.rank_ids.items() if rank}
                                         for level in range(1, 100)}}}
        self.save()

    def write(self, name, text):
        path = self.tree / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding='utf8')

    def write_yaml(self, name, value):
        # JSON is also YAML, and keeps fixture keys and scalar types explicit.
        self.write(name, json.dumps(value))

    def save(self):
        import yaml
        self.write('data/skills.yaml', yaml.safe_dump(self.data))

    def test_native_defaults_and_rank_g(self):
        self.data['skills']['ranks']['evasion'] = {'war': 'g'}
        self.save()
        caps, ranks = tables.read_skill_tables(self.tree)
        self.assertEqual(len(caps), 100)
        self.assertEqual(caps[0], [0] * 13)
        self.assertEqual(caps[75][0], 0)
        self.assertEqual(caps[75][12], 762)
        self.assertEqual(ranks[29]['war'], 12)
        self.assertEqual(ranks[3]['blu'], 0)
        self.assertEqual(ranks[63]['war'], 0)
        self.assertEqual(ranks[43]['none'], 0)

    def test_loaded_overlays_merge_in_order(self):
        self.write_yaml('modules/era/data/skills.yaml', {'skills': {'ranks': {'blue_magic': {'blu': 'b_plus'}},
                                                                  'caps': {75: {'a_plus': 850}}}})
        self.write_yaml('modules/second/data/skills.yaml', {'skills': {'ranks': {'blue_magic': {'blu': 'c'}}}})
        self.write_yaml('modules/disabled/data/skills.yaml', {'skills': {'ranks': {'sword': {'war': 'g'}}}})
        caps, ranks = tables.read_skill_tables(self.tree)
        self.assertEqual(ranks[43]['blu'], 7)
        self.assertEqual(ranks[3]['war'], 1)
        self.assertEqual(caps[75][1], 850)
        self.assertEqual(caps[75][2], 752)

    def test_missing_cap_field_stops_like_strict_native_reader(self):
        del self.data['skills']['caps'][75]['g']
        self.save()
        with self.assertRaisesRegex(RuntimeError, 'Missing'):
            tables.read_skill_tables(self.tree)

    def test_incomplete_or_out_of_range_levels_stop(self):
        original = copy.deepcopy(self.data)
        for level, value in ((75, None), (0, {}), (100, {})):
            with self.subTest(level=level):
                self.data = copy.deepcopy(original)
                if value is None:
                    del self.data['skills']['caps'][level]
                else:
                    self.data['skills']['caps'][level] = value
                self.save()
                with self.assertRaisesRegex(RuntimeError, 'every level'):
                    tables.read_skill_tables(self.tree)

    def test_unknown_tokens_stop(self):
        for ranks in ({'new_skill': {'war': 'a'}}, {'sword': {'new_job': 'a'}}, {'sword': {'war': 'new_rank'}},
                      {'sword': {'war': ['a']}}):
            with self.subTest(ranks=ranks):
                self.data['skills']['ranks'] = ranks
                self.save()
                with self.assertRaisesRegex(RuntimeError, 'Unknown'):
                    tables.read_skill_tables(self.tree)

    def test_invalid_cap_values_and_unknown_columns_stop(self):
        original = copy.deepcopy(self.data)
        for value in (-1, 65536, True, 1.5, '25'):
            with self.subTest(value=value):
                self.data = copy.deepcopy(original)
                self.data['skills']['caps'][75]['a_plus'] = value
                self.save()
                with self.assertRaisesRegex(RuntimeError, 'Invalid skill cap'):
                    tables.read_skill_tables(self.tree)
        self.data = original
        self.data['skills']['caps'][75]['new_rank'] = 25
        self.save()
        with self.assertRaisesRegex(RuntimeError, 'unknown'):
            tables.read_skill_tables(self.tree)

    def test_changed_rank_enum_stops(self):
        self.rank_ids['g'] = 13
        self.write_yaml('data/enums/skill_rank.yaml', {'values': self.rank_ids})
        with self.assertRaisesRegex(RuntimeError, 'rank enum changed'):
            tables.read_skill_tables(self.tree)

    def test_duplicate_named_skill_or_job_aliases_stop(self):
        self.write_yaml('data/enums/skill_type.yaml', {'values': {'sword': 3, 'sword_alias': 3}})
        self.data['skills']['ranks'] = {'sword': {'war': 'a'}, 'sword_alias': {'war': 'b'}}
        self.save()
        with self.assertRaisesRegex(RuntimeError, 'Duplicate skill rank'):
            tables.read_skill_tables(self.tree)
        self.write_yaml('data/enums/job.yaml', {'values': {'war': 1, 'war_alias': 1}})
        self.data['skills']['ranks'] = {'sword': {'war': 'a', 'war_alias': 'b'}}
        self.save()
        with self.assertRaisesRegex(RuntimeError, 'Duplicate skill job'):
            tables.read_skill_tables(self.tree)

    def test_duplicate_numeric_cap_level_keys_stop(self):
        self.data['skills']['caps']['75'] = {'a_plus': 850}
        self.save()
        with self.assertRaisesRegex(RuntimeError, 'Duplicate skill cap level'):
            tables.read_skill_tables(self.tree)

    def test_old_sql_module_cannot_silently_override_yaml(self):
        self.write('modules/init.txt', 'era/sql/old_skill.sql\n')
        self.write('modules/era/sql/old_skill.sql', 'UPDATE skill_ranks SET war = 2 WHERE skillid = 3;')
        with self.assertRaisesRegex(RuntimeError, 'move to YAML'):
            tables.read_skill_tables(self.tree)

    def test_native_rank_lookup_clamps_high_rank_and_level(self):
        lookup = tables.Tables.__new__(tables.Tables)
        lookup.skill_caps, lookup.skill_ranks = tables.read_skill_tables(self.tree)
        self.assertEqual(lookup.max_skill(3, 'war', 100), 991)
        self.assertEqual(lookup.cap_by_rank(255, 255), 1002)


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'needs pinned source tree')
class ActualSkillTableTests(unittest.TestCase):
    def test_loaded_era_skill_ranks_and_caps(self):
        caps, ranks = tables.read_skill_tables(os.environ['CHECKMATE_SOURCE_TREE'])
        self.assertEqual(ranks[43]['blu'], 1)
        self.assertEqual(ranks[3]['blu'], 2)
        self.assertEqual(ranks[1]['pup'], 3)
        self.assertEqual(ranks[25]['rng'], 2)
        self.assertEqual(caps[75][2], 269)
        self.assertEqual(caps[75][7], 225)
        self.assertEqual(caps[71][9], 202)
        self.assertEqual(caps[72][3], 242)
        self.assertEqual(caps[73][4:6], [241, 233])


if __name__ == '__main__':
    unittest.main()
