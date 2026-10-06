checkmate data exporter
=======================

This builds checkmate's monster data from the Phoenix server source. It reads one branch or commit of the
Phoenix git repo, works out every monster's numbers the way the server does, and writes the files the addon
loads.

  checkmate\data\zones\<zone id>.lua   one file per zone with monsters
  checkmate\data\bands.lua             typical accuracy, evasion and AGI by level, for monsters with no row
  checkmate\data\too_weak.lua          the highest monster level that checks Too Weak, by your main level
  checkmate\data\pets.lua              each jug pet's highest level, the avatars' names, the gear that narrows a
                                       jug pet's level and the Beast Affinity merit

It never changes the Phoenix repo. Every run copies the files it needs from the commit into a new temp folder
with git archive, reads that copy, and deletes it at the end. Nothing is reused from an earlier run.

The other scripts here show what changed between two builds of the data and get a new version ready to release.
A weekly job on GitHub runs them for you and opens a pull request when Phoenix changed a monster.


Setup (once)
------------

You need Python 3.12 and git, both on PATH. Run this from the project folder.

  python -m pip install -r tools\requirements.txt

That installs PyYAML and lupa. The exporter only needs PyYAML, and with lupa it also loads every file it writes in
LuaJIT as a check. data_report.py needs lupa.

The exporter reads a git clone of https://github.com/phoenixffxi/Phoenix with its remote named phoenix. By
default it looks for one in a folder named Phoenix next to this project. This makes one there.

  git clone --origin phoenix https://github.com/phoenixffxi/Phoenix ..\Phoenix


Running
-------

Run it from the project folder. Fetch Phoenix first, so phoenix/live is the newest commit.

  git -C ..\Phoenix fetch phoenix
  python tools\export_data.py

It takes about a minute. At the end it prints the commit it read, how many zone files and rows it wrote, their
total size and the biggest file, the level 75 row of bands.lua, where too_weak.lua came from, how many jug pets
and avatars pets.lua has and what Beast Affinity adds, how the LuaJIT load check went and how long the run took.

Every argument is optional.

  --repo PATH                 the Phoenix git checkout to read from
                              (default ..\Phoenix, the Phoenix folder next to this project)
  --ref REF                   the branch or commit to read (default phoenix/live, the branch the
                              Phoenix server runs)
  --out FOLDER                the addon's data folder to write into (default checkmate\data)
  --restrict-content on|off   the server's RESTRICT_CONTENT setting (default on)
  --content TAGS              the ENABLE_<TAG> settings that are on, as a comma list (default rotz,cop,toau).
                              Every tag not listed is off.

The live server's settings/main.lua isn't in git, so the content settings are arguments. The defaults are
Phoenix's. Every file's header names the ref, the commit and the content settings, and /checkmate info prints
them.


What goes into a row
--------------------

- The zone's data/zones/<zone>/mobs.yaml with every module overlay in modules/init.txt merged over it, the way
  the server's temp_patch/lsb-yaml.patch merges them.
- The species chain from data/ecosystems.yaml, then the template, then the spawn.
- The server's spawn math for accuracy, evasion, AGI, INT, MND and CHR at every level the monster can be, with
  its job traits.
- Each spawn's own level range from its level in the YAML, or minLevel and maxLevel for an instance monster,
  kept when it's narrower than the row's.
- The monster script's literal setMod, addMod, delMod, addImmunity and delImmunity calls at the top of
  onMobInitialize and onMobSpawn, in order, and the same calls at the top of any xi.* helper those call.
- Phoenix's own Dynamis, read from modules/phoenix/dynamis/lua/dynamis_overrides.lua.
- Assault monsters from the instance SQL tables, at every level the four level caps allow, and the monsters
  in The Ashu Talif fights (The Black Coffin and Against All Odds) from the same tables.
- The monsters in the Nyzul Isle fights (Path of Darkness, Nashmeira's Plea, Waking the Colossus)
  from the same tables. Nyzul Isle Investigation is left out, because Phoenix hides it.
- The template's loot, with nonzero despoil weights added as extra kill rolls, since the server rolls them.
- The UPDATE lines of the SQL modules in init.txt for job traits and skill ranks.
- Aggro from the same chain: aggressive, true_detection and the behavior flags, the detects list, and the
  ALWAYS_AGGRO, NO_AGGRO and DETECTION mob mods. The literal setAggressive, setTrueDetection and setMobMod calls
  at the top of onMobInitialize and onMobSpawn and their xi.* helpers count, and so do battlefield group mobMods.
  Instance monsters take aggro, true_detection and links from mob_pools, and a monster from an event-type pool
  with aggro set aggroes at any level.
- Links the way the server builds link parties when a zone loads: family among linkers, sublink, superlink, and
  force-linking in Dynamis and for battlefield monsters. A battlefield's groups in scripts/battlefields make new
  parties per arena when it starts, and a monster that several battlefields use gets the partners from each. The
  list follows the chain of helpers each helper calls in turn. Pets never help, monsters with NO_LINK and antlions
  waiting underground help only their superlink partners, and a one-way linker calls no one. An arena monster no
  battlefield names never spawns, so it links with no one. A pet is the monster a setMobPet or setPet call names
  at a fixed offset, one that TABLE_PETS pairs through two ID tables, or a Dynamis master's. Each name keeps how
  it links (mob_entity.cpp CanLink): superlink when it shares the superlink of the monster calling it, or else
  sight, sound or both from its DETECTION once spawned, with true_ in front when it has true detection. One that
  neither sees nor hears goes by the other senses aggro shows instead, like magic, or neither when it has none of
  them, like a monster that only notices scent. An imp counts as hearing, since seeing too at night doesn't change
  how it links. The fomor patrols and guards in scripts/mixins/fomor_party.lua superlink each fomor of one with
  its leader, so each patrol or guard gets its own row.
- Link names are the names players see: the template's display_name or name, less a suffix the spawn's script
  name doesn't have, so Heraldic_Imp_CM with the script Heraldic_Imp is Heraldic Imp.
- Magic damage from the same chain: the dmg_magic block of the YAML resists, the sdt columns of mob_resistances
  for an instance monster, the mods a battlefield group sets when its fight starts, and the literal calls on the
  damage taken, absorb and null mods at the top of onMobInitialize and onMobSpawn. The row holds what they come
  to the way damage_multipliers.lua and damage_spell.lua use them on a damage spell.
- Placeholders the way xi.mob.phOnDespawn in scripts/globals/mobs.lua finds them. A spawn is a PH when its own
  onMobDespawn calls phOnDespawn for an NM and that NM's phList holds the spawn's id. The NM it can pop is the one
  the list gives for it. Both halves count, since a few list entries only keep one NM from popping while another
  is up, and a call does nothing when the list doesn't hold the spawn. The PH, the NM its despawn rolls for and
  the NM that pops all have to be monsters the server makes, so an NM whose content is off isn't one. No Dynamis
  monster is a PH, since Phoenix's Dynamis replaces their onMobDespawn. A loaded module can wrap a PH's
  onMobDespawn, or swap it for one that calls phOnDespawn for the same NMs the way pxi_nm_spawn_points.lua does.
  A module that touches a phList, or changes onMobDespawn or phOnDespawn any other way, stops the export. NMs that
  pop some other way, like one that grows out of a monster or comes after enough kills, have no PHs here.

A monster whose script or mixin changes its numbers, ranks or immunities during a fight gets scripted_stats.
One whose script or mixin changes its magic damage, absorb or null mods during a fight, or picks them when it
spawns, gets scripted_elements, and so does one that two battlefields give different values. One with loot the
script adds or switches gets scripted_drops. The launch extras in the six starter zones get exp_only when
Phoenix loads its launch module. Phoenix archived that module in 5ae559a62e7, so no row has exp_only now. One
whose aggro a script changes in a way the row can't hold gets scripted_aggro. A few mixins whose effect is known
give an aggro note instead.


The data files
--------------

Each zone file returns built, content, link_lists, monsters and by_name. link_lists holds each list of link
names once, grouped by how each one links and numbered from 1, because many rows share the same list. A row in
monsters has these fields. Only name, ids and levels are always there.

  name        the monster's name, for people reading the file
  ids         the spawn indexes (id & 0xFFF) that share the row
  nm          true for a notorious monster
  levels      [level] = { acc, eva, agi, int, mnd, chr } for every level it can be. Empty when the data holds
              no level for it.
  spawn_levels
              [spawn index] = { lowest, highest } level of each spawn whose own range is narrower than the
              row's, like { 17, 18 } for one Goblin Tinkerer in a row that runs 17 to 20. A spawn that isn't
              there spawns over the row's whole range. An Assault spawn's range takes in its levels under all
              four level caps.
  ph_for      [spawn index] = { NM spawn indexes } for each of its spawns that's a placeholder, the NMs that
              spawn can pop. Each NM is a row in the same file, so the addon takes its name from there. Absent
              when none of its spawns is a PH.
  level_mod   what its script adds to the level /check shows
  ranks       nonzero resistance ranks by element and status name
  meva        extra magic evasion. all is the plain MEVA mod over the level's base, the rest are by element or
              effect
  resist      resist trait values by effect (sleep, paralyze and so on). The chance is the value plus 5 percent.
  magic_dmg   how much more or less damage a damage spell does to it, in percent, like -25 for a quarter less.
              all is on top of every element and comes from the DMG, DMGMAGIC, DMGMAGIC_II and UDMGMAGIC mods
              together. The rest are by element, from the <element>_SDT mods.
  absorb      the percent chance a damage spell heals it instead, for all magic or by element
  nullify     the percent chance a damage spell does nothing to it, for all magic or by element
  undead      true for the undead ecosystem
  immune      flat immunities by name, in display order
  drops       { rate, item } rolls and { rate, group = { { item, weight }, ... } } rolls, rates per mille
  aggro       true when it aggroes on its own
  any_level   true when it aggroes you even when it checks Too Weak (ALWAYS_AGGRO)
  no_aggro    true when NO_AGGRO is on at spawn, so it never aggroes
  detects     how it finds you, from sight, sound, magic, low_hp and ability, in that order. Only with aggro.
  true_detect true when it sees through Sneak and Invisible. Only with aggro.
  ambush      true when it aggroes inside 3 yalms unless you have Sneak. Only with aggro.
  aggro_note  sleeps (asleep and passive outside aggro_hours), night_sight (hears by day and sees too from 18:00
              to 5:59), form (passive in ball form), apkallu (aggressive at the zone's apkallu hate tier 2),
              fomor_hate (aggroes only with fomor hate) or underground (aggroes only above ground)
  aggro_hours { first, last } awake hour for sleeps, so { 6, 20 } is awake from 6:00 to 20:59. Absent when the
              monster never wakes.
  links       the number of its list in link_lists. The list holds the names of the monsters that can end up
              in its fight, in groups by how each one links: superlink (it shares the superlink of this monster
              or of another one in its fight, and joins from anywhere), sight (sees but doesn't hear, so it has
              to face the fight), sound (hears but doesn't see), both, magic (neither sees nor hears, but notices
              magic) and neither (notices none of what aggro shows, like a monster that only notices scent).
              sight, sound and both have true_ in front for a monster with true detection. The groups are written
              in the order superlink, sight, true_sight, sound, true_sound, both, true_both, magic, neither, and
              each one is sorted. A name is in two groups when monsters with that name link two ways. Its own
              name is there only when other monsters of its kind can join. Absent when nothing links with it.
              core\monsters.lua puts the groups in place when it loads the file, so the addon reads links as the
              groups.
  flags       scripted_drops, exp_only, scripted_stats, scripted_aggro and scripted_elements, when they apply

When a monster's level range crosses a job trait's level, its resist values change with the level. Then resist
sits in each level's entry instead of on the row. meva does the same for the few monsters whose spawn script sets
their magic evasion outright. magic_dmg, absorb and nullify would too, but none of them changes with the level
today. by_name stays empty because every era monster has a fixed index.

too_weak.lua returns built, content and highest. highest[your main level] is the highest monster level plus
level_mod that checks Too Weak to you, the way charutils.cpp CheckMob works it out. It runs the experience table
and /check curve the server loads: the pre-2011 ones in modules/era/lua/globals/toau_experience_points.lua when
content is restricted and WotG is off, and the stock ones otherwise.

pets.lua returns built, content, jugs, avatars, jug_range_items and beast_affinity. jugs[name] is each jug pet's
own highest level, by the name the game shows, from the pet_list rows with a time, which are the ones the server
makes a jug pet. avatars holds the names of a summoner's avatars and spirits, the pet ids LoadPet in petutils.cpp
types as an avatar, since those never get the pet part. jug_range_items[item id] holds cut, how many levels that
item takes off how far under its highest level a jug pet can come out, from the JUG_LEVEL_RANGE mod in item_mods,
and level, the item's own level from item_equipment, since it only counts at that level or higher.
beast_affinity holds the merit's id in the merit list the server sends, the levels each merit adds and the most
merits you can have, from data/merits.yaml with the module overlays merged in.


When it stops with an error
---------------------------

It stops instead of guessing. The message says what it couldn't read.

- "can't read these monster script calls" means a script changes a mod or immunity at spawn in a way the
  reader can't follow. Read the call. If its effect can't be known ahead of time, add it to KNOWN_UNREADABLE in
  export\mobscripts.py with the reason, and the monster gets scripted_stats. A magic damage call it can't read
  doesn't stop it, because the script picks that value in the fight. The monster gets scripted_elements.
- "changes a monster the exporter does not know about" means an NPC, zone or battlefield script changes a
  monster. Add the file to HAND in export\outside.py with what it does.
- "The Dynamis reader needs updating" or "The launch reader needs updating" means a Phoenix module changed
  shape. Look at export\dynamis.py or export\launch.py.
- An SQL module that changes skill caps, the instance tables or pet_list stops it too. See export\tables.py.
- "The pet reader needs updating", or another message from export\pets.py, means the jug pets, the avatars,
  JUG_LEVEL_RANGE or Beast Affinity changed shape on Phoenix. item_mods and item_equipment aren't guarded, since
  that would stop the weekly job for any item change, but the reader stops on any item_mods INSERT line it can't
  read, when Monster Gloves lose JUG_LEVEL_RANGE and when an item with it has no level in item_equipment.
- "The addon has no words for that yet" means a monster links by senses LINK_WAYS doesn't list, like
  magic_low_hp. Add it to LINK_WAYS in export\rows.py, and to LINK_WAYS and LINK_WORDS in
  checkmate\core\aggro.lua.
- "can't read these link changes" means a script changes links at spawn in a way the reader can't follow. If it
  changes neither the names nor how each one links, or its effect is known, add it to KNOWN_LINK_SCRIPTS or
  KNOWN_LINK_HELPERS in export\links.py. A superlink also needs a reader, like fomor_superlinks, since it can
  leave every name the same and still turn a tag into (Superlink).
- "The fomor party reader needs updating", or another message about fomor_party.lua or onPartySpawn, means the
  fomor patrols and guards changed shape on Phoenix. Look at fomor_superlinks in export\links.py.
- "sets a pet the exporter can't read" means a monster script makes a pet some other way. Add it to TABLE_PETS
  in export\links.py when it pairs pets through ID tables, or to KNOWN_PET_SCRIPTS when its pet depends on the
  fight or is one the reader already has.
- "Mixin ... changes links" means a mixin the exporter doesn't know changes links. Add it to MIXIN_NOTES or
  MIXINS_HELD in export\aggro.py with what it does.
- "sets up no groups the exporter can read" means a battlefield builds its groups in code. Add it to HAND in
  export\battlefields.py.
- "has a mod the exporter can't read" or "sets ... to a value the exporter can't read" means a battlefield
  group's mods table changed shape. Look at read_group in export\battlefields.py and group_damage_mods in
  export\zones.py.
- A changed sleep_at_night table or experience curve stops it too. See export\aggro.py.
- "The PH reader needs updating" means a monster script, a zone's IDs.lua or a loaded module sets up a
  placeholder in a way export\placeholders.py can't follow, a module changes which NMs a placeholder can pop, or
  an NM a placeholder can pop has a row name that isn't the one players see, like one from a template with a
  suffix. The message names the file or the zone. Teach the reader the new form, rebuild, and check the
  placeholders that changed with data_report.py.

The few cases the exporter can't read from source sit in short hand lists, each entry with its reason.
They are KNOWN_UNREADABLE in export\mobscripts.py, HAND in export\outside.py, ID_SPLITS in export\zones.py,
KNOWN_SQL in export\tables.py, DESPAWN_HOOKS in export\dynamis.py, SCRIPTED_DROPS and BAND_ONLY in
export\instances.py, MIXIN_NOTES and MIXINS_HELD in export\aggro.py, KNOWN_LINK_SCRIPTS, KNOWN_LINK_HELPERS,
TABLE_PETS and KNOWN_PET_SCRIPTS in export\links.py and HAND in export\battlefields.py.


Seeing what changed
-------------------

data_report.py compares two copies of the data folder and says what changed. Copy checkmate\data somewhere
before you rebuild it, then compare the copy with the new data. In PowerShell, run these from the project folder.
The first line deletes the copy from last time, so each run starts fresh.

  Remove-Item -Recurse -Force $env:TEMP\data_before -ErrorAction SilentlyContinue
  Copy-Item -Recurse checkmate\data $env:TEMP\data_before
  python tools\export_data.py
  python tools\data_report.py $env:TEMP\data_before checkmate\data

It names the Phoenix build each copy came from, then goes zone by zone through every monster that's new, gone or
changed, and says which fields changed. When a monster's drops changed, it shows each item's chance before and
after at TH 0 to 4, worked out with the addon's own core\drops.lua. Link lists are compared by the names in
them and how each one links, in the addon's words, so a list that only got a new number isn't a change. A
placeholder is compared by its spawn index and the names of the NMs it can pop, like "330 for Valkurm Emperor", so
an NM that only moved to a new spawn index isn't a change. It also says when pets.lua changed, but not what in it.
The build stamp in every file isn't a change either. When nothing else changed, it says so and writes nothing.

  --report FILE    writes the report to a file instead of printing it
  --bullets FILE   writes a few lines for CHANGELOG.md too


The weekly job
--------------

.github\workflows\weekly-data.yml runs on GitHub every Monday at 12:17 UTC. It checks out main and clones the
newest commit of phoenix/live from https://github.com/phoenixffxi/Phoenix. The clone's remote is named phoenix,
so the exporter reads phoenix/live there the same way it does here. Then it runs export_data.py and compares the
new data with what's on main using data_report.py.

If no monster changed, it stops there and the run shows green. A Phoenix commit that doesn't touch monster data
only changes the build stamp, so it doesn't count. A change to bands.lua, too_weak.lua or pets.lua counts the
same as a changed monster.

If a monster changed, it gets a new version ready. It adds one to the last number of addon.version in
checkmate\checkmate.lua, so 1.0.0 becomes 1.0.1. It puts a section for that version at the top of CHANGELOG.md
that says "Monster data rebuilt from phoenix/live <commit> (<date>).", with the date of that Phoenix commit, and a
few bullets from the report. bump_version.py does both. Then it commits the new data, the version and the
changelog on a branch named data-refresh-<commit> and opens a pull request into main with the report as its
description. If a pull request from that branch is already open, it leaves it alone, so one Phoenix commit never
gets two.


The pull request
----------------

Nothing changes for players until you merge it. Before you do, look at these.

- The report. Each monster it names should line up with a change on Phoenix's side, somewhere on phoenix/live
  between the two commits at the top of the report.
- The new CHANGELOG.md section. The bullets are only a start, and that section becomes the release notes, so edit
  it on the branch if it should read better.
- If you want to see it in game, switch to the branch on your PC, copy checkmate\ over
  C:\Games\PhoenixXI\addons\checkmate and /check a monster from the report. The tests load the real data files
  too, so run_tests.bat on the branch tells you if a row the tests spot check moved.

If you don't want the change, close the pull request. The job opens a new one the next Monday, as long as main
still has different data from phoenix/live.

If Phoenix moved on before you merged, there can be two of these open at once. Both bump the same version, so
merge the newest one and close the older one. If you merged the older one first, close the newer one too and run
Weekly data refresh by hand. It opens a new pull request on top of the new main.


Merging it
----------

Merge the pull request on GitHub. Any of the merge buttons works. Then pull main on your PC so your copy has the
new data and version too.


The draft release
-----------------

.github\workflows\draft-release.yml runs when a push to main changes addon.version in checkmate\checkmate.lua,
and merging the weekly pull request does that. It runs build_release.py and makes a draft release named
v<version> with checkmate-<version>.zip attached and that version's CHANGELOG.md section as its notes. Only you
and anyone else with write access to the repo can see a draft, and its tag isn't made until it's published. If
that version already has a release, draft or published, it does nothing.

A version you bump by hand works the same way. Change addon.version, add a section for it to CHANGELOG.md and
push to main. The job stops with an error if CHANGELOG.md has no section for that version.

To build the zip on your PC, run this from the project folder.

  python tools\build_release.py

It writes dist\checkmate-<version>.zip and prints its SHA-256. --out FOLDER writes it somewhere else. The zip
holds the checkmate\ addon folder, with checkmate.lua at checkmate\checkmate.lua, so it unzips straight into
Ashita's addons folder. It also puts LICENSE from the project folder in there as checkmate\LICENSE, so every copy
of the addon carries the license.


Publishing the release
----------------------

On the repo's Releases page, click the pencil on the draft, read over the notes and click Publish release. Leave
Set as the latest release ticked. When you publish it, GitHub makes the tag v<version> on the commit the zip was
built from.


Running a job by hand
---------------------

On GitHub, open the repo's Actions tab, pick Weekly data refresh or Draft release on the left, click Run
workflow, leave the branch on main and click the green Run workflow button. The weekly job then runs right away
instead of waiting for Monday. Draft release run by hand drafts the version that's on main, unless that version
already has a release.

GitHub turns off a scheduled job in a public repo after 60 days with no activity in the repo. If that happens,
the Actions tab shows a button to turn it back on.


The one repo setting
--------------------

GitHub doesn't let a job open pull requests until you allow it. On the repo, go to Settings > Actions > General.
Under Workflow permissions, tick "Allow GitHub Actions to create and approve pull requests" and click Save. That's
the only setting the jobs need. Each one asks for its own write access in its file.

Both jobs name the branch main, so the repo's branch has to be called main.


What's here
-----------

  export_data.py          the entry point, arguments and summary
  export\tree.py          the git archive copy of the ref
  export\overlays.py      init.txt data roots and the YAML merge
  export\content.py       content gating
  export\sqlfile.py       reads SQL dump rows
  export\tables.py        skill caps, skill ranks, job grades, job traits and enums, with module SQL applied
  export\species.py       the ecosystem, family and species chain
  export\stats.py         the spawn math
  export\lua_source.py    reads Lua handlers and the calls in them
  export\mobscripts.py    what a monster's scripts, mixins and helpers do to it
  export\outside.py       changes other scripts make to monsters
  export\dynamis.py       Phoenix's Dynamis override
  export\launch.py        the starter zone launch extras
  export\zones.py         rows for YAML zones, Limbus, battlefields and Dynamis
  export\instances.py     rows for Assault, The Ashu Talif and the Nyzul Isle mission fights, from SQL
  export\drops.py         loot rolls
  export\aggro.py         aggro fields and the Too Weak table
  export\links.py         link parties, the names a monster links with and how each one links
  export\battlefields.py  the groups each battlefield puts its monsters in
  export\placeholders.py  which spawns are placeholders and the NMs each one can pop
  export\rows.py          the finished row for each monster kind
  export\bands.py         the level-band fallback
  export\pets.py          the jug pets, avatars, jug level gear and Beast Affinity for pets.lua
  export\lua_writer.py    writes the Lua files
  data_report.py          what changed between two data folders, as markdown
  bump_version.py         the next addon.version and its CHANGELOG.md section
  build_release.py        the release zip and its SHA-256

  ..\.github\workflows\weekly-data.yml     the weekly job
  ..\.github\workflows\draft-release.yml   the draft release job
