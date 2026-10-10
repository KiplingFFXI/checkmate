checkmate data exporter
=======================

This builds checkmate's monster data from the Phoenix server source. It reads one branch or commit of the
Phoenix git repo, calculates the supported monster stats and source notes, and writes the files the addon
loads.

  checkmate\data\zones\<zone id>.lua   one file per zone with monsters
  checkmate\data\bands.lua             typical accuracy, evasion, AGI and DEX by level, for monsters with no row
  checkmate\data\too_weak.lua          the highest monster level that checks Too Weak, by your main level
  checkmate\data\pets.lua              each jug pet's highest level, the avatars' names, the gear that narrows a
                                       jug pet's level and the Beast Affinity merit
  checkmate\data\steal.lua             the job that has Steal, the level it's learned at and the gear that
                                       adds to it
  checkmate\data\crit.lua              the Critical Hit Rate and Enemy Critical Hit Rate merits, the levels
                                       they count from and the gear that changes the crits you take

  checkmate\data\effects.lua           effect durations, removal rules, song gear and duration merits
  checkmate\data\modifiers.lua         supported equipped bonuses, merit ranks and effect uncertainty
  checkmate\data\defenses.lua          Shield and Parry rules, shield sizes, job ranks and gear conditions
  checkmate\data\pdif.lua              physical damage caps, level-correction zones and Defense effect warnings
  checkmate\data\blue_finder.lua       supported Blue lessons by spell, monster, zone and spawn context

It never changes the Phoenix repo. Every run copies the files it needs from the commit into a new temp folder
with git archive, reads that copy, and deletes it at the end. Nothing is reused from an earlier run.

The other scripts here show what changed between two builds of the data and get a new version ready to release.
A weekly job on GitHub runs them for you and opens a pull request when Phoenix changed a monster.


Setup (once)
------------

You need Python 3.12 and git, both on PATH. Run this from the project folder.

  python -m pip install -r tools\requirements.txt

That installs PyYAML and lupa. Both are required. Lupa compares the addon with Phoenix source math and loads
every generated file in LuaJIT. It also runs the report and the offline tests.

The exporter reads a git clone of https://github.com/phoenixffxi/Phoenix with its remote named phoenix. By
default it looks for one in a folder named Phoenix next to this project. This makes one there.

  git clone --origin phoenix https://github.com/phoenixffxi/Phoenix ..\Phoenix


Running
-------

Run it from the project folder. Fetch Phoenix first, so phoenix/live is the newest commit.

  git -C ..\Phoenix fetch phoenix
  python tools\export_data.py

It usually takes a few minutes. At the end it prints the commit it read, how many zone files and rows it wrote, their
total size and the biggest file, the level 75 row of bands.lua, where too_weak.lua came from, how many jug pets
and avatars pets.lua has and what Beast Affinity adds, how many pieces of Steal gear steal.lua has and the level
Steal is learned at, how many pieces of gear with critical hit evasion crit.lua has and what the two crit merits
add, the Effects source and icon counts, supported modifier items, source parity, the LuaJIT load check and how
long the run took.

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
- The jobs from the same chain, or from mob_pools for an instance monster, the same ones the stat math uses. A
  monster whose chain names no jobs, or an instance monster whose pool is 1/1, gets none in its row, though the
  server runs it as WAR/WAR, its default. So does a monster whose template a Phoenix module adds as WAR/WAR, since
  the modules write out every template's jobs, the 1/1 default included. A monster whose script, a helper it
  calls, one of its mixins or a battlefield group's mixin changes its job gets none either, since the data can't
  know which one it picked.
- The server's spawn math for accuracy, evasion, Defense, AGI, DEX, INT, MND and CHR at every level the monster can be,
  with its job traits.
- Each spawn's own level range from its level in the YAML, or minLevel and maxLevel for an instance monster,
  kept when it's narrower than the row's.
- The monster script's literal setMod, addMod, delMod, addImmunity and delImmunity calls at the top of
  onMobInitialize and onMobSpawn, in order, and the same calls at the top of any xi.* helper those call.
- Its own crit rate on you, the CRITHITRATE mod, from the same chain and those same calls. A monster with
  CRITICAL_HIT_EVASION, which would lower your crit, stops the export, since the Crit part doesn't count it.
- Whether it swings with TP moves in place of its normal hits from the moment it spawns: the ATTACK_SKILL_LIST mob
  mod from the chain, or a literal setMobSkillAttack at the top of onMobInitialize or onMobSpawn or of a helper
  they call. It doesn't count when its script, a helper it calls or one of its mixins can ever set it back to 0
  or to a list the reader can't read, like Tiamat landing.
- Whether it never swings from the moment it spawns: a literal setAutoAttackEnabled(false) at the top of
  onMobInitialize or onMobSpawn or of a helper they call, like the Memory Receptacles' in promyvion.lua. The
  helpers include xi.combat.behavior.disableAllActions and enableAllActions. It doesn't count when its script, a
  helper it calls or one of its mixins can ever turn the swings back on, or set its TP move list back to 0. A
  monster with either flag that can counter, from its job traits or the mods in its data, is marked too, since a
  counter crits like a normal swing.
- Phoenix's own Dynamis, read from modules/phoenix/dynamis/lua/dynamis_overrides.lua.
- Assault monsters from the instance SQL tables, at every level the four level caps allow, and the monsters
  in The Ashu Talif fights (The Black Coffin and Against All Odds) from the same tables.
- The monsters in the Nyzul Isle fights (Path of Darkness, Nashmeira's Plea, Waking the Colossus)
  from the same tables. Nyzul Isle Investigation is left out, because Phoenix hides it.
- The template's loot, with nonzero despoil weights added as extra kill rolls, since the server rolls them.
- The template's steal items from its loot block, one name or a list, kept even when a script turns its drops off.
- The UPDATE lines of the SQL modules in init.txt for job traits and skill ranks.
- Aggro from the same chain: aggressive, true_detection and the behavior flags, the detects list, and the
  ALWAYS_AGGRO, NO_AGGRO and DETECTION mob mods. The literal setAggressive, setTrueDetection and setMobMod calls
  at the top of onMobInitialize and onMobSpawn and their xi.* helpers count, and so do battlefield group mobMods.
  Instance monsters take aggro, true_detection and links from mob_pools, and a monster from an event-type pool
  with aggro set aggroes at any level.
- Links the way the server builds link parties when a zone loads: family among linkers, sublink, superlink, and
  force-linking in Dynamis and for battlefield monsters. A battlefield's groups in scripts/battlefields make new
  parties per arena when it starts, and a monster that several battlefields use gets the partners from each. A
  battlefield for a mission or quest whose expansion is off is left out, since no one can get in, like the ACP and
  AMK fights. The
  list follows the chain of helpers each helper calls in turn. Pets never help, monsters with NO_LINK and antlions
  waiting underground help only their superlink partners, and a one-way linker calls no one. An arena monster no
  battlefield names never spawns, so it links with no one, and neither does one its group's setup gives another
  battle ID, like a Limbus crate. A pet is the monster a setMobPet or setPet call names at a fixed offset, one that
  TABLE_PETS pairs through two ID tables, one HAND_PETS gives, a Dynamis master's, or one a Dynamis type's
  onMobInitialize helper gives a monster by name, like Dagourmarche's avatar. Each name keeps how it links
  (mob_entity.cpp CanLink): superlink when it shares the superlink of the monster calling it, or else
  sight, sound or both from its DETECTION once spawned, with true_ in front when it has true detection. One that
  neither sees nor hears goes by the other senses aggro shows instead, like magic, or neither when it has none of
  them, like a monster that only notices scent. An imp counts as hearing, since seeing too at night doesn't change
  how it links. The fomor patrols and guards in scripts/mixins/fomor_party.lua superlink each fomor of one with
  its leader, so each patrol or guard gets its own row.
- Only a spawn that ever comes up on Phoenix links (export\exists.py). One whose spawn type is scripted with no
  respawn time only comes up when something spawns it, so it counts when a battlefield names it, an enabled
  fishing_mob row names it, Phoenix's Dynamis tables or a statue's adds take it, it's in a Garrison pool, a monster
  that comes up makes it its pet, or a live script spawns it by its IDs.lua key, its id, its name in
  queryEntitiesByName, an offset from its own id, or as a leader's follower in an xi.follow.spawnFollowers table. A
  key a script looks up through zones[...] with the zone it runs in, like zones[mob:getZoneID()], counts in every
  zone. The live scripts are each zone's Zone.lua and the other Lua at the top of its folder, like globals.lua, the
  battlefields, scripts/globals, the module Lua modules\init.txt loads, the NPC scripts of placed NPCs whose content
  is on or that Phoenix's npc_visibility.lua shows, unless it hides them, the missions and quests whose expansion is
  on, and every placed monster's onMobInitialize. The rest of a monster's script, the scripts/globals functions it
  calls, its mixins and its mob skills only count once it comes up. Astral Flow calls the avatar at the summoner's
  ASTRAL_PET_OFFSET from its own id, 2 by default. A spawn that never comes up keeps its row, but links with
  no one and no one lists it.
- An instance monster only links in an instance players can get into: an Assault its scripts/assaults file
  registers, or one with a row in xi.instance.lookup in scripts/globals/instance.lua, and only up to the Assault
  rank Phoenix's assault_limits.lua allows. The rest, like Orichalcum Survey's Mineral Eaters, keep their rows.
- A monster that only an event's spawner brings up, like the Expeditionary Force, Garrison or a Pirate's Chart,
  links only inside that event, and a row that mixes them with other spawns splits into a row for each event and one
  for the rest. The Expeditionary Force and Garrison count as one event in a zone where their level caps match,
  since the server only compares the confrontation's power. A battlefield pool links only inside one room, the spawn points that chain within 90 yalms of each
  other (ROOM_GAP), so each Limbus floor is its own. A one-arena fight like a Limbus floor finds its monsters by
  name in the whole zone, so it leaves out the copies another floor brings up. An add or pet that waits near 0, 0, 0
  stands where the monster that spawns it stands. Any other pool member with no point of its own stands in the room
  of the members of its own kind, and the pool stays one room when they don't share one. An add that only its owner
  calls into a fight, and that the owner despawns when the fight ends, counts as a pet, like a Defender's Aura Gear.
  NEVER_TOGETHER holds the pairs that are never up at the same time.
- Link names are the names players see. A template or display name that is the script name plus a suffix shows as
  the script name, so Heraldic_Imp_CM with the script Heraldic_Imp is Heraldic Imp, and a script name that is the
  template or display name plus a suffix shows as that name, so Phantom_Puk spawned with the script
  Phantom_Puk_Clone is Phantom Puk. Otherwise the display name wins, and with none a spawn's own script wins over
  its template. A name with no script of its own that is another of the zone's names plus a label like CN or
  noroam shows as that name, and a job tag at the end goes, so Omaern_BST is Omaern. LINK_NAMES holds the few that
  still come out wrong, like Pandemonium Warden's avatar forms, which the game calls Pandemonium Lamp.
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
Changes to elemental ranks, elemental MEVA, magic damage, absorb or null mods get scripted_elements too. That
includes values picked at spawn and different values set by two battlefields. Unknown mod arguments and whole
stat recalculations keep both flags. General MEVA, status ranks and other stats alone do not mark Elements.
Weapon damage type, physical/ranged reduction, absorption and nullification changes get scripted_weapons.
Shared damage mods can mark both parts. Fixed group modifiers still apply when another modifier varies.
One with loot the script adds or switches gets scripted_drops. The launch extras in the six starter zones get exp_only when
Phoenix loads its launch module. Phoenix archived that module in 5ae559a62e7, so no row has exp_only now. One
whose aggro a script changes in a way the row can't hold gets scripted_aggro. A few mixins whose effect is known
give an aggro note instead.


The data files
--------------

Each zone file returns built, content, link_lists, monsters and by_name. link_lists holds each list of link
names once, grouped by how each one links and numbered from 1, because many rows share the same list.
Repeated danger entries and lists share local Lua tables only when every field matches, including conditions,
levels and notes. The returned tables have the same shape as before. Treat generated facts as read-only. A row in
monsters has these fields. Only name, ids and levels are always there.

  name        the monster's name, for people reading the file
  ids         the spawn indexes (id & 0xFFF) that share the row
  nm          true for a notorious monster
  job         its main and support job as the server sets them, like 'drk/war', or 'war/none' with no
              support job. Absent when the data names no job, and for a monster whose scripts change its job
              when it spawns, like the Trolls' automatons.
  levels      [level] = { acc, eva, agi, int, mnd, chr, dex, def, attack_skill } for every level it can be. Empty when the data
              holds no level for it.
  spawn_levels
              [spawn index] = { lowest, highest } level of each spawn whose own range is narrower than the
              row's, like { 17, 18 } for one Goblin Tinkerer in a row that runs 17 to 20. A spawn that isn't
              there spawns over the row's whole range. An Assault spawn's range takes in its levels under all
              four level caps.
  ph_for      [spawn index] = { NM spawn indexes } for each of its spawns that's a placeholder, the NMs that
              spawn can pop. Each NM is a row in the same file, so the addon takes its name from there. Absent
              when none of its spawns is a PH.
  ph_rules    [PH spawn index][NM spawn index] = { chance, cooldown_min, cooldown_max, conditions }.
              Chance is the source percent before server lottery multipliers. Cooldowns are seconds after the
              NM despawns, with a range for a random cooldown. NM-side overrides and kill-only exceptions
              are included. The notes describe the conditions found in the source. An
              unknown numeric value is absent. This never means the live lottery is open or that a timer is
              running. Existing ph_for identity still decides which spawns get a note.
  loot_conditions
              Conditions the source puts on the listed loot. Prudence only enables the surviving
              twin's drops after the other twin dies. Unread scripted loot remains marked by scripted_drops.
  level_mod   what its script adds to the level /check shows
  crit        the monster's own crit rate mod, in percent, added to its crit on you. The same at every level, or
              the export stops.
  tp_moves    true when it swings with TP moves from its list in place of normal hits from the moment it
              spawns, so its crit on you doesn't apply
  no_swings   true when it never swings from the moment it spawns, so its crit on you doesn't apply either
  counters    true on a tp_moves or no_swings row when it can counter, so its crit on you applies to its counters
  ranks       nonzero resistance ranks by element and status name
  meva        extra magic evasion. all is the plain MEVA mod over the level's base, the rest are by element or
              effect
  resist      resist trait values by effect (sleep, paralyze and so on). The chance is the value plus 5 percent.
  magic_dmg   how much more or less damage a damage spell does to it, in percent, like -25 for a quarter less.
              all is on top of every element and comes from the DMG, DMGMAGIC, DMGMAGIC_II and UDMGMAGIC mods
              together. The rest are by element, from the <element>_SDT mods.
  weapon_dmg  signed changes for slashing, piercing, blunt and hand_to_hand. Each SDT mod is divided by 100.
              These remain separate from general reductions and do not predict final attack damage.
  weapon_guard normal melee/ranged percentage changes, absorption chance and nullification chances. The
              nullification roll only happens if absorption fails. Weapon hover and Monster > Target details show these.
  absorb      the percent chance a damage spell heals it instead, for all magic or by element
  nullify     the percent chance a damage spell does nothing to it, for all magic or by element
  undead      true for the undead ecosystem
  immune      flat immunities by name, in display order
  drops       { rate, item } rolls and { rate, group = { { item, weight }, ... } } rolls, rates per mille
  steal       the item ids Steal can take, one picked at random each time. Absent when there's nothing to steal.
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
              name is there only when other monsters of its kind can join. Absent when nothing links with it,
              like a monster that never comes up on Phoenix. core\monsters.lua puts the groups in place when it
              loads the file, so the addon reads links as the groups.
  flags       scripted_drops, exp_only, scripted_stats, scripted_aggro, scripted_elements, scripted_weapons scripted_defense and scripted_attack_skill, when they apply

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

steal.lua returns built, content, ability, items and latents. ability holds the job that has Steal and the level
it's learned at, from Steal's row in abilities.sql. The server gives it to you with that job as your main or your
support job, once that job's level gets there. items[item id] holds steal, what that item adds to the STEAL mod in
item_mods, and level, the item's own level from item_equipment, since gear adds nothing while your main level is
under its level. latents[item id] holds the same for the gear whose Steal is a latent in item_latents, plus
hp_percent, since it only adds it while your HP is at or under that percent and your TP is under 100%. Rogue's
Ring is the only one. Only gear adds to the STEAL mod on Phoenix, and the export stops if anything else does.

crit.lua returns built, content, merits, level_caps and evasion_items. merits holds crit_hit_rate and
enemy_crit_rate, each with its id in the merit list the server sends, per_merit, what one merit adds to your crit
or takes off the crits you take, in percent, and most, the most merits you can have, from data/merits.yaml with the
module overlays merged in. Both are in the Others category, which counts on every job. level_caps holds
{ main level, cap } pairs, lowest level first. From that main level until the next pair, the server counts no more
than cap of your merits (merit.cpp GetMeritValue), and a level sync counts. evasion_items[item id] holds
crit_evasion, the CRITICAL_HIT_EVASION mod in item_mods, which takes that much off the crits you take, in percent,
and level, the item's own level from item_equipment, since gear does nothing while your main level is under its
level. A minus one raises them, like Toreador's Cape at -50. Gear is the only critical hit evasion checkmate counts.
A few status effects change it too, like Bewildered Daze, and so do Abyssea's atmas. KNOWN_LINES in export\crit.py
lets those through and says why. The export stops if a trait, a latent, a monster, module SQL or any other script
line gets it.


When it stops with an error
---------------------------

It stops instead of guessing. The message says what it couldn't read.

- "can't read these monster script calls" means a script changes a mod or immunity at spawn in a way the
  reader can't follow. Read the call. If its effect can't be known ahead of time, add it to KNOWN_UNREADABLE in
  export\mobscripts.py with the reason, and the monster gets scripted_stats. A magic damage call it can't read
  doesn't stop it, because the script picks that value in the fight. The monster gets scripted_elements.
- "changes a monster the exporter does not know about" means an NPC, zone or battlefield script changes a
  monster. Add the file to HAND in export\outside.py with what it does.
- "changes a job, which the exporter can't follow" names a line in a script or module that changes a job, on a
  monster or anyone else. If it's a monster's job, teach the readers to leave that monster's job out, like the
  mixin and mob script readers do for the Trolls' automatons, Fantoccini and Maat's pet. Then add the line to
  JOB_LINES in export\outside.py with the reason. It looks through every script the exporter copies and the
  module Lua modules\init.txt loads.
- "The Dynamis reader needs updating" or "The launch reader needs updating" means a Phoenix module changed
  shape. Look at export\dynamis.py or export\launch.py.
- An SQL module that changes skill caps, the instance tables or pet_list stops it too. See export\tables.py.
- "The pet reader needs updating", or another message from export\pets.py, means the jug pets, the avatars,
  JUG_LEVEL_RANGE or Beast Affinity changed shape on Phoenix, like Monster Gloves losing JUG_LEVEL_RANGE.
- "The steal reader needs updating", or another message from export\steal.py, means Steal's roll, its ability,
  getActiveJobLevel, the gear or latent that adds to it, a job trait, or a monster whose onSteal returns a fixed
  item changed on Phoenix. "changes what Steal takes or its chance" names a line that hooks Steal, changes or
  clears what a monster gives up, or touches the STEAL mod. If it changes nothing the addon shows, add the line to
  KNOWN_LINES in export\steal.py with the reason. It looks through every script but the tests and specs, and the
  module Lua modules\init.txt loads. GM commands aren't looked at either, since they only run when a GM types them.
  "changes Steal or the gear that adds to it" is module SQL.
  "has nothing next to an item in its steal list" and "names the same steal item twice" mean a template's steal
  list has a shape the addon can't print yet.
- "The crit reader needs updating", or another message from export\crit.py, means the two crit merits, their level
  caps or the gear with critical hit evasion changed on Phoenix, a latent, job trait or monster got critical hit
  evasion, or Yonin can load. Yonin is WotG, so Crit taken leaves it out. "changes critical hit evasion or the gear
  that has it" is module SQL. "changes your crit or a monster's crit on you in a way the exporter can't follow"
  names a line that names CRITICAL_HIT_EVASION or the ATTACK_SKILL_LIST mob mod anywhere, or a setMobSkillAttack or
  a setAutoAttackEnabled outside the mob scripts, mixins and helpers the readers follow. If it changes nothing a
  row holds, add the line to KNOWN_LINES in export\crit.py with the reason. It looks through the same scripts and
  modules as the steal check.
- "has a crit rate that changes with the level" means a monster's CRITHITRATE differs from one of its levels to
  another, which a row can't hold yet.
- "The item reader needs updating" or "The item reader can't read this item_mods line" comes from
  export\items.py, which the pet, steal and crit readers share. item_mods and item_equipment aren't guarded, since
  that would stop the weekly job for any item change, but it stops on any item_mods INSERT line it can't read and
  when an item with JUG_LEVEL_RANGE, STEAL, a STEAL latent or CRITICAL_HIT_EVASION has no level in item_equipment.
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
  fight or is one the reader already has. Add its pets to HAND_PETS too when they're always the same ones at fixed
  offsets, like Osschaart's. When the name is a Dynamis helper, a type's onMobInitialize makes a pet some other way
  than for one monster by name. Look at dynamis_pets in export\links.py.
- "Mixin ... changes links" means a mixin the exporter doesn't know changes links. Add it to MIXIN_NOTES or
  MIXINS_HELD in export\aggro.py with what it does.
- "sets up no groups the exporter can read" means a battlefield builds its groups in code. Add it to HAND in
  export\battlefields.py.
- "adds groups in code" means a battlefield adds groups once it's running (battlefield:addGroups). Add them to
  ADDED in export\battlefields.py.
- "turns links off in code" means a battlefield file sets a battle ID or NO_LINK outside a group setup the reader
  follows. Check what it does, hold a change that lasts in KNOWN_LINK_SCRIPTS in export\links.py, and add the file
  to CODE_LINKS in export\battlefields.py. "sets a battle ID on monsters it spawns later" means a spawned = false
  group's setup sets one, which their spawn clears.
- "has a missionArea the exporter can't read" or "has a questArea the exporter can't read" means a battlefield
  names a mission or quest log that MISSION_LOGS or QUEST_LOGS in export\battlefields.py doesn't have, or names it
  another way. Add the log with its folder in scripts/missions or scripts/quests.
- "The instance reader needs updating", or another message about xi.instance.lookup, the Assault enums,
  missionsByArea, content:register() or assault_limits.lua, means the instance entrances or Phoenix's Assault rank
  cap changed shape. Look at the top of export\instances.py and can_enter.
- "spawns monsters in a way the exporter can't read" names a mob skill that a monster that comes up uses, which
  spawns monsters without naming them by an offset, a key, an id or a name. Teach export\exists.py the form, the
  way astral_offsets reads Astral Flow. "names xi.mobSkill.X" means a script names a skill that
  scripts/enum/mob_skill.lua doesn't have, and "The mob skill reader needs updating" means that file changed shape.
- "reads mob ids in a way the exporter can't" means a zone's IDs.lua mob key uses GetFirstID or GetTableOfIDs in a
  form expr_ids in export\exists.py doesn't follow, or reads past the end of the ids. Teach expr_ids the form.
- "links.ASSIST_ONLY names ..." or "links.ASSIST_ONLY says only ... brings up" means an entry there went stale. Read
  the owner's script again and fix or drop the entry.
- "The Expeditionary Force reader needs updating", "The Garrison reader needs updating" or "a level cap the
  exporter can't read" means the level caps in expeditionary_force.lua or garrison_data.lua changed shape. Look at
  read_shared_caps in export\exists.py.
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
They are KNOWN_UNREADABLE and TURNS_WHILE_SWINGING in export\mobscripts.py, HAND and JOB_LINES in export\outside.py,
ID_SPLITS and LINK_NAMES in export\zones.py, KNOWN_SQL in export\tables.py, DESPAWN_HOOKS in export\dynamis.py,
SCRIPTED_DROPS and BAND_ONLY in export\instances.py, MIXIN_NOTES and MIXINS_HELD in export\aggro.py,
KNOWN_LINK_SCRIPTS, KNOWN_LINK_HELPERS, TABLE_PETS, HAND_PETS, KNOWN_PET_SCRIPTS, NEVER_TOGETHER and ASSIST_ONLY in
export\links.py, FOLDER_CONTENT in export\exists.py, HAND, ADDED, CODE_LINKS, MISSION_LOGS and QUEST_LOGS in
export\battlefields.py, KNOWN_LINES, KNOWN_FOLDERS and FIXED_STEAL in export\steal.py, and KNOWN_LINES in
export\crit.py.


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
an NM that only moved to a new spawn index isn't a change. Steal items are compared by name, so an item that only
moved in the list isn't a change. A changed job reads like DRK/DRK to DRK/WAR, with both jobs spelled out, or WAR
with no support job, or no job. The first report after the data got jobs leaves them out and says so. It also says
when pets.lua, steal.lua, crit.lua, effects.lua, modifiers.lua or blue_finder.lua changed, but not what in them. The build stamp in every file isn't a change
either. When nothing else changed, it says so and writes nothing.

  --report FILE    writes the report to a file instead of printing it
  --bullets FILE   writes a few lines for CHANGELOG.md too


The weekly job
--------------

.github\workflows\weekly-data.yml runs on GitHub every Monday at 12:17 UTC. It checks out main and clones the
newest commit of phoenix/live from https://github.com/phoenixffxi/Phoenix. The clone's remote is named phoenix,
so the exporter reads phoenix/live there the same way it does here. Then it runs export_data.py and compares the
new data with what's on main using data_report.py. It checks source parity and runs every exporter regression
and the offline addon suite before a version bump, commit or pull request. The offline tests use official
Ashita libraries pinned to commit 4171c74c8ddb2ca2a31654f199e6c1cee40d7256. A failed test stops the job.
Those tests do not verify live gameplay or server deployment.

If no monster changed, it stops there and the run shows green. A Phoenix commit that doesn't touch monster data
only changes the build stamp, so it doesn't count. A change to bands.lua, too_weak.lua, pets.lua, steal.lua or
crit.lua, effects.lua, modifiers.lua, pdif.lua, defenses.lua or blue_finder.lua counts the same as a changed monster.

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
- If you want to see it in game, switch to the branch on your PC, copy checkmate\ into your Phoenix addons
  folder and /check a monster from the report. The tests load the real data files
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

The builder checks an explicit list of runtime files, generated zones and original icon assets. Missing files,
extra files or folders, linked paths, private home paths and credential markers stop the build. Developer tests,
tools, settings, logs and notes are not release contents. Add a reviewed runtime file or zone to the manifest in
build_release.py when the package needs one. Keep assets\weapons\SOURCES.txt with the icons.

The zip uses fixed timestamps and permissions, so the same file contents produce the same SHA-256. It is checked
before replacing the previous zip. A failed build leaves that previous archive intact.


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
  export\exists.py        which spawns ever come up on Phoenix, and the event each one fights in
  export\battlefields.py  the groups each battlefield puts its monsters in
  export\placeholders.py  which spawns are placeholders and the NMs each one can pop
  export\ph_rules.py      source lottery chances, cooldown bounds and eligibility notes
  export\rows.py          the finished row for each monster kind
  export\bands.py         the level-band fallback
  export\pets.py          the jug pets, avatars, jug level gear and Beast Affinity for pets.lua
  export\steal.py         each row's steal items, the Steal gear and level for steal.lua, and the Steal checks
  export\crit.py          the crit merits and the gear with critical hit evasion for crit.lua, and the crit
                          checks
  export\effects.py       effect durations, status removal rules, source checks, gear and merits for effects.lua
  export\modifiers.py     equipped combat bonuses, merits and uncertainty from effects and latents
  export\weapons.py       source guards for native weapon damage math and loaded monster overrides
  export\info.py          identity, Charm eligibility, maximum estimates, movement, pursuit, rewards and traits
  export\encounters.py    spawn rules, claim shields, danger lists, Blue lessons and fight notes
  export\danger_effects.py harmful effects from effective move and spell callbacks
  export\danger_crit.py   critical-hit paths and the buffs they require
  export\danger_jobs.py   known routes to those buffs, including job-special configuration
  export\danger_attacks.py harmful additional effects on normal monster attacks
  export\blue_finder.py   source lesson locations from the finished enabled monster rows
  export\danger_details.py source geometry, shadow rules and selected removal options
  export\defenses.py      Shield and Parry rules, equipment, native skill inputs and rate comparison
  export\pdif.py          physical damage source guards, constants, Defense effect warnings and numeric comparison
  export\source_parity.py compares hand-kept tables and math with Phoenix source
  export\items.py         item mods and levels the pet, steal and crit readers share
  export\lua_writer.py    writes the Lua files
  check_source.py         source parity and all exporter regressions at one exact Phoenix ref
  data_report.py          what changed between two data folders, as markdown
  bump_version.py         the next addon.version and its CHANGELOG.md section
  build_release.py        the release zip and its SHA-256
  benchmark_danger_sharing.py compares flat and shared Lua data with identical source facts

  ..\.github\workflows\weekly-data.yml     the weekly job
  ..\.github\workflows\draft-release.yml   the draft release job


Effects
-------

effects.lua holds durations and removal rules for effects seen in action messages. It reads merged
status_effects.yaml and merits.yaml, core spell tables, item_mods.sql with loaded SQL updates, and the mob and
pet skill scripts with loaded era/Phoenix overrides. Spell rows follow the SQL content tags. The current
reader requires Phoenix's rotz/cop/toau content settings; a different era needs its own duration audit.

It writes effects, spells, abilities, skills, pacts, procs, proc_effects, proc_usual, gear, merits, pictured and
troubadour. pacts uses the pet_skill_id sent in the action packet, not the linked monster skill ID. A move
with several statuses also has by_effect, so each received effect uses its own duration. proc_effects keeps
a main-hand item from supplying an unrelated off-hand added effect's duration. A time the reader cannot
resolve stays absent and uses the effect's usual duration when one is known.

Random spell times keep their low and high values. Move times use a literal base or a readable random/TP
maximum. Usual times take the most common known duration, choosing the longer on a tie. The three duration
merits use the merged cost-list cap: Phoenix currently permits three ranks, not five. Sleep II and Lullaby
share Sleep's icon. Nightmare keeps its sleep row; its hidden Bio companion is not a separate packet row.

The checked duration helpers and loaded overrides have hashes of their comment-free source. A changed or
new override stops the export until the reader is updated. The guards also cover player-only hooks whose current code does not alter tracked monster durations. No arbitrary Lua is run.

Run the focused exporter checks with the same Python setup used above:

  python -m unittest discover -s tools/tests -p test_effects.py

To also check the actual extracted Phoenix tree, set CHECKMATE_EFFECTS_TREE to that tree's absolute path.
The full export also loads effects.lua in LuaJIT. These are source and offline checks;
they do not verify a live packet stream.


Source parity and conditional information
-----------------------------------------

Run the source checks without changing addon data or the Phoenix checkout:

  python tools\check_source.py --repo ..\Phoenix --ref phoenix/live

An exact commit works with --ref too. --tree PATH reads an already extracted source tree. The command runs
all exporter tests with actual source fixtures enabled. export_data.py also checks parity before building.

The parity gate compares the hand-kept spell choices, effect resistance fields, classic staff fallback and
level-based magic evasion with source tables. It executes Phoenix's own magic, Treasure Hunter and physical damage functions
against the addon over boundary and range cases. Tests change source values and formulas to
confirm these mismatches stop the build. Comment-free guards cover the surrounding helpers and reviewed
module overrides. A changed guard requires reading the new behavior, not just accepting a new hash.

pdif.lua stores the loaded era caps, level-correction zone list and the tracked default setting. It does not
read the server's untracked configuration. For a zone outside that list, the addon covers both correction
settings when they produce different results. The generated per-level def field includes family rank,
VIT, job traits, fixed modifiers and supported initialize/spawn changes. Defense uses the native integer
rounding rules. scripted_defense marks changes that depend on a fight, a helper, a mixin or a battlefield.
Observed effects that can change Defense warn about their unknown strength instead of applying a guess.
Ranged estimates are before the distance penalty. Neither estimate is final hit damage or weapon-skill damage.

The physical comparison runs the pinned functions and the loaded era curve across normal and critical
cases, with and without level correction. It covers every random branch, rounded endpoints and the spike.
The addon displays normal-hit ranges; critical cases also test the shared formula boundaries.

modifiers.lua follows merged item mods and merits for supported equipment at level 75 or below. Runtime
also checks the player's level. Direct staff bonuses include eligible nonclassic items, without counting
the old classic staff table twice. Latents and effects with unavailable powers are labeled as unknown.
Source parity separately checks the generated staff fields against merged item_mods.

PH rules use the same enabled callbacks and verified PH/NM pairs as ph_for. Sandstorm gates and Citipati's
next-respawn night gate are described beside the lottery. The pinned helper does not enforce its dayOnly
option, so Leshonki's note says so. The NM's callback can replace the helper's cooldown: the loaded era
module supplies nine enabled lottery cooldowns, including Valkurm Emperor's 60 minutes, and bypasses the
server cooldown multiplier for them. Citipati, Black Triple Stars, Shii and Manes start their cooldown only
after a kill.
Fradubio's module saves its deadline across restarts. These callbacks and the helper are guarded; changed
or new lottery-state code stops the export for review. The addon cannot know the NM's last despawn,
shared lottery state or deployed server multipliers from this source snapshot.

Prudence's loot condition is guarded against changes to its script or a loaded module that names it. The
other scripted_drops rows remain qualified; this is not a complete interpreter of dynamic fight loot.

Weapon damage source checks
---------------------------

The physical type values come from YAML resists.dmg_physical, or the instance SQL SDT columns, then the
same inherited, spawn and group modifiers as the rest of the row. SQL h2h_sdt maps to HTH_SDT. A value
that changes by level stays in that level's fields. Runtime does not choose one without an exact level.

Normal melee and ranged reductions follow their separate native functions. They are not multiplied
into the four type values. Those functions, the type mapping and the reviewed loaded monster overrides
have source guards. A changed guard stops export until its behavior is reviewed. An older extracted
tree without src/map/utils/battleutils.cpp must be extracted again. The source pin remains explicit.

Monster information
-------------------

Each row can contain info sections with a short value and notes. info_by_index contains only sections
that differ for a particular spawn. The existing row grouping and combat fields stay the same.

The source schema stays the same. Display rows for each fact have independent chat and overlay switches.
Pursuit is selected on Aggro. Charm joins Elements, Weapons and Immunities in one Weaknesses row, with
separate component choices for each display. Blue combines lessons and spell chance using separate
chat/overlay choices; its stand-in spell stays in magic.schools.blue.spell. core.parts migrates old grouped
settings before defaults merge. Monster keeps the other controls and searchable Target details. Source
build reporting remains available through /checkmate info. Appearance combines chat colors and window
style. Abbreviations keeps the existing stored word keys so saved custom text remains available.

info.py keeps the whole inherited attribute chain, including per-spawn attributes. Charm is eligibility,
not success or duration. HP/MP are source maximum estimates by level, using native job formulas, fixed
overrides, initial modifiers, job traits and default server settings. They never estimate current HP/MP.
An onMobSpawn health modifier does not itself call UpdateHealth; those values and other unresolved
callbacks receive uncertainty notes. Encounter scaling and deployed settings can change the maximum.

Movement and attack traits are stored baselines, not a safe kiting rule or a TP timer. Scent tracking is
separate from initial detection and is not an immediate deaggro promise. Crystals and seals have their
own eligibility conditions. No-drops, EXP suppression and excluded encounters are shown. Mug's native
spawn reset can replace an initialize-time purse; the remaining purse and personal payout are unknown.

Gil details require the effective CanDropGil gate after native setup and parsed spawn changes.
A negative GIL_MAX blocks amounts, bonus and Mug notes. No-drops and EXP gates do not block ordinary
gil; Mug alone does not prove a kill drop. Unresolved gil callbacks and encounter overrides omit gil
claims. SQL instances use effective instance mob modifiers, not inherited species-only modifiers.
Per-spawn gil eligibility stays with the matching spawn index. Generic reward text does not imply gil.

encounters.py reads source spawn conditions and loaded move lists. Dangers matches those candidates to
harmful effects and critical-hit paths from the effective move and spell scripts. Shared helpers and
loaded replacements count; self-buffs do not become player debuffs. Existing reviewed threat notes stay.
Critical paths that need a buff are listed only when that monster has a supported route to the buff.
Ordinary attacks get a separate entry when supported source callbacks add harmful effects. Native gates,
enspell priority and required buffs still apply. Undefined selectors and unreadable attack callbacks stay
unknown. Move checks and known fight restrictions still apply. Source guards and full-script census tests stop
changed helper behavior and new unreadable patterns for review. Missing handlers and unresolved
encounter setup remain gaps, not a claim that the monster is safe. This is not a next-action forecast.

Each danger has its own ID, kind, summary, conditions, categories and optional practical details.
Coverage distinguishes a resolved list, partial coverage and unresolved lists, with the reasons kept
separate from general conditions. Ordinary spell level ranges stay inclusive and retain gaps. Forced
casts bypass those ranges; script-selected exceptions keep their conditions. Fixed literal local move
lists are resolved only when every assignment is readable, including Ladybug and Uragnite state lists.
Provable scripted spell-list switches keep the possible fixed lists and their level limits. Phase changes,
dynamic choices and copied spells retain their conditions or an unresolved reason.

danger_details.py reads source activation ranges, effect radii or cone lengths and shadow behavior.
These are base source rules, not live safe distances. Scripted geometry is flagged. Shadow counts can
apply per hit or damage step, and area damage and Blink have separate rules. Selected removal spells
and items keep their source conditions: Doom removal can fail, and Erase picks a random eligible timed
ailment. The addon does not check inventory or recasts. Source guards cover the native targeting rules,
effective callbacks, removal scripts and tables; unreadable metadata stays unknown.

Blue Magic separates possible lessons from the client's learned-spell state. A resolved source move list
with no lessons says 'No learnable Blue spells'. An unresolved list keeps 'Unknown' and a specific reason;
it is never treated as no lessons. Known candidates remain listed when coverage is incomplete, with a
note that additional lessons are unknown. A listed spell does not guarantee that the monster will choose
its move or the player will learn it. The client marks each possible spell known, not learned or
spellbook unknown without requests.
Each exported lesson also records its BLU spell level and minimum current Blue Magic skill. The minimum
comes from the native skill cap at that spell level, less 31, floored at zero. The spell level is not a
minimum learning level. The addon can filter confirmed learned spells and show the client inputs read
with the result, but does not decide full eligibility or predict a learning roll. An incomplete flag
keeps filtered lists from claiming all possible lessons are known.
Each lesson also keeps its monster move IDs. The optional observer reads completed action packets,
including misses and resists, without requesting actions. Native function and category guards check
the packet mapping and interruption rules. It clears observations for dead or missing identities,
zoning and disabling tracking. It records observation only; charmed monsters and hidden eligibility
conditions cannot all be determined from these packets. Saved manual details refresh only the move
marker, preserving the captured spellbook state, stat inputs and their timestamp.
blue_finder.lua uses those finished Blue sections, including per-spawn overrides, from enabled monster rows.
Each location keeps its exact level ranges, move IDs, incomplete-list flag and source lesson, spawn and fight
notes. Locations merge only when those facts match. Missing levels stay unknown. The catalogue is a list of
supported source locations, not a complete list of teachers or a check for live spawns. Runtime loads it when
the finder opens, reads the client spellbook for the unlearned filter, and sends no game commands.

To measure sharing without mixing in new features, benchmark_danger_sharing.py writes flat and shared copies
of the same zone tables. It compares every returned value and measures LuaJIT load time and retained heap.
It also checks the finder against every lesson/spawn context in the generated zones. Timings are offline
measurements on the machine running the script, not in-game frame-time measurements.

Claim shields describe their source configuration, not a live countdown. Hidden pop timers and battle
state remain unknown.

Both readers guard the reviewed native functions, helpers and loaded modules. A source mismatch stops
the export for review. Re-extract an older source tree when the new native files are missing. Run the
full check_source.py gate before regeneration; test_info.py and test_encounters.py are the focused tests.


Shield and Parry
----------------

defenses.lua records source shield sizes, job skill ranks and the supported direct and conditional Parry
bonuses for equipment at level 75 and below. This follows Phoenix's level cap. The client skill totals already contain skill merits and active skill gear. The server adds the
PARRY modifier again in its Parry formula; the addon follows that second addition separately. Unknown
latent activation or augments cannot be treated as a known bonus. Shield Mastery changes TP and interruption
protection, not the block chance. Newly enabled skill or rate traits stop the export for review.

The per-level attack_skill value is the monster's actual native main-weapon skill used by Shield. It is
not Accuracy. A monster whose weapon skill is None has zero here. Standard melee skills use the native
B+ cap, capped at level 99. Parry instead uses the Lua A+ cap, including its increase after level 99.
scripted_attack_skill marks job changes and weapon types that the exporter cannot establish.

Both values describe eligible ordinary melee attacks, not a fraction of every incoming attack. Shield
requires a shield, a job with Shield skill, facing the attacker and no preventing status. Parry also
requires engagement and a main weapon other than hand-to-hand. The native Lua binding ignores the extra
argument used by the helper, so Charm is included among preventing statuses in this source revision.
Reprisal uses its fixed skill and block multipliers. Other unobserved buff powers remain qualified.

The parity check runs the pinned helpers against the addon across skill differences, shield sizes, caps,
Reprisal and additive bonuses. Their 1..10,000 roll is preserved as a rate rounded down to 0.01%.
