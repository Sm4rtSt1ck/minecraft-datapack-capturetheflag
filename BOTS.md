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
- play as a team, with simple tactics.

No mods: datapack only.

## Decisions (agreed with the user)

| Question | Decision |
| --- | --- |
| Side of the players | Random at the match start (attack or defense); the swap works as usual |
| Bot respawn | Like players: a dead bot is out until the end of the round |
| Bot body | The cheapest mob that fits (see "Bot body"); the look is decided later |
| Button | Vote phase, hotbar slot 9 (`hotbar.8`), a villager head; glints when on |
| Bot count sign | 1 block west of the rounds sign: `LOBBY["sign_bots"]` = [-1, -40, 28] |

## Architecture

1. **A bot is a mob with vanilla AI**, not an armor stand moved by `tp`: vanilla pathfinding
   (ladders, steps, obstacles) can't be rebuilt with commands.
   - Mobs don't attack their own scoreboard team; the target with line of sight is chosen by
     vanilla and read with `execute on target`.
   - Moving to a point: a "lure" (an invisible invulnerable living entity) stands at the point,
     the bot gets 0+ damage `by` the lure and chases it (retaliation target).
   - Vanilla limits: no doors (maps need openings), no gap jumps / parkour, path length limited by
     `follow_range` (long routes need waypoints), no chorus fruit / map teleports.
2. **Map knowledge is annotated, not computed.** Every map gets in `registry/maps.bolt` (template
   coordinates, moved by `in_arena`): `bot.flag_spots`, `bot.trap_spots`, `bot.defend_spots`,
   `bot.routes` (attack routes, lists of points). Placed with `admin:build` markers. In freeze the
   bots don't walk there: a spot is chosen and the flag / trap appears in it. Only annotated (so
   reachable) spots are used.
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
| Hide the flag (defense) | easy | one of `bot.flag_spots` in freeze |
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
| Traps | medium | in freeze into `bot.trap_spots` through `ctf_traps`, owner = the bot |
| Teamwork, tactics | "decent bot" | roles (rush, flank, support, flag guard, choke guard), regroup, retreat at low HP, react to "flag taken" |

## Stages

Each stage is one commit, checked by the user in the game before the next one.

| # | Stage | Status |
| --- | --- | --- |
| 1 | Lobby and teams: button, count sign (1-10), all players in one random side; no bots yet | done |
| 2 | Bot body, melee: spawn, death (out until the round end), round win counts bots, kill credit, kill money; first TPS measurement | in progress |
| 3 | Map annotation: `admin:build` bot markers, `bot.*` in `maps.bolt`; the user annotates the first map | |
| 4 | Movement and the flag: routes, hiding the flag, attacking it, delivery (playable mode) | |
| 5 | Economy and shop: buy profiles from the registry | |
| 6 | Weapons: guns, bow, grenades, mace, potions, totem, wind charge | |
| 7 | Traps | |
| 8 | Ultimates: charge, choice, use (adapt / forbid the player-only ones) | |
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
