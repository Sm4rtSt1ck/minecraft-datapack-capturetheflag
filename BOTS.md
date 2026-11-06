# BOTS.md

Working document of the **bots** feature: the plan, the decisions and the progress. Development
goes on the branch `bots`. Read it together with [CLAUDE.md](CLAUDE.md) (the project rules apply
here too). Update it at every stage: the status, the decisions taken, what the user checked in the
game. When the feature is done, move what stays true into CLAUDE.md / README.md and keep this
file only as history.

## Goal

A vote-phase option "play against bots": all players are in one team (random side, attack or
defense), the other team is made of bots (1-10, set on a lobby sign). Bots do what players do:

- defense: hide the flag, place traps, defend;
- attack: break the flag, carry it to the base;
- the same economy and shop rules as the players;
- fight with swords, bows, guns, grenades, the mace;
- drink potions, use totems and wind charges;
- choose an ultimate at the start of the round, charge it by the same rules, use it;
- play as a team, with simple tactics;
- fear a player in the suicide bomber ultimate (keep away from him);
- break traps or avoid them, when they can see them.

No mods: datapack only.

## Decisions (agreed with the user)

| Question | Decision |
| --- | --- |
| Side of the players | Random at the match start (attack or defense); the swap works as usual |
| Bot respawn | Like players: a dead bot is out until the end of the round; at the next freeze the
  alive ones go back to the base (healed, freeze effects, missing leather armor / sword), the dead
  ones come back |
| Bot body | A zombified piglin (see "Bot body"; was a husk until stage 6); the look is decided later |
| Button | Vote phase, hotbar slot 9 (`hotbar.8`), a villager head; glints when on |
| Bot count sign | 1 block west of the rounds sign: `LOBBY["sign_bots"]` = [-1, -40, 28] |
| Map knowledge | The bot markers in the template, copied at every clone (not the registry: it is a backup) |
| Anvil traps | Their own marker kind (AN): an anvil hangs from a ceiling, unlike the other traps |
| Own traps | Defense bots never set off their own traps (only attack bots touch traps), so a D spot may be on a T spot |
| Defense near the flag | Traps and defenders go to the spots near the flag more often, not always (weighted random) |
| High defense base | If the defense spawn is high above the lowest point of the map, defense bots buy mostly bows / guns (the height computed at build time from the map) |
| Marker glow | Only the bot markers of the kind held in the main hand glow (the solid markers unchanged) |

## Architecture

1. **A bot is a mob with vanilla AI**, not an armor stand moved by `tp`: vanilla pathfinding
   (ladders, steps, obstacles) can't be rebuilt with commands.
   - Targets without hits: a zombified piglin is a neutral mob, `AngryAt` (a UUID) loaded into its
     NBT sets its target right away (`internal/brain/aim`, `aim_player`). It never targets a
     player by itself (only one it is angry at), so the brain decides every target.
   - Moving to a point: a "lure" (an invisible unhurtable tiny rabbit) stands at the point and is
     the bot's target.
   - Spotting enemies: the brain itself (`internal/brain/spot`: the nearest enemy within SIGHT, in
     the line of sight: `los`, 1-block steps through passable blocks).
   - Vanilla limits: no doors (maps need openings), no gap jumps (done by the brain), path length
     limited by `follow_range` (long routes need waypoints), no chorus fruit / map teleports.
2. **Map knowledge is annotated, not computed.** Markers placed on the template with
   `admin:build/bots/get_tools` (flag, trap, anvil trap, defend spots, 4 attack routes) ARE the
   bots' knowledge: every clone of the map copies them into the arena as `marker` entities (tags
   `bot_flag`, `bot_trap`, `bot_anvil`, `bot_defend`, `bot_route_<r>` + `bot.idx`), so runtime picks
   are plain selectors (`sort=random`). `registry/maps.bolt` "bot" is only a backup (dump / show).
   In freeze the bots don't walk there: a spot is chosen and the flag / trap appears in it. Only
   annotated (so reachable) spots are used.
3. **"Fighters" instead of "players".** ~150 selectors in 78 files use `@a[tag=player/attack/
   defense]`; bots are not in `@a`. Every place is reviewed: round win (alive count), "no players
   -> match end", economy, kill credit. Inventory, shop UI and the death camera don't concern bots.
4. **Tick budget.** Every tick only cheap things (timers, the flag carrier). The bot "brain"
   (decisions, buying, target, shooting) runs 4 times a second, bots spread over the ticks
   (`tick % 5 == bot % 5`). Static code generated from the registries, no macros in hot paths.
5. **Kill credit:** bots get a `player_id`; a bot hit sets `kc.by` = the bot and a new `kc.src`
   (7 = bot) in the existing credit system; a player killing a bot: `player_killed_entity`.

### Bot body

A **zombified piglin**: holds items in both hands, wears armor, chases its target, hits with the
held item; a neutral mob, so its target is set by `AngryAt` without a hit (see above); doesn't
convert in water. Fire immune (vanilla: fire arrows / the Inferno blade / fire aspect don't burn it).
Until stage 6 it was a husk: its target could only be set by a hit "by" the target (retaliation),
which made the bots get hurt all the time, flicker, fight vanilla's own target picks.

### Planned layout

```
registry/
  bots.bolt          names / looks, buy profiles, role weights, difficulty (aim, reaction)
  maps.bolt          + per map: bot.flag_spots, bot.trap_spots, bot.defend_spots, bot.routes
src/data/
  ctf_bots/
    config.mcfunction
    api/             spawn_all, despawn, ...
    internal/        spawn/ death/ brain/ move/ combat/ buy/ (generated) flag/ traps/ ult/
    tick/            through #ctf:tick/*
    modules/gen.bolt
  ctf_lobby/         the button and the count sign
  ctf/               team split vs bots; fighters counted in the round rules (tags only)
  ctf_flag/ ctf_fight/ ctf_econ/ ctf_traps/ ctf_ult/   api for a bot carrier / killer / owner
  admin/build/       bot markers: flag, trap, defend, route point; prints lines for maps.bolt
```

### Performance estimate (10 bots)

- 10 husks with vanilla AI: a fraction of a millisecond.
- Brain: ~2 bots per tick x 50-100 commands: ~200 commands per tick.
- Gun rays: only a bot with a target, ~130 steps per shot, like a player shooting.
- Pathfinding: recomputed on a target change; the lure moves only at the next waypoint.

Expected 1-3 ms per tick (budget 50 ms). Measured at every stage with `/tick query` and
`/debug start`. Reserves: a slower brain, sleeping bots far from all players.

## Feasibility

| Item | Feasible | How |
| --- | --- | --- |
| Lobby button, sign, one team vs bots | easy | stage 1 |
| Hide the flag (defense) | easy | a random flag spot marker in freeze (done in stage 3) |
| Break, carry, deliver the flag | medium | lure to the flag spot; carrier tag, flag on the head, Glowing; then to `win_trigger`; `ctf_flag` api for a non-player carrier |
| Economy | easy | the same objectives and `registry/econ.bolt` rewards; money is a score on the bot |
| Shop, same rules | medium | no UI: a buy function generated from `registry/shop.bolt` (costs, round limits) and buy profiles; a virtual inventory (hands, armor, storage) |
| Sword, mace | vanilla | the husk hits with the held item; the mace smash only simplified |
| Guns | medium | `ctf_guns` ray from the bot's eyes to the target with spread, same damage |
| Bow | medium | summon an arrow with the motion to the target, owner = the bot |
| Grenades | medium | throw the `ctf_grenades` grenade in an arc (target behind cover / a group) |
| Potions | easy | at low health: the effect, one potion less |
| Totem | free | a vanilla mob with a totem in hand revives |
| Wind charge | medium | under the feet (jump back) or at the target |
| Ultimates | partly | the charge is the same; `bomber`, `trident`, `scale` feasible; `ghost`, `foot_eater` are player-specific: adapt or forbid for bots |
| Traps | medium | in freeze into trap / anvil spots through `ctf_traps`, owner = the bot; spots near the flag weighted higher |
| Avoid / break traps | medium | a trap display in sight (vanilla line of sight: `execute on target` style check or a short ray) and close: hit it by hand (removes it, like `ctf_traps:trap_hit`) or walk around it (the lure moves aside) |
| Fear the bomber | medium | a player with the bomber ultimate near: the bot runs away from him (the lure is put behind the bot, away from the bomber), until the ultimate ends |
| Teamwork, tactics | "decent bot" | roles (rush, flank, support, flag guard, choke guard), regroup, retreat at low HP, react to "flag taken" |

## Stages

Each stage is one commit, checked by the user in the game before the next one.

| # | Stage | Status |
| --- | --- | --- |
| 1 | Lobby and teams: button, count sign (1-10), all players in one random side; no bots yet | done |
| 2 | Bot body, melee: spawn, death (out until the round end), round win counts bots, kill credit, kill money; first TPS measurement | done |
| 3 | Map annotation: `admin:build` bot markers, `bot.*` in `maps.bolt`; the user annotates the first map | done |
| 4 | Movement and the flag: routes, attacking the flag, delivery (playable mode); defenders to defend spots (near the flag more often); the flag carrier chased from anywhere | done |
| 5 | Economy and shop: buy profiles from the registry; defense on a high base prefers bows / guns | done |
| 6 | Weapons: guns, bow, grenades, mace, potions, totem, wind charge | in progress |
| 7 | Traps: bots place them; see / avoid / break the enemy traps; kills of bots by a player's trap credited to him | in progress |
| 8 | Navigation graph: nav points (N) + all bot markers as nodes, links found after each clone (walk, narrow, jump, drop, ladder up / down), distance fields, bots move node by node | done, not tested (kept on; tactics use its distances) |
| 9 | Ultimates: charge, choice, use (adapt / forbid the player-only ones); fear a player in the bomber ultimate | later |
| 10 | Tactics (10a-10e below): perception and team memory, team brain and roles, fighting tactics, tricks and traits, difficulty | 10a-10d done (not tested), 10e later |
| 11 | Learning: from the players (imitation) and from the bots' results, in every match, kept per map | in progress |

## Progress log

### Stage 1 - lobby and teams

- Settings (objective `settings`, defaults in `ctf:set_default_settings`): `Bots` (0 off, 1 on),
  `Bots_count` (1-10, default 5).
- Button: `ctf_lobby:internal/vote/bots_button` (vote tick, as every lobby player: given by
  `bots_give` only when missing from `hotbar.8`; `custom_data.action:"bots"`, a `player_head`
  model with the `MHF_Villager` profile, glint when on); a click runs `bots_toggle` (redraws every
  lobby player's button, chat message to the lobby).
- New objective `bots` (`ctf:set_parameters`): the sign and the objective need one
  `/function ctf:set_parameters` (the sign is drawn by `update_signs` on reset).
- Count sign: `ctf_lobby:internal/settings/bots_count` (cycles 1..10), drawn by `update_signs`.
- Teams: `ctf:match/start` -> `ctf:match/teams/split` (as before) or `ctf:match/teams/vs_bots`:
  all players join a random team; score `team bots` = the team number of the bots (1 / 2, 0 = no
  bots). Until stage 2 the bot team is empty.

### Stage 2 - bot body, melee

- `registry/bots.bolt`: `NAMES` (10, ASCII), `BODY` (attributes), `ARMOR_COLOR`. `ctf_bots:gen`
  (entrypoint in `beet.json`) generates `internal/spawn/all` (one static summon per name, the first
  `Bots_count`) and `internal/spawn/armor_<side>`.
- A bot: a husk, tags `ctf_bot` + `attack` / `defense`, name `[Bot] <name>`, a golden sword like the
  players' default one (`custom_data.wpn`, so `ctf_econ:kill` pays its kill by the weapon), the team
  leather armor, no drops, NoAI in freeze, `attack_damage` 1 (+ the weapon = a player's damage),
  natural armor 0, no reinforcements, `follow_range` 64. A `player_id` like a player's.
- `ctf_bots:on/freeze_start` (`#ctf:on/freeze_start`, after `ctf_maps`): the missing bots are
  summoned (`internal/spawn/missing`: tag `ctf_bot_<i>` = the name; all at the first freeze, the
  dead ones later), the new ones get the side from `team bots` and `match rounds < swap rounds`
  (team_1 attacks first). Every bot (`internal/freeze_reset`, like a player in freeze): NoAI, full
  health (`Health`: regeneration doesn't heal undead), no fire, effects cleared, resistance; the
  missing leather pieces / golden sword (`internal/equip_<side>`, generated). Then
  `ctf_maps:api/call/spawn_bots` (new map event `spawn_bots`: `spreadplayers` of each side's bots
  with the side's spawn). Round start: AI on, resistance cleared.
- Speed: `movement_speed` 0.35 (a mob moves by speed^2 per tick, a player by 0.98 x speed: 0.35 ~ a
  sprinting player; a husk has 0.23).
- Traps: bots set them off like players (`ctf_traps:tick/combat`: touch near / under the anvil /
  web, the touching attack bot gets the trap's kill credit owner). Not yet: a bot killed by a trap
  isn't credited to the defender (stage 7).
- Flag (temporary, until stage 4): a random defense bot's position, `ctf_flag:api/place_here` (the
  same placing as a player's flag).
- Round win: `attack bots` = attack bots alive (`ctf_bots:internal/count`, every round tick and at
  freeze); `ctf:match/round/tick` wins for the defense only when no attack player and no attack
  bot is alive; the time-out reason counts bots too.
- Kills: a player kills a bot -> advancement `ctf_bots:killed` (`player_killed_entity`, husk with
  the tag) -> `kills` +1 and `just_killed` +1 (`ctf_fight:internal/kill`: money by weapon, ultimate
  points, loot tasks). A bot kills a player -> `ctf_fight:internal/killer` -> `ctf_bots:api/
  killed_player` (the victim's `dc.killer` = the bot: death subtitle with the bot's health, death
  camera turned to the bot; the bot's money by `ctf_econ:kill`).
- Removed on `#ctf:on/swap`, `match_end`, `reset` (`ctf_bots:on/remove`); woken on `round_start`.
- Not yet: bots don't break / carry the flag (stage 4), no shop (stage 5: they keep the golden
  sword), no grenade / trap kill credit for bots, bot kills are not in the kills sidebar.
- Known risk: a husk in water turns into a zombie (then a drowned) after ~30 s in water.

### Stage 3 - map annotation

- Markers (`admin:build/bots`, lobby only; build markers: `clear_markers` removes them, the entity
  clone skips them). Kinds in `admin:modules/bot_markers.bolt`:
  F flag spot (magenta), T trap spot (orange), AN anvil trap spot (brown, on a ceiling), D defend
  spot (cyan), R1..R4 attack routes (lime, yellow, light blue, pink). A new route point gets its
  number in the route (`build.idx`, `internal/route_index`, named `R<r>.<n>`; the first marker of a
  route restarts at 1).
- Glow: `admin:build/bots/internal/glow` (admin:tick, lobby): only the markers of the kind whose egg
  (by its dye model, so the old eggs work too) is held in a main hand glow; written on change only
  (`#glow_<kind>` / `#held_<kind>` in `solid.tmp`; new markers reset it).
- The bots' knowledge: `ctf_maps:map/<map>/clone` copies the template markers into the arena
  (`ctf_maps:lib` `copy_bot_markers` -> `ctf_maps:internal/bots/copy`): `marker` entities, tags
  `map_entity bot_spot bot_<kind>` or `bot_route bot_route_<r>` with `bot.idx`.
- Backup: `dump` prints the "bot" entry (click to copy; also plain in the chat log), `show/<map>`
  (generated) restores the markers of the registry entry. test_map has one.
- The flag of defense bots: a random `bot_flag` marker (else where a defense bot stands).
- New objectives `build.idx`, `bot.idx` (`ctf:set_parameters`).

### Stage 4 - movement and the flag

- Brain: `ctf_bots:tick/combat` (`#ctf:tick/combat`, round and end_round): every bot thinks 4 times
  a second (`internal/brain/think`, `bot.slot` = `bot.n % 5` = its tick of 5). Objectives `bot.n`,
  `bot.slot`, `bot.own`, `bot.r`, `bot.w`, `bot.t`, `bot.brk` (`ctf:set_parameters`).
- Moving: each bot has a lure (`internal/brain/new_lure`: an invisible, silent, NoAI rabbit, scale
  0.0625, team `bot_lures` without collision, 1024 HP + resistance 4, `bot.own` = the bot), put at
  where the bot must go; the bot gets a 0.01 `generic` hit "by" the lure and retaliates (vanilla
  `HurtByTargetGoal`, priority over players). Fighting: the same hit "by" the player.
- Switching targets (the lesson of the first test): a running retaliation is NOT restarted by a new
  hit, so the old target must be dropped first, else the bot keeps its target and gets hit every
  think. Lure -> player: the lure becomes `Invulnerable` (not a valid target) and the player's hit
  starts the new goal. Player -> anything: `internal/brain/blind`: `follow_range` 0 for 2 ticks (a
  mob drops a target farther than it; the target goals are checked every 2nd AI tick), the new
  hit in the same tick, `sight` gives the range back (24, or 96 while chasing: `bot_far`). All in
  one AI tick, so vanilla can't grab another player in between (that loop made the bots get hit
  again and again). The first version changed the bot's team for a tick: the name flickered.
- Fighting: a bot keeps fighting the enemy player it targets (vanilla also picks visible players);
  hit by an enemy (`on attacker`) -> fights back; an enemy within 16 -> fights.
- Attack bot: carrying the flag (glowing only) -> the win trigger (delivered within 2.5:
  `ctf_flag:api/deliver`); the flag item within 1.5 -> picked up (`bot_carrier`, a `bot_flag_pos`
  marker follows it: the flag drops there when it dies); fight; the placed flag within 2.5 ->
  broken in 3 s (`internal/flag/breaking`: 12 thinks, particles and sound, then its banner is
  removed: `ctf_flag:tick/combat` breaks the flag); its route (`bot.r` = route (n % 4) + 1 or the
  next one with points; `bot.w` = the next point; within 3 -> the next; 10 s without reaching it ->
  skipped; gaps skipped); then escort a carrier (to the win trigger), else the flag item / the flag.
- Defense bot: a player carrying the flag (tag `bot_flag_player`, any distance: he glows) -> chase;
  fight; the flag on the ground -> guard it; its defend spot (picked at the round start: the nearest
  free one to the flag 2 times of 3, else a random free one; none: the flag), standing there asleep
  (`bot_guard`, NoAI: no swinging at the lure).
- `follow_range` 96 (the chase across the map).
- The bot markers are copied into the arena only in a match with bots (`team bots` >= 1).
- Known: a lure / fight hit is a real hit (0.01): a bot dying soon after (a fall) may credit that
  player with a kill (vanilla kill credit). The bots know where the flag is (no search yet).

### Stage 5 - economy and shop

- Wallets: a `marker` per bot (`bot_wallet` + `bot_wallet_<i>`, `bot.n`, the side tag) keeps its
  money, so a dead bot keeps it like a player (`ctf_bots:internal/money/wallets`, generated: new
  ones get `#start econ`; removed at the swap / the match end, so each half starts again).
- Round money: `ctf_econ:round_end` / `round/loss_side` also pay the wallets of the side, with the
  same functions as the players (win reasons, loss bonus, streaks, the CS rule: `ctf_bots:on/
  round_win`, first in `#ctf:on/round_win`, tags the wallets of the dead bots `dead`; the flag
  broken bonus).
- Kill money: `ctf_econ:kill` as the bot (by the weapon in its hand), the delivery (`ctf_flag:api/
  deliver`), breaking the flag (`#break`, like a player): into the bot's `money`, then
  `internal/money/flush` moves it into the wallet (capped).
- Buying (`ctf_bots:buy`, generated from `registry/bots.bolt` PLANS / MAIN / RANGED / ARMOR /
  LIMITED, the shop costs and the LIMITS max): at freeze start every bot loads its wallet, picks a
  plan at random (weights), buys its items in order (skipped: can't pay / already has), the rest
  goes back. What it has: main weapon in the hand (`bot.mw` tier: golden 0, iron 1, diamond 2,
  netherite 3, mace 9 + `bot.wind` 10), armor set (`bot.arm`: golden 1, iron 2, boots with feather
  falling), helmet, totem in the off hand, ranged weapon `bot.sec` (index + 1 in RANGED: used in
  stage 6), `bot.he` / `bot.regen` / `bot.speed` (up to the round limit). Kept while alive; a dead
  bot comes back with the golden sword and leather (like a player).
- High base: `internal/buy/high_base` (generated): the defense spawn `under` of the current map is
  HIGH_BASE (10) or more above the lowest point of its template -> defense bots pick only the
  "ranged" plans. With 10 it is true for 5 maps of 7 (`under` is the top of the spawn spread, so
  it overestimates): tune HIGH_BASE.
- Mob armor never wears out (vanilla), so a bot never buys the same armor twice.
- Fixes after the test of stage 5:
  - Guns hit bots (`ctf_guns:ray/*_step`: the bot hitbox like the creeper one, `ray/hit_bot`,
    `ray/damage_bot`); the stun trap (loot reward) stuns defense bots.
  - The fake hits "by" a player (`target_want`) set off "the player hurt an entity" advancements:
    the Inferno blade burned around its owner without a hit. They are `minecraft:generic` damage:
    the damage type tag `#ctf_bots:fake_hit` (registry tags reload with /reload) is excluded in
    `ctf_loot:inferno_hit`; `ctf_bots:killed` counts only a killing blow from a player that isn't a
    fake hit (no kill for a bot that fell after a fake hit).
  - Guarding: `follow_range` 24 (how far a bot sees enemies and keeps a target; vanilla targeted
    every visible player within 96); 96 only while a defense bot chases the flag carrier
    (`far_on` / `far_off`, on a change); a defense bot drops a target farther than LEASH (24) from
    its post (its defend spot, else the flag) and goes back (`internal/brain/leash`).

### Stage 6 - weapons

- `registry/bots.bolt`: RANGED_USE (per ranged weapon: min / max distance, aim ticks, spread,
  elevation), REGEN_BELOW, SPEED_FROM, GRENADE, MACE_JUMP. `ctf_bots:combat` (entrypoint) generates
  `internal/combat/hold_melee|hold_ranged` (the item stacks by `bot.mw` / `bot.sec`), `choose`,
  `shoot`, `think`. Objectives `bot.hold`, `bot.cd`, `bot.cd2`, `bot.mag`, `bot.aim`.
- Every think (`internal/combat/think`, after the movement): a regeneration potion below 8 health
  (a husk is undead: instant damage II heals it 8, like regeneration II for 10 s); its target is an
  enemy player (`execute on target`, tag `bot_tc`): a speed potion if he is farther than 10
  (speed II: mobs move by speed^2), a grenade at 6..18 blocks (1 chance in 6 per think), a mace jump
  within 4 (a wind charge under its feet, then the fall makes the mace hit a smash), the ranged
  weapon within its min..max (`ranged`: held, tag `bot_shoot`) else the main weapon (`melee`).
- Shooting every tick (`ctf_bots:tick/combat` -> `internal/combat/shoot_tick`):
  - guns: `internal/combat/fire` calls `ctf_guns:ray/fire` with the bot as the shooter: `#bot
    gun.tmp 1` makes every ctf_guns damage / trap credit "by" `@e[type=husk, tag=gun.shooter]`
    (the players' lines are unchanged with `#bot` 0 / unset); the shooter and its teammates
    (`gun.ally`) aren't hit. From its eyes at the target's eyes (`anchored eyes facing`).
    Rifle: 6 shots a second, magazine 30, reload 50 ticks, the players' base spread + 2.5 degrees;
    sniper: 1.5 s aim, 1.5 degrees, reload `ctf_sniper:config reload`.
  - bows / crossbow: arrows summoned with the motion to the target (`internal/combat/motion`: a
    marker 1 block ahead, the difference x speed), speed 3, damage 2.5, piercing 4, Owner = the
    bot, a few degrees up against the drop; fire bow: burning arrows; crossbow: 3 arrows (+-10).
    Punch is not applied (it is a bow enchantment, not the arrow's).
  - grenade: the thrown potion + the `he_grenade` marker of ctf_grenades (kill credit owner = the
    bot), 25 degrees up.
- The totem in the off hand works by itself (vanilla). The kills by a held ranged weapon pay its
  kill money (the item has the `wpn` of the shop one).
- Fixes after the test of stage 6:
  - The bots never had a ranged weapon: the plans bought the armor first and the weapon was then
    too expensive. Now the weapon comes first, a cheaper one after it is the fallback (bow), then
    the protection; a better ranged weapon (later in RANGED) replaces a worse one.
  - Gaps: `internal/brain/leap_check` (every tick (`ctf_bots:tick/combat`: at 4 thinks a second the
    bot walked off the edge first), on the ground, towards its target: the lure or
    the player, not within 3): `leap` (generated): a hole 2 deep right ahead and the ground 2..4
    ahead with room -> `leap_go`: forward speed for the distance + LEAP up (registry). The target
    stays, so the path goes on after the landing. Block tag `#ctf_bots:gap` = `#ctf_guns:passable`.
  - A bot that delivered the flag stops glowing (`internal/flag/deliver`). The flag of a bot that
    starts an ultimate drops: stage 8.
- Fixes after the second test of stage 6:
  - Shared code instead of copies: `ctf_flag:api/pickup` (was internal: glowing of the carrier) and
    `ctf_flag:api/bring` (was internal: the delivery) are used by the players and the bots; the bot
    carrier's glowing ends in `ctf_flag:on/end_round_start` with the players'. The bots keep their
    own code where the player one works on the inventory (the shop's `give` / slots, the armor sets
    assembled from the chestplate, the hotbar layout): a mob has only hands and armor slots.
  - Target switching without a team change (see stage 4: `blind`): no name flicker, no hit loop.
  - Stuck: `internal/brain/stuck` (every think): a bot going to its lure (farther than 3) that
    hasn't moved half a block in 3 s jumps a little towards it. Objectives `bot.blind`, `bot.px`,
    `bot.pz`, `bot.stk`.
  - The kills sidebar: a score holder `bot_<i>` per bot, shown as "[Bot] <name>" (`scoreboard players
    display name`), in the bots' team (`internal/score/init` at every freeze, `kill` when a bot
    kills, `remove` at the match end: `ctf_bots:on/match_end`). The tab list shows only players:
    no way to add the bots without mods.
- Fixes after the third test of stage 6:
  - The gap jump is armed at a think (`leap_scan`: a hole 2 deep 1..2 blocks ahead towards the
    target -> tag `bot_leap`, `bot.lt` 6 ticks); only armed bots check the edge every tick
    (`leap_tick` -> `leap_check`), so it isn't missed and costs nothing for the others.
  - Under a player it can't reach (he is above, behind a fence...): a bot chasing a player that
    hasn't moved for 1.5 s (6 thinks; `internal/brain/stuck`) takes a detour (`detour_pick`): the
    bot marker (any copied annotation, tag `bot_nav`: all reachable) nearest to the player, not one
    within 4 of the bot, for up to 10 s (`detour`, `bot.det` thinks left, the marker's `bot.dt` = the
    bot's number + 1); there (within 3) it thinks as usual again. Objectives `bot.det`, `bot.dt`.
- Rework after the fourth test of stage 6 (the bots still got hurt, stuck, flickered):
  - The body is a zombified piglin (`type=zombified_piglin` everywhere the husk was). Targets are
    set by `AngryAt` (no hits at all: no damage, no fake player hits, no team tricks): `aim` (the
    lure, tag `bot_aim`), `aim_player` (the player tagged `bot_want`). Removed: the retaliation
    hits, `blind` / `sight`, the damage type tag `#ctf_bots:fake_hit` and its advancement
    conditions.
  - Spotting: the bots don't target players by themselves any more: `spot` (generated: SIGHT 16 in
    `registry/bots.bolt`) + `los` (the line of sight, 20 steps of 1 block). Kept: keep fighting the
    player it targets, fight back the one who hit it (`on attacker`), the carrier chase, the leash
    (`leash_back`: its lure at the post).
  - After a gap jump the lure moves 1.5 up for a moment (`leap_go`): the mob plans its path again
    from the landing (its old path went down into the gap: it turned back).
  - An angry zombified piglin grunts now and then (its ambient sound while angry).
- The carrier stood still with all defenders dead: the win trigger was farther than `follow_range`
  (48): no path, and a mob without a path doesn't move at all. `follow_range` 128 (the whole arena)
  for every bot (the 96 of the carrier chase is gone: `far_on` / `far_off`, CHASE_RANGE removed);
  `internal/spawn/body` (generated) puts the BODY attributes on every bot at each freeze.

### Stage 7 - traps

- Kill credit of a trap: `kc.placer` (new objective) on a trap marker = who placed it
  (`ctf_traps:internal/place`: owner and placer of every unowned new marker, no distance check, so a
  bot can place one far from itself); `ctf_fight:api/credit/owner` gives `#placer`; `mark` (players
  and bots) marks an attacker with the placer, a defender with the owner (the attacker who set it
  off). So a defender gets the kill of an attacker who walked into his trap (a change for the players
  too: before, that kill was credited to the attacker himself, so to nobody).
- The loot task "enemy_trap" (already "any defender by any defense trap", credited to the attacker
  who set it off) works with bot defenders: a bot killed by a trap is credited by `award`, which
  gives the task.
- Bots as victims: the trap / grenade / bomber / cloud marks include the bots; `kc.time` runs down on
  them; `ctf_bots:internal/credit/mirror` copies the mark to the bot's wallet every tick, `watch`
  sees the bot gone while marked -> `ctf_fight:api/credit/bot_victim` (as the wallet: its side
  `#vside kc.tmp`, the owner gets the kill: `award`), unless a player killed it (`#vkill bots`, set
  by `ctf_bots:internal/killed` for 2 ticks). `award` checks the victim's side with `#vside`
  (set by `victim` too) and pays a bot owner (`ctf_bots:api/credited`: wallet, sidebar).
- Placing: `ctf_traps:api/place/<id>` (generated, defense traps): the display of the shop egg at the
  position + `ctf_traps:internal/place`, as the owner. `ctf_bots:traps` (generated from TRAPS of
  `registry/bots.bolt` and the shop costs / counts / keys): at freeze, after the flag is hidden
  (`internal/flag/hide`), for each trap in order: a random defense wallet that can pay buys it (one
  of each per round for the server: `bought.item`), its bot places all of them on free spots of
  their kind (T; AN for the anvil): the nearest to the flag 2 times of 3, else random.
- Breaking: an attack bot (every think, `internal/traps/break_check`) breaks the nearest enemy trap
  within TRAP_BREAK (4) that it sees (`internal/traps/los`): removed without going off, like a
  player's hit with the hand. A trap it doesn't see (behind a corner) goes off.
- Fixes after the first test:
  - The anvil trap fell onto the top of a ladder and was gone (a falling block can't pass a
    ladder). Now the anvil is a block display moved every tick (`ctf_traps:internal/anvil/fall`:
    the old speed, +0.04 a tick, drag 0.98) through `#ctf_guns:passable`, landing on the first other
    block with the old damage (10 / 20, damage type `falling_anvil`, everyone in its block).
  - Reactions (DELAY): no hit / shot for 10 ticks after a weapon switch and 6 ticks after the target
    first comes within 4 blocks (`internal/combat/wait`: the tag `bot_wait`, an attribute modifier
    `ctf_bots:wait` x0 on `attack_damage`, so a swing misses; the mob swings again 1 s later).
  - Shooting only while the target is in sight (the line of sight at the think, up to SIGHT_FIGHT
    64: tag `bot_los`). Missed shots (`miss` of RANGED_USE: a gun shoots with the `wide` spread, an
    arrow goes `dev` degrees to a side); the rifle shoots 3 times a second (players 6).
  - Grenades: only at a target in sight with 3 free blocks of the throw ahead (they used to hit the
    wall in front of the bot: a "teleported" explosion); thrown 30 degrees up with the speed that
    lands them at the target's feet (bands of 2 blocks, found at build time by simulating the potion:
    `ctf_bots:combat`); before, a fixed speed always flew ~15 blocks.
  - Ladders (CLIMB, `ctf_bots:climb`, `internal/climb/*`): a vanilla path never goes up a ladder,
    so a bot stood under a flag on a platform. A bot stuck for 1 s with its target 2+ blocks above
    looks for the nearest ladder (2+ blocks high, within 6 blocks, generated offsets nearest first),
    walks to it (a `bot_ladder` marker, up to 5 s; failed: no search for 10 s), climbs it NoAI by tp
    (0.12 blocks a tick, facing the wall from the ladder's `facing`), steps off its top towards the
    wall and plans its path again (the lure nudge of the gap jump).
  - Gap jump: the far edge may be 1 block higher (it had to be at the same level). Tried and
    reverted: the hole looked for also along the body yaw (the mob turns a lot: random jumps) and a
    far edge 1 block lower (jumps where the path just goes down).
  - Defense bots: at freeze each one goes straight to its defend spot with the chance POST_TP (1/2,
    `internal/brain/post`: a teleport; it keeps that spot at the round start, tag `bot_posted`). The
    spots are freed at freeze now (before: at the round start).

### Stage 8 - navigation graph

Why: a vanilla mob only finds local paths (no ladders, no jumps, a drop of 1-3 blocks is a normal
move, a fast mob cuts corners and falls off narrow stairs). The bots stood under a player on a
platform, fell into holes, jumped at random (the patches: the ladder search near a stuck bot, the
jump towards the target). Agreed with the user: a navmesh-like graph with links of kinds, the nodes
placed by hand (a small graph: fields cheap enough to compute often).

- Nodes: every bot marker copied into the arena (`bot_nav`: the new N "nav point", F, T, D, the
  route points; not AN, on a ceiling); a marker standing on another node (a D on a T) is not a node of its own. N: put
  them at both ends of a ladder, both edges of a gap, on platforms, at stairs and crossings. Two
  nodes are linked only along a straight line: a curved corridor needs a node at the turn.
- Links (`ctf_bots:internal/nav/bake*`, after every clone: the new core event `#ctf:on/map_cloned`,
  NAV "bake_per_tick" nodes a tick; `#ready nav` 0 until done: the bots go straight): a marker
  `nav_link` at the first node (nav.to, nav.t, nav.c). A walk test along the line to every node
  within NAV "link_range" (half-block steps, a step up 1 / down 1, fences and walls stop it, room for
  the head): 1 walk; 2 narrow (a drop of 2+ beside the way for 3+ steps); 3 jump (one hole without a
  floor 2 blocks down, up to NAV "gap" wide, the far edge level or 1 higher); 4 drop (2-3 blocks, one
  way: a second test where deep floors are drops); else 5 / 6 a ladder up / down within 3 blocks of
  the first node (its top: off it towards its wall; its bottom: the floor) and a walk to the node.
  Cost: length x the kind's cost (+ the ladder height x NAV "ladder_block").
- Fields: NAV "slots" (8) objectives `nav.d<k>`; a slot per goal node (`#g<k>`), the least used one
  computed again (`#t<k>`): a wave from the goal node over the links to it (no macros: the links of
  a node F are the `nav_link` markers within the range with nav.to = F).
- A bot (`ctf_bots:internal/brain/lure_here` -> `ctf_bots:internal/nav/*`): straight to where it must
  go (`lure_direct`, the old lure_here) when it is within NAV "direct" blocks (1.5 up / down) and in
  sight, else along the graph (`bot_navm`): the goal node = the node nearest to the goal; no node yet:
  the entry (the node in sight within NAV "entry" with the least distance, else the nearest one); a
  node reached (within NAV "arrive"): the link with the least cost + distance; at the goal node:
  straight to the goal. Each link its way (`internal/nav/move`): narrow -> slower (attribute modifier
  `ctf_bots:narrow`); jump -> the gap jump armed only there (`bot_jl`; the jump scan is off along
  the graph otherwise); ladder up / down -> the nearest ladder climbed (`internal/climb/*`, now also
  down: NoAI, tp down; `bot_climbed`: done, then to the node). Stuck for 2 s along the graph: a new
  entry. A player is chased straight; stuck under him: to him along the graph for 10 s (`detour`,
  `bot.dp` = his player_id; the old detour by the nearest marker is gone). The old ladder search is
  kept for the bots going straight.
- Debug: `/function ctf_test:bots/nav` shows the graph (nodes as flames, links as dust by kind),
  `/function ctf_test:bots/bake` finds the links again.

### Stage 10 - tactics (plan, agreed with the user)

The goal: human-like team play on any map. Done in parts, one commit each, checked in the game.
Decisions: the bots' chat is shown to everyone; any breakable wall may be breached by a grenade;
usually 3-5 players; sight like a player's (a teammate may tell a bot that someone is behind it,
a bot turns to where an enemy was reported); a difficulty sign in the lobby; a different character
for every bot; tricks: fake and bait, ambushes, intercepting at the delivery point, predicting from
the earlier rounds of the match.

What players may do (the bots must answer it). Players attacking: one rush by one route; a split
(one makes noise, one sneaks to the flag); holding a choke from far / high with a sniper or bow;
sneaking (no steps heard, the name hidden); the detector, breaking traps; breaking the flag and
running to the delivery point (glowing); ultimates, invisibility, chorus, grenades into positions;
waiting in ambush. Players defending: camping the flag; holding a choke with ranged weapons; hunting
bots alone; traps on the routes; rotating to noise; stalling at the end of the round; weak but out
of the bots' reach.

- 10a Perception and team memory:
  - Sight (every think, as a bot): enemies within SENSE "sight", in the horizontal field of view
    (+-SENSE "fov" degrees: two half-spaces, a huge sphere each) or within SENSE "near"; a sneaking
    player only within SENSE "sneak", an invisible one within SENSE "invisible"; then a ray from
    the eyes to his eyes through `#ctf_bots:see` (what bullets pass + glass, panes, bars, leaves).
    The seen players are tagged `bk_seen` for this think (target choice, shooting).
  - Hearing: shots (`#ctf:on/noise` from ctf_guns / ctf_sniper, storage `ctf:noise kind`; arrows
    found by their origin), sprinting / walking steps near (not sneaking); radii in NOISE / SENSE.
  - Team memory: one intel marker per enemy player (`bot_intel`, `bk.id` = his player_id) at his
    last known position, `bk.age` (ticks since), `bk.src` (1 seen, 2 heard), `bk.hp` (the `health`
    score: no NBT), `bk.wpn` (the weapon class of WEAPONS: `if items` checks), `bk.by` (the bot).
  - Warnings: a bot that sees an enemy near a teammate who doesn't face him tells it ("Max, Steve
    behind you!"); the warned bot turns to him and fights. A bot on its post turns to fresh intel.
  - Chat (TALK): templates with parameters (name, coordinates, hp, weapon), a gap between bot
    messages and a minimum time before the same news about a player again.
- 10b Team brain (once a second): the state (time left, bots / players alive, known positions,
  total hp and damage, ranged threats, flag state, path lengths from the graph) -> roles. Attack:
  breaker, cover, distractor, flanker, hunter, carrier; the flag first when the enemies are far /
  not near the flag; little time left: roles by the number of bots (1: flag only; 2: distract +
  break; 3+: distractors for the known players, a breaker, cover). Defense: anchor, holders,
  rotation to noise, hunters on fresh intel, intercept at the delivery point, retake.
- 10c Fighting: target choice (low hp, near, hitting me / a teammate, the carrier, ranged threat),
  hits to kill both ways (WEAPONS damage), retreat to teammates / drink when losing, push a weak
  enemy, keep the distance with a ranged weapon, zigzag when closing in, check the last known
  position, grenades only on fresh intel, breaching a thin breakable wall when the way around is
  much longer.
- 10d Tricks and traits: per bot aggressive / careful / sly; fake (noise on one side, the others on
  the other), ambushes (hold behind corners, attack together), intercept at the delivery point,
  memory of the earlier rounds (where the players went / waited).
- 10e Difficulty: a BOTS LEVEL sign (easy / normal / hard): reaction, aim, sight, hearing,
  aggression, team brain.
- Performance: the team brain once a second; sight checks only for players in range, the cheap
  field-of-view test before the ray, rays capped; memory as scores on a few markers; no player NBT.

#### 10a - done (not tested)

- `ctf_bots:sense` (generated) + `internal/sense/*`, `internal/talk/*`. Every think starts with
  `sense/look` (as the bot tagged `bk_me`): candidates, near / field of view (huge spheres), sneaking
  / invisible ranges, the ray through `#ctf_bots:see`; seen -> `sense/seen` (memory: `sense/mark`,
  news -> chat, teammates within SENSE "warn" that don't face him -> `sense/warn`); running heard ->
  `sense/steps`. A guard (NoAI) turns to the nearest fresh intel (tp facing).
- The old sight (`brain/spot` with its own ray, `brain/los`, SIGHT, SIGHT_FIGHT) is replaced: `spot`
  takes the nearest `bk_seen` player; the combat `bot_los` = the target is `bk_seen`.
- Hearing: the new core event `#ctf:on/noise` (as the source, storage `ctf:noise kind`), run by
  `ctf_guns:rifle/shoot` and `ctf_sniper:shoot`; arrows of players found by `on origin` (tag
  `bk_arrow`); the nearest bot of the other side within the NOISE radius -> `sense/heard`.
- Memory: intel markers (`bot_intel`, created on the first news of a player, killed at the round
  start); `bk.age` / `bk.said` count up in `ctf_bots:tick/combat`.
- Warned bots: `bot.alert` / `bot.alt` -> `sense/alerted` in attack / defense (the player becomes
  `bot_want`: it turns and fights).
- Chat: `talk/ready` (the gap `#talk bots`, coordinates, weapon name from storage
  `ctf_bots:talk wpn`), messages seen / low / heard / steps / warn / killed (a player killed a bot:
  a random alive bot tells who and his hp; the killer becomes known).

#### 10b - done (not tested)

- `ctf_bots:team` (generated) + `internal/team/*`: `team/tick` every TEAM "think" ticks
  (`ctf_bots:tick/combat`, `#tb bots`): intel of dead players forgotten (`intel_alive`), `#known`,
  then `team/attack` and `team/defense` set `bot.role` (ROLES); a changed role is told
  (`talk/role`, only when the chat is free; hunt / hold silent).
- Attack: everyone hunts unless a distractor's enemy is still known in a hurry (`keep_role`); a bot
  carrying the flag: the others cover it (`escort`, the carrier gets `bot_brk`); the flag standing:
  the breaker (`bot_brk`, kept while alive; else `pick_breaker`: the shortest way, `team/path`:
  along the graph when ready, else straight; `bot.pf`); `team/hurry` (time left < the breaker's way
  to the flag + flag -> delivery point, x TEAM "speed", + "break" + "margin"); hurry: break + a
  distractor per known enemy (`distract_one`: the nearest free hunter to his intel; 2 bots: 1;
  else up to bots - 2) + cover; not hurry and safe (no known enemy within TEAM "safe" of the flag):
  break (+ 1 cover with 3+ bots), the others hunt; not safe: all hunt.
- Defense: hold; anchor (the holder nearest to the flag, 2+ bots; leash around the flag, no
  defend spot); a player carries the flag: the TEAM "intercept" bots nearest to the delivery point
  wait there (`team/intercept`, guard; leash around it) and don't chase; fresh intel (not in the
  last 30 s): the nearest holder within TEAM "rotate" goes to check it (`rotate_one`, `go_foe`;
  there and nobody: "Nobody here", back to hold).
- The fight decision (`team/fight`, `consider` for a seen enemy, `keep` with TEAM "slack" for the
  current target): always within "close" or when he hit it; break: no; distract / hold / rotate:
  yes; cover: near it or the breaker; anchor / intercept: near the flag / delivery point; hunt:
  within "engage", or no flag standing, or he is near the flag, or the flag isn't safe (the flag
  first otherwise). `brain/spot` now tags `bot_cand` (the nearest seen enemy).
- `team/dist`: a distance by selector thresholds (no NBT); `team/path`: the graph distance of the
  node nearest to the bot in the goal's field (`nav/node_d`) + the bot's distance to that node.

#### 10c - done (not tested)

- `ctf_bots:duel` (generated) + `internal/duel/*`. The target among the seen enemies:
  `duel/choose` (via `brain/spot`): distance + hp, -40 the flag carrier, -10 a ranged weapon, -20
  hitting the bot. A fight going on (`team/keep`) goes through the same decision as a new one.
- `duel/engage` (instead of `brain/target_want` in both brains): the times to kill both ways
  (WEAPONS "dps" of his weapon, BOT_DPS of the bot's, the bot's Health, his `health`): push when he
  is low or dies within DUEL "push" ("Steve is weak, pushing!"); retreat when it is low and dies
  clearly faster (`duel/losing`; not the carrier, not the breaker at the flag): `bot.ret` thinks to
  the nearest teammate, else away from the nearest fresh intel (`duel/retreat_go`, run first in the
  brains; an enemy within 3: it fights), "Falling back, 5 hp"; a ranged weapon he is in range of:
  `duel/stance` -> `stance_go`: it shoots from where it stands (tag `bot_stance`, `bot.shot` = his
  player_id: `combat/target` gives the shooting target to `combat/think` and `shoot_tick`), on
  guard and turned to him, or backs off / steps aside from a melee enemy within its min + DUEL
  "kite" (`duel/kite`); else it runs at him, stepping aside at random when he is ranged and
  farther than DUEL "dodge" (`duel/dodge`).
- Grenades: at a target in sight (`combat/grenade_at_target`) or, with no target, at the nearest
  intel younger than GRENADE_INTEL (`duel/nade_intel`: he hides behind cover); the throw targets
  the entity tagged `bot_nt`.
- Breaching (`duel/breach`, from `brain/stuck` when it can't reach the player it chases, before the
  detour): a half-block ray to him; the first block BREACH "min".."max" away, at most 3 steps of
  wall, no `#ctf_bots:unbreakable`, him reached behind it -> a grenade straight at the wall
  ("Breaching the wall to Steve!").

#### 10c, after the user's notes

- The flag is hidden from the attack bots (as from attacking players): `#fknown bots` 0 at the
  round start until an attack bot sees the placed flag (`sense/flag`, a ray through see-through
  blocks within SENSE "sight"; the flag item / a carrier: known at once) -> "Found the flag at x y
  z!" (`sense/flag_found`). Until then the team brain gives the role search (`team/searching`; the
  bots start with it, `brain/start`): `team/search` -> the nearest unchecked F spot nobody took
  (`bot.sc` = the bot, -1 free), else the nearest unchecked node, none: all again
  (`team/search_reset`); a bot marker within SEARCH "checked" of an attack bot is checked
  (`bot_chk`); with SEARCH "distract" or more bots one goes to the freshest known enemy. A
  searcher fights within SEARCH "engage" (or when hit).
- Chasing a player: straight when he is within NAV "chase" (1.5 up / down) and in sight
  (`nav/direct_chase`), else the shortest way along the graph (`duel/chase` -> the detour, which
  now ends when he can be chased straight).
- Graph: a node in the air goes down to the floor within 3 blocks, else it is no node (`nav_air`,
  red when shown: `nav/node_try`, `node_drop`); a jump over a deep hole may land 1-2 blocks lower
  (`#deep nav`; the gap jump on a jump link also tries those landings); the fields are seeded from
  the nodes within NAV "seed" of the goal node too (a goal node no link reaches still leads to the
  nearest reachable place; a node no link leads nearer from = the end: `nav/arrived`, `bot_final`);
  a link not passed in time (its length + NAV "hop_extra" thinks: `bot.ht` / `bot.hl`) or stuck on
  it for 2 s costs NAV "penalty" more (`nav/fail`, `nav/penalize`, every field computed again,
  "Can't get through here, trying another way").

#### Falls, wind charges, the mace, the flag on the ground, passing it (after the user's notes)

- Mobs take fall damage (the gamerule `fallDamage false` is only for players). New links: fall (7:
  walking off an edge down to NAV "max_fall", `nav/fall_start` / `fall_down` in `#mode 1`; or
  jumping down over a gap, `#mode 2`, `nav/gap_fall`), nav.f = its damage (height - 3); wind charge
  up (8: 2..NAV "wind_up" blocks, a free column above the node, then over onto the node:
  `nav/wind_try`, `wind_col`).
- The cost of a link per bot: the fields have a class (`#cls nav`: 0 with a wind charge, 1 without:
  `nav/class`; the slot key = goal x 2 + class); `nav/link_x`: a fall + nav.f x NAV "fall_soft" /
  "fall_hard", a wind charge jump impossible without a charge.
- Moving: a fall link pushes the bot off the edge (`nav/fall_push`: the gap jump when it lands
  within 4, else a push); a wind charge link launches it (`nav/wind_up`, the speed for the height
  found at build time: `nav/wind_speed`), then over onto the roof (`nav/wup_tick`).
- Falling bots (`bot_fall`: set by these moves or at a think when FallDistance >= 3) every tick
  (`nav/fall_tick`): a soft landing with a wind charge right above the ground (FALL "soft"+:
  `nav/soften`, FallDistance 0); the mace falling FALL "smash"+ blocks next to an enemy: the smash
  at once, the vanilla damage (`duel/smash`, `damage ... minecraft:mace_smash by` the bot), a bounce.
  A bot with the mace jumps down at an enemy 3+ blocks below within FALL "dive" (`duel/dive`, from
  `duel/engage`); a defense bot with the mace takes the highest free defend spot near the flag
  (`brain/pick_high`).
- Every bot gets FREE_WIND wind charges at every freeze (`internal/free_wind`, up to the limit).
- The flag on the ground (it glows: known): role fetch for the nearest attack bot
  (`team/fetch`), a cover near it.
- Passing the flag (`team/pass_check`, every team think, as the carrier): to a teammate within PASS
  "near" stronger by PASS "better" (`team/strength`: hp + 4 x armor tier) -> `flag/pass` ("Kate,
  take the flag!"); else to a teammate PASS "drop"+ below within PASS "throw" it sees whose way to
  the delivery point is shorter by PASS "gain" -> `flag/throw` (the flag item flies at it; the
  thrower doesn't pick it up for 2 s: `bot_thrower`, `bot.nopick`).
- The bots push each other again; instead a bot standing still IDLE thinks with nothing to wait for
  (not breaking the flag, not shooting from its place, not on guard) gives up its way and search
  spot and steps aside (`brain/unstick`; `bot.idle`, `brain/moved`).

#### Fix: bots hardly fought, bows unused

- Retreat only when hp <= DUEL "retreat_hp" (6), it dies much faster (its time x 2 < his), a teammate
  within 32 (farther than 6) to fight beside, not again within DUEL "retreat_again" thinks
  (`bot.retcd`): before, any bot at 10 hp against a better weapon fell back again and again (a bot
  doesn't heal by waiting).
- The detour to a player ends within NAV "chase_near" of him (lost in the rewrite: the bot stood next
  to him with its lure as the target); straight chase within NAV "chase_up" up / down (was 1.5).
- Fire on the move (`duel/fire_move`, `fire_go`): a seen enemy the role doesn't fight but in the
  range of its ranged weapon is shot while the bot goes on (`bot_stance` without the guard).
- TEAM "engage" 16 (was 10), SEARCH "engage" 24 (was 20).

#### Fix: bots ran away from a player they saw / stood in front of him

- The ranged stance (on guard, shooting) only at a player in sight (`bk_seen`); before, a player
  reported by a teammate / just hidden made the bot stand facing him without shooting.
- A seen player within NAV "chase" (and "chase_up") is chased straight (`nav/chase_box`, then
  `nav/direct_chase` takes the bot's own sight): before, a separate line from his chest to the bot's
  eyes was blocked by a fence / slab / glass and the bot went around along the graph.
- A seen enemy in the range of the bot's ranged weapon is fought whatever the role (`duel/in_range`
  in `team/fight`; not the breaker / fetcher: they shoot on the move).
- Snipers (SNIPER, `duel/sniper`): a known enemy sniper (his weapon seen, or a sniper shot heard)
  farther than SNIPER "near" who sees the bot (a ray from his place) -> the bot (not a sniper) hides
  for SNIPER "cover" thinks at the nearest node within SNIPER "radius" he can't see (`cover_try`,
  `hide_ray`, `cover_go`; `bot.cov`, `bot.cvn`), "Sniper! Taking cover"; within SNIPER "reload" ticks
  of his shot (`bk.rl`, set when a shot is heard) it doesn't hide (it rushes).
- The bots' sniper: spread 0.3 degrees, misses 40% (~60% hits; was 1.5 degrees, 30%).
- The flag is seen across the map (SEARCH "flag_sight" 180; was SENSE "sight" 64), the ray goes from
  the middle of the flag to the bot's eyes (aimed at the flag's foot it touched the floor in front of
  it at a flat angle).
- Bots hung in the air: a NoAI mob doesn't fall, and the guard (a spot, the ranged stance, cover) was
  set while it jumped / fell. `brain/guard` only on the ground; a think wakes a guard in the air or
  with nothing under it.

#### 10d - done (not tested)

- `ctf_bots:trick` (generated) + `internal/trick/*`. Traits (TRAITS): `trick/traits` at freeze (a
  random trait per bot number for the match, on the holders `bot_<i>`; `trick/forget` at the match
  end), `trick/my_trait` in `freeze_reset`. They change the engage range of hunters / searchers
  (`trick/engage` in `team/fight`), the retreat hp (`trick/retreat_hp`), hiding from snipers
  (`trick/hides`: aggressive bots don't); the team brain asks an aggressive bot first to distract /
  rotate (`bk_asg` from `team/set_foe`), a sly one to fake.
- Fake (TRICKS, role 7): `trick/fake_pick` (team/attack, the flag found, not in a hurry, 3+ bots): the
  node near the flag farthest from the breaker (`bot.fkn`); `trick/fake_go` -> `trick/noise` there
  (on guard, shots for the players every TRICKS "noise" ticks, "Making noise over here, go!",
  `bot_faked`); kept while the flag stands and no hurry (`team/keep_role`).
- Staging: the breaker near the flag waits on guard for the fake (up to TRICKS "wait_fake" thinks)
  and for its cover (up to "wait_cover"): `trick/stage` (`bot.wt`).
- Ambush: a sly defender holding its spot fights only within TRICKS "ambush", near the flag or when
  hit (`trick/ambush_ok` in `team/fight`), doesn't shoot on the move, and calls its teammates within
  TRICKS "ambush_call" when it does (`trick/ambush_call` from `duel/engage`: bot.alert).
- Memory of the match (MEMORY, on the arena nodes: one half of the match): a seen player heats the
  node nearest to him (`trick/heat` from `sense/seen`, once a second a player: `bk.hc`); the flag the
  players hid marks its nearest node (`trick/hide_rec`: when found, else at the round win;
  `#hidrec`). The search goes to the hiding places first (`trick/hide_pick`), a defense bot (1 in
  MEMORY "hot_spot") takes the defend spot with the most heat around (`trick/pick_hot`), a bot
  going on guard faces the hottest node (`trick/face_hot`).
- The user's call: the attack bots always know where the flag is (FLAG_KNOWN, `#flag_known bots`:
  `#fknown` 1 at the round start); the search stays for FLAG_KNOWN = False.

### Stage 11 - learning (plan, agreed with the user)

Not a neural network (too little data: one tester; training would take thousands of matches, an
inference library like ajjnn exists but can't train in the game). Instead counting what works:
imitation of the players (what they do in which situation) + the bots' own results (link failures,
routes, flag spots), kept per map in the storage `ctf_bots:learn` across matches, decaying slowly.
Fast: a match gives data at once. In every match (with bots or not), on by default (setting
Bots_learn). Details: LEARN in `registry/bots.bolt`.

#### Stage 11 - done (not tested)

- `ctf_bots:learn` (generated) + `internal/learn/*`. Storage `ctf_bots:learn`: `maps.<map id>` = {pts,
  links, next, routes}, the map being played in `cur` (`#map lrn` = its number; `learn/load` at
  `#ctf:on/map_cloned` in every match with Bots_learn 1, `learn/save` every LEARN "save" ticks, at
  `#ctf:on/prepare` (the swap clone) and at the new core event `#ctf:on/match_ending` (before the
  match end cleanup, also when everyone left)); `buy.c<ctx>` the purchases.
- Points: the stored ones spawned at their place (arena-relative), merged into a bot marker standing
  there (every bot marker gets a point id: `learn/new_id`); events add 10 (the counts fade: see the
  decay below). New trail points where players walk (`learn/actor`, `new_pt`; up to LEARN "max";
  with bots they are graph nodes, baked again at the next freeze: `#lrn_new`).
- Recorded (`learn/tick` in `#ctf:tick/freeze` and `#ctf:tick/combat`): players' heat by side while
  the flag stands and the carrier's path (`learn/heat`), deaths of players (`lrn.death`) and bots
  (their wallets follow them: `learn/wallet_here` / `wallet_check`), players' traps by kind
  (`learn/trap`), players' grenades (`#ctf:on/noise` kind explosion from ctf_grenades: `learn/nade`),
  the flag the players hid (`learn/round_start`), the defense bots' flag spot won / lost and the
  attack routes' results (`learn/round_win`), observed links between points with their kind from the
  stats (climb / fall cm, jumps, wind charges: `learn/observe`, `link_obs`), the bots' links passed /
  failed (`learn/bot_link` from `nav/arrive_<k>` / `nav/fail`), purchases (`#ctf:on/bought` from the
  shop click: `ctf_shop:internal/announce`; contexts counted at freeze: `learn/freeze`).
- Used: learned links at the end of a bake (`learn/links_start`: dearer by failures, new observed
  links), danger in the field costs (`learn/danger`), defend spots where human defenders stood
  (`learn/after_load`), the bots' heat = the attackers' heat (facing, hot spots), traps where players
  put them (`learn/trap_spot_<kind>`, an anvil under the ceiling above), the flag hidden by value
  (`learn/hide`), routes by value (`learn/pick_route`), purchases like the players of the bot's
  situation (`learn/bot_buy`), grenades at likely defender spots (`learn/prenade`).
- `/function ctf_test:bots/learn` (on / off), `learn_info`, `learn_forget`.
- The graph shown in the lobby too (`ctf_test:bots/nav`, the same toggle): `nav/lobby_build` builds a
  view graph at the template the player stands at (a node marker `nav_tmp` at every bot marker within
  160, the map's learned points: `learn/lobby_points` / `lobby_load` by the template box), baked as in a
  match (`#lshow nav` 1; the learned links of that map applied; "Bot graph: N nodes, M links" when
  ready); removed when nobody views it (`nav/lobby_clear`) or at the clone; `ctf_test:bots/bake` in the
  lobby builds it again after editing the markers. Nothing is saved in the lobby.
- Fix: a save with no points in the arena (a stale `#map lrn` from a match that ended before
  `match_ending` existed, saved at the next match start's prepare) wrote an empty point list over the
  map. `learn/save` now needs points in the arena; a load without points clears the orphan links.
- Trails and observed links are recorded in freeze too (`learn/tick`: states 3..5); the heat only in
  the round (in freeze the defenders hide the flag and place traps).
- `learn_info` in detail (`learn/stats`, `stat_links`, `stat_routes`): places (from trails / the
  map's markers), heat by side and carriers, deaths, grenades, flags hidden, players' traps by kind,
  ways (shown by players, passed / failed by bots), the bots' flag spots held / lost, the attack routes
  won / rounds, purchase situations, the last save; the points near the player shown.

#### Stage 11 - the bots' own results, wind charges (after the user's notes)

- Players' wind charges (`learn/wind`, from `learn/actor` when `lrn.sw` grows past `lrn.bw2`): the
  point near counts it (`lrn.ws`), in a fight (an enemy within 10) also `lrn.wf`. Bots: a wind charge
  jump up and away when falling back where players used them or with the enemy within 4
  (`learn/wind_escape`, from `duel/retreat`); a wind charge thrown at an enemy 3..8 away where players
  used them in fights (`learn/wind_throw`, from `duel/engage`).
- Bot traps that went off (new core event `#ctf:on/trap_fired`, as the trap marker, at the top of
  every trap's trigger): `learn/trap_fired` counts `lrn.tw` near it; the trap spot value `lrn.tv` =
  players' traps of the kind + 2 x `lrn.tw`.
- Bot kills from a place (`ctf_bots:api/killed_player`: `lrn.dk`); a defense bot (1 in 2) takes the
  free defend spot with the best kills x 2 - deaths (`learn/pick_good`, `good_one`).
- Bot grenades that hit (an enemy within 4 of the explosion: `lrn.nh`, `learn/nade`); the pre-aimed
  grenade value + 3 x hits.
- Bot purchases: every bot item bought through `ctf_bots:internal/buy/get/<item>` tags the wallet
  (`lrn_b_<item>`; the plans use it too); the wallet keeps the context (`lrn.ctx`) and the kills at
  freeze (`lrn.k0`: `learn/wallet_start`); at the round win `learn/bot_round` adds what each item gave
  (kills x 10 + won x 10 + alive x 5) to storage `buyb.c<ctx>.<item>` {n, v}; `learn/buy_adjust`
  halves / raises the players' chance of an item by its average (LEARN "buy_low" / "buy_high", known
  "buy_bot_min"+ times).
- `learn_info`: wind charges, the bots' traps that worked, kills from places, grenade hits, the
  situations with the bots' own purchase results.

- Fix: the learned points were never saved. `learn/save_pt` subtracted the arena corner with
  `scoreboard players remove #x lrn -2000`; `remove` takes no negative number, so Minecraft did not load
  the function, and every save wrote an empty point list (the links were kept). At the next load of the
  map (a swap clone, the next match) the links lost their points and were cleared. The corner is now
  subtracted with `add` / `remove` by its sign. Values put in by bolt are not checked by mecha: the whole
  output was parsed again by plain mecha (a beet project loading the built pack, no bolt), no other
  error.
- Decay: once a match, when the game itself starts, the point counts in the arena are x the setting
  `Bots_decay` / 100 (default LEARN "decay" 95, was x 0.9 at every load: the warm-up clone and the swap
  clone too; 100: never; `/function ctf_test:bots/learn_decay {pct: N}`; shown in `learn_info`).
  `#ctf:on/match_start` sets `#decay lrn` 1 (`ctf_bots:on/match_start`), the first freeze_start
  applies it (`learn/freeze` -> `learn/decay`), so it does not depend on the warm-up (to become
  optional later). Integer math: a count of one event (10) fades by 1 a match at 95%. Links and
  routes do not fade.

### Fix: traps did not work on bots (bots on the same rights as players)

- The attack bots broke every enemy trap within 4 blocks with a free line of sight, 100%, at once
  (a trap goes off within 2): no field of view, no chance, no reach. Now (`ctf_bots:internal/traps/
  break_check`, registry TRAP_SEE) a bot notices a trap within "sight" 10 in its field of view (SENSE
  "fov") with a free line of sight only by chance ("chance" 10% a think), the trap is then known to its
  team (`bot_trap_known`), and a bot within "reach" 3 hits it (`ctf_traps:api/disarm`, shared with the
  player's hit with the hand). A bot running at a trap it didn't notice sets it off.
- One selector for players and bots: bots carry the tag `player`, `#ctf:fighter` = player + zombified
  piglin; the duplicated bot lines of the traps (touch, credit marks), the clouds, grenades, the bomber,
  the stun trap, the death camera and the kill credit are gone. `predicate=ctf:not_spectator` replaces
  `gamemode=!spectator` (it never matches a bot).
- Effects that reached only players now reach the bots: the detector's glowing, the blindness of the
  flag break, the darkness near the flag, the Inferno blade's slam.
- The bot body ignored: the wither effect (undead), fire (fire-immune), levitation while NoAI (asleep
  on its post, climbing). `ctf_bots:internal/body` (registry BODY_FX, every tick): the wither trap
  cloud gives `bot.wth` ticks (1 wither damage a second); fire blocks / lava, fire aspect hits
  (advancement `ctf_bots:burn_hit`) and burning arrows (`ctf_bots:burn_arrow`) give `bot.fire` ticks
  (1 damage a second, flames shown, water puts it out); a levitating bot wakes up / stops climbing.
- Perception: a blinded bot sees only within SENSE "blind" 4, in darkness "dark" 12.
- Second fix (the user: traps still did not go off on bots, bots did not fear them): the exception
  `trap_safe` (defense bots never set off their team's traps; a defense player does) is gone: traps go
  off on every bot like on a player. Instead the bots know traps like players: the defense every trap
  of its team (`bot_known_d` at the round start: they were placed in freeze), the attack the traps it
  noticed (`bot_known_a`). `ctf_bots:internal/traps/tick` (every tick): an attack bot breaks a known
  trap within TRAP_SEE "reach" 3 (before it is within 2); an awake bot within "avoid" 2.6 of a trap its
  team keeps out of (the defense: all it knows; the attack: known anvils, its column +-"avoid_anvil")
  is pushed away (`traps/push`, "push" 0.25 a tick), unless its lure is in there (its spot, the flag, an
  enemy). Choosing the next link (`nav/hop_<k>` -> `traps/hop_mark`, `nav/trap_cost`), a node next to
  such a trap costs "cost" 300 more. Defend spots next to a trap are not taken that round
  (`traps/round_start`: `bot_taken`, `bot.own` -1).
