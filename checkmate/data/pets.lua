-- Jug pets by the name the game shows, with each one's own highest level, a summoner's avatars and spirits
-- by name, the gear that narrows a jug pet's level, and the Beast Affinity merit.
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- [name] = the jug's own highest level, before Beast Affinity and your main level cap it
    jugs = {
        ['AcuexFamiliar'] = 119, ['AgedAngus'] = 104, ['AlluringHoney'] = 115, ['AmbusherAllie'] = 75,
        ['AmiableRoche'] = 110, ['AmigoSabotender'] = 85, ['AnklebiterJedd'] = 116, ['AntlionFamiliar'] = 50,
        ['AttentiveIbuki'] = 109, ['AudaciousAnna'] = 95, ['BeetleFamiliar'] = 45, ['BlackbeardRandy'] = 117,
        ['BloodclawShasr'] = 99, ['BouncingBertha'] = 105, ['BrainyWaluis'] = 113, ['BraveHeroGlenn'] = 119,
        ['BugeyedBroncha'] = 99, ['CaringKiyomaro'] = 116, ['ChopsueyChucky'] = 85, ['ChoralLeera'] = 119,
        ['ColdbloodComo'] = 65, ['ColibriFamiliar'] = 117, ['CourierCarrie'] = 75, ['CrabFamiliar'] = 55,
        ['CraftyClyvonne'] = 90, ['CrudeRaphie'] = 99, ['CursedAnnabelle'] = 118, ['DapperMac'] = 99,
        ['DaringRoland'] = 119, ['DipperYuly'] = 99, ['DiscreetLouise'] = 99, ['DroopyDortwin'] = 103,
        ['EftFamiliar'] = 45, ['EnergizedSefina'] = 119, ['FaithfulFalcor'] = 99, ['FatsoFargann'] = 99,
        ['FleetReinhard'] = 117, ['FlowerpotBen'] = 63, ['FlowerpotBill'] = 40, ['FlowerpotMerle'] = 99,
        ['FluffyBredo'] = 119, ['FlytrapFamiliar'] = 40, ['FunguarFamiliar'] = 65, ['GenerousArthur'] = 119,
        ['GooeyGerard'] = 99, ['GorefangHobs'] = 99, ['GussyHachirobe'] = 118, ['HareFamiliar'] = 35,
        ['HeadbreakerKen'] = 115, ['HeraldHenry'] = 113, ['Hip.Familiar'] = 119, ['Homunculus'] = 75,
        ['HurlerPercival'] = 116, ['JovialEdwin'] = 119, ['KeenearedSteffi'] = 55, ['Left-HandedYoko'] = 119,
        ['LifedrinkerLars'] = 75, ['LizardFamiliar'] = 45, ['LuckyLulush'] = 99, ['LullabyMelodia'] = 55,
        ['LynxFamiliar'] = 119, ['MailbusterCeta'] = 95, ['MayflyFamiliar'] = 45, ['MiteFamiliar'] = 55,
        ['MosquitoFamiliar'] = 119, ['NurseryNazuna'] = 86, ['P.CrabFamiliar'] = 119, ['PanzerGalahad'] = 75,
        ['PonderingPeter'] = 103, ['PrestoJulio'] = 93, ['RedolentCandi'] = 115, ['RhymingShizuna'] = 107,
        ['SaberSiravarde'] = 63, ['ScissorlegXerin'] = 105, ['SharpwitHermes'] = 119, ['SheepFamiliar'] = 35,
        ['ShellbusterOrob'] = 65, ['SlimeFamiliar'] = 119, ['SlipperySilas'] = 99, ['SpiderFamiliar'] = 118,
        ['StalwartAngelina'] = 119, ['SubmergedIyo'] = 118, ['SultryPatrice'] = 119, ['SunburstMalfik'] = 104,
        ['SurgingStorm'] = 118, ['SuspiciousAlice'] = 113, ['SweetCaroline'] = 119, ['SwiftSieghard'] = 94,
        ['SwoopingZhivago'] = 119, ['ThreestarLynn'] = 119, ['TigerFamiliar'] = 40, ['TurbidToloi'] = 99,
        ['VivaciousGaston'] = 119, ['VivaciousVickie'] = 116, ['VoraciousAudrey'] = 75, ['WarlikePatrick'] = 104,
        ['WeevilFamiliar'] = 119, ['Y.BeetleFamiliar'] = 119,
    },
    -- The names of a summoner's avatars and spirits, which never get the pet part
    avatars = {
        ['AirSpirit'] = true, ['Alexander'] = true, ['Atomos'] = true, ['Cait Sith'] = true,
        ['Carbuncle'] = true, ['DarkSpirit'] = true, ['Diabolos'] = true, ['EarthSpirit'] = true,
        ['Fenrir'] = true, ['FireSpirit'] = true, ['Garuda'] = true, ['IceSpirit'] = true,
        ['Ifrit'] = true, ['Leviathan'] = true, ['LightSpirit'] = true, ['Odin'] = true,
        ['Ramuh'] = true, ['Shiva'] = true, ['Siren'] = true, ['ThunderSpirit'] = true,
        ['Titan'] = true, ['WaterSpirit'] = true,
    },
    -- [item id] = the levels it takes off how far under its highest level a jug pet can be, and its own level
    jug_range_items = { [10698] = { cut = 2, level = 90 }, [14917] = { cut = 1, level = 75 },
                        [15110] = { cut = 1, level = 75 }, [23205] = { cut = 2, level = 99 },
                        [26993] = { cut = 2, level = 99 } },
    -- Beast Affinity: its id in the merit list the server sends, the levels each merit adds and the most merits
    beast_affinity = { id = 2564, per_merit = 2, most = 3 },
}
