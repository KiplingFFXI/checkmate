"""Native math readers follow function bodies, not one return-type spelling."""
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from export import source_parity, stats, weapons


MEVA = '''{
    uint8 mlvl = std::min<uint8>(PMob->GetMLevel(), 99);
    if (PMob->objtype == TYPE_TRUST)
    {
        return battleutils::GetMaxSkill(12, mlvl);
    }
    return battleutils::GetMaxSkill(7, mlvl);
}'''


class NativeMathReaderTests(unittest.TestCase):
    def test_meva_accepts_both_return_styles(self):
        for header in ('uint16 GetMagicEvasion(CMobEntity* PMob)',
                       'auto GetMagicEvasion(CMobEntity* PMob) -> uint16'):
            with self.subTest(header=header):
                source_parity.check_magic_evasion(header + '\n' + MEVA)

    def test_meva_keeps_exact_rank_level_and_trust_rules(self):
        header = 'auto GetMagicEvasion(CMobEntity* PMob) -> uint16\n'
        for before, after in (('GetMaxSkill(7, mlvl)', 'GetMaxSkill(8, mlvl)'),
                              ('GetMaxSkill(12, mlvl)', 'GetMaxSkill(7, mlvl)'),
                              ('99)', '100)'), ('TYPE_TRUST', 'TYPE_PET')):
            with self.subTest(change=after):
                with self.assertRaisesRegex(RuntimeError, 'C-rank basis'):
                    source_parity.check_magic_evasion(header + MEVA.replace(before, after))

    def test_native_body_does_not_take_the_next_function(self):
        text = 'auto First() -> uint16\n{ return 7; }\nauto Second() -> uint16\n{ return 8; }'
        self.assertEqual(weapons.native_body(text, 'First'), '{ return 7; }')
        with self.assertRaises(RuntimeError):
            weapons.native_body('auto Missing() -> uint16;', 'Missing')

    def test_subjob_zones_accept_both_return_styles_and_stay_bounded(self):
        for header in ('bool CheckSubJobZone(CMobEntity* PMob)',
                       'auto CheckSubJobZone(CMobEntity* PMob) -> bool'):
            with self.subTest(header=header), tempfile.TemporaryDirectory() as folder:
                path = Path(folder, 'src/map/utils/mobutils.cpp')
                path.parent.mkdir(parents=True)
                path.write_text(header + '''
{
    constexpr auto zones = {xi::ZoneId::SouthGustaberg, xi::ZoneId::EastRonfaure};
    return false;
}
auto Other() -> bool { return xi::ZoneId::WestRonfaure; }
''', encoding='ascii')
                self.assertEqual(stats.load_subjob_zones(folder, {
                    'south_gustaberg': 107, 'east_ronfaure': 101, 'west_ronfaure': 100}),
                    {'south_gustaberg', 'east_ronfaure'})

    def test_subjob_zone_reader_rejects_unknown_zone(self):
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder, 'src/map/utils/mobutils.cpp')
            path.parent.mkdir(parents=True)
            path.write_text('auto CheckSubJobZone(CMobEntity* PMob) -> bool\n'
                            '{ return xi::ZoneId::Unsupported; }', encoding='ascii')
            with self.assertRaisesRegex(RuntimeError, 'enum lacks'):
                stats.load_subjob_zones(folder, {'south_gustaberg': 107})


if __name__ == '__main__':
    unittest.main()
