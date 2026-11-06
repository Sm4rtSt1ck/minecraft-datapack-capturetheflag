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
| Bot body | The cheapest mob that fits (see "Bot body"); the look is decided later |
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
   - Mobs don't attack their own scoreboard team; the target with line of sight is chosen by
     vanilla and read with `execute on target`.
   - Moving to a point: a "lure" (an invisible invulnerable living entity) stands at the point,
     the bot gets 0+ damage `by` the lure and chases it (retaliation target).
   - Vanilla limits: no doors (maps need openings), no gap jumps / parkour, path length limited by
     `follow_range` (long routes need waypoints), no chorus fruit / map teleports.
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

A **husk**: doesn't burn in the sun, holds items in both hands, wears armor, chases its target,
hits with the held item. A husk in water turns into a zombie (then a drowned): the conversion has
to be blocked (to check in stage 2: `DrownedConversionTime` / keeping it out of water).

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
| 7 | Traps: bots place them; see / avoid / break the enemy traps; kills of bots by a player's trap credited to him | |
| 8 | Ultimates: charge, choice, use (adapt / forbid the player-only ones); fear a player in the bomber ultimate | |
| 9 | Tactics: roles, groups, retreat, events; difficulty | |

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
  think. Lure -> player: the lure becomes `Invulnerable` (not a valid target: the goal stops in the
  same tick) and the player's hit starts the new goal. Player -> anything: the bot joins the
  players' team for one tick (`internal/brain/drop_target`, tag `bot_reset`; a mob stops targeting
  a teammate), `rejoin` the next tick, the new target at the next think. Hits only on a change.
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
