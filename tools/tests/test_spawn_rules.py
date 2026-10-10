"""Native lottery and ferry routes keep exact spawn IDs and conditions."""
from pathlib import Path
import os
import sys
import unittest
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import encounters, exists, overlays, placeholders, spawn_rules, zones


class SpawnRulesTests(unittest.TestCase):
    def test_weighted_slot_keeps_exact_ph_and_cooldown(self):
        document = {'slots': [{'members': {100: {}, 101: {'chance': 15, 'cooldown': 3600}, 102: {}}}]}
        pairs, facts = spawn_rules.native_slots(document, {100, 101})
        self.assertEqual([(ph, nm) for ph, nm, _ in pairs], [(100, 101)])
        self.assertEqual((pairs[0][2]['chance'], pairs[0][2]['cooldown_min']), (15, 3600))
        self.assertNotIn(100, facts)
        self.assertIn('restart', ' '.join(facts[101]['notes']))

    def test_native_slot_does_not_treat_every_alternative_as_a_lottery_ph(self):
        self.assertEqual(spawn_rules.native_slots({'slots': [{'members': {100: {}, 101: {}}}]}, {100, 101}), ([], {}))
        pairs, facts = spawn_rules.native_slots({'slots': [{'members': {100: {}, 101: {'chance': 20}}}]}, {100})
        self.assertEqual((pairs, facts), ([], {}))

    def test_unknown_or_duplicate_slot_rules_fail(self):
        cases = [
            {'slots': [{'members': {100: {}, 101: {'chance': 15, 'condition': 'unknown'}}}]},
            {'slots': [{'members': {100: {}, 101: {'chance': 101}}}]},
            {'slots': [{'members': {100: {'chance': 15}}}]},
            {'slots': [{'members': {100: {}, 101: {'chance': 15}}}, {'members': {101: {}}}]},
            {'slots': [{'members': {100: {}, 101: {'chance': 15}}, 'condition': 'unknown'}]},
        ]
        for document in cases:
            with self.subTest(document=document), self.assertRaises(RuntimeError):
                spawn_rules.native_slots(document, {100, 101})

    def ferry(self, entry):
        return ('local slots = { ' + entry + ' }\nzoneObject.onZoneTick = function(zone)\n'
                'xi.ferry.onZoneTick(zone, slots)\nend')

    def test_ferry_selects_only_exact_deck_copy(self):
        facts = spawn_rules.ferry_entries(self.ferry('{id=ID.mob.FISH[2]}'), {'FISH': [100, 101, 102]})
        self.assertEqual(set(facts), {101})
        self.assertIn('210-630', ' '.join(facts[101]['notes']))

    def test_night_and_weather_ferry_slots_have_distinct_fades(self):
        night = spawn_rules.ferry_entries(self.ferry('{id=ID.mob.NIGHT, night=true}'), {'NIGHT': [100]})[100]
        weather = spawn_rules.ferry_entries(self.ferry('{id=ID.mob.RAIN, weather={xi.weather.RAIN,xi.weather.SQUALL}}'), {'RAIN': [100]})[100]
        self.assertIn('20:00 to 03:59', ' '.join(night['notes']))
        self.assertNotIn('210-630', ' '.join(night['notes']))
        self.assertIn('Rain or Squall', ' '.join(weather['notes']))
        self.assertIn('weather ends', ' '.join(weather['notes']))
        self.assertNotIn('210-630', ' '.join(weather['notes']))

    def test_unreadable_or_duplicate_ferry_entry_fails(self):
        for entry in ('{id=ID.mob.FISH}', '{id=ID.mob.FISH[3]}',
                      '{id=ID.mob.FISH[1],chance=15}',
                      '{id=ID.mob.FISH[1]},{id=ID.mob.FISH[1]}'):
            with self.subTest(entry=entry), self.assertRaises(RuntimeError):
                spawn_rules.ferry_entries(self.ferry(entry), {'FISH': [100, 101]})

    def test_only_positive_bounded_respawn_calls_are_spawn_proof(self):
        for value, expected in [('math.randomInt(120, 180)', True), ('utils.hours(2)', True),
                                ('math.randomInt(0, 180)', False), ('math.randomInt(180, 120)', False),
                                ('math.randomInt(minimum, 180)', False), ('0', False)]:
            with self.subTest(value=value):
                text = 'local nm = GetMobByID(ID.mob.NM)\nnm:setRespawnTime(%s)' % value
                refs = exists.Refs(text, 'TEST').strict_refs
                self.assertEqual(bool(refs.keys), expected)


@unittest.skipUnless(os.environ.get('CHECKMATE_SOURCE_TREE'), 'CHECKMATE_SOURCE_TREE not set')
class SpawnSourceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tree = Path(os.environ['CHECKMATE_SOURCE_TREE'])
        cls.roots = overlays.data_roots(cls.tree)

    def test_loaded_native_valkurm_rules_replace_removed_lua_ph_calls(self):
        doc = overlays.load_merged(self.tree, self.roots, 'zones/valkurm_dunes/mobs')
        pairs, facts = spawn_rules.native_slots(doc, doc['spawns'])
        actual = {(ph & 0xfff, nm & 0xfff): rule for ph, nm, rule in pairs}
        self.assertEqual(set(actual), {(330, 334), (458, 460)})
        for rule in actual.values():
            self.assertEqual((rule['chance'], rule['cooldown_min'], rule['cooldown_max']), (15, 3600, 3600))
        self.assertEqual(set(key & 0xfff for key in facts), {334, 460})

    def test_all_eight_ferry_tables_resolve_and_exclude_fished_copies(self):
        reader = spawn_rules.Reader(self.tree)
        count = 0
        for zone in sorted(spawn_rules.FERRY_ZONES):
            doc = overlays.load_merged(self.tree, self.roots, 'zones/' + zone.lower() + '/mobs')
            keys = exists.id_keys(self.tree, zone, zones.id_tables(doc['spawns']))
            facts = reader.ferry(zone, keys)
            count += len(facts)
            if zone.startswith('Ship_bound'):
                self.assertNotIn(keys['SEA_PUGIL'][0], facts)
                self.assertNotIn(keys['SEA_MONK'][0], facts)
                self.assertIn(keys['SEA_PUGIL'][1], facts)
                self.assertIn(keys['SEA_MONK'][1], facts)
        self.assertEqual(count, 66)

    def test_native_slot_semantics_are_guarded(self):
        for (relative, name), expected in encounters.NATIVE_GUARDS.items():
            if relative in ('src/map/spawn_slot.cpp', 'src/map/spawn_handler.cpp'):
                self.assertEqual(encounters.native_digest((self.tree / relative).read_text(encoding='utf8'), name), expected, name)

    def test_changed_ferry_helper_fails_before_publishing_routes(self):
        original = Path.read_text
        def changed(path, *args, **kwargs):
            text = original(path, *args, **kwargs)
            return text.replace('currentTime + 180', 'currentTime + 181') if path == self.tree / spawn_rules.FERRY else text
        with mock.patch.object(Path, 'read_text', changed), self.assertRaisesRegex(RuntimeError, 'deck rules changed'):
            spawn_rules.Reader(self.tree).ferry('Ship_bound_for_Selbina', {})

    def test_removed_known_ferry_callback_requires_review(self):
        original = Path.read_text
        relative = 'scripts/zones/Ship_bound_for_Selbina/Zone.lua'
        def changed(path, *args, **kwargs):
            text = original(path, *args, **kwargs)
            return text.replace('xi.ferry.onZoneTick(zone, slots)', '') if path == self.tree / relative else text
        with mock.patch.object(Path, 'read_text', changed), self.assertRaisesRegex(RuntimeError, 'route changed'):
            spawn_rules.Reader(self.tree).ferry('Ship_bound_for_Selbina', {})


if __name__ == '__main__':
    unittest.main()
