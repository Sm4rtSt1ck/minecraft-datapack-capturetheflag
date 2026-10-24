# CLAUDE.md

Capture the Flag minigame as a **Minecraft Java 1.21.4 datapack** (`pack_format` 61).
Repository: https://github.com/Sm4rtSt1ck/minecraft-datapack-capturetheflag (branch `master`).

- The user writes in **Russian**: answer in Russian. Code, comments, commit messages, README and
  MECHANICS are in **English**.
- Game mechanics for players / admins: [README.md](README.md) (economy, shop, weapons, traps...)
  and [MECHANICS.md](MECHANICS.md) (loot crates, rewards, death camera). Keep them up to date with
  every change of behavior.

## Current status: migration to beet + bolt (variant "C")

The project is being moved to a **beet + bolt** build with **data registries**. Chosen by the user
after comparing three architectures:

- one namespace per mechanic;
- the core announces events through function tags;
- content (items, weapons, ammo, limits, traps, ultimates, maps, shop products, loot tasks) is
  described as **data in registries**. bolt turns the registries into plain static `.mcfunction` at
  **build time**.

**Why build time and not runtime macros:** Minecraft caches only a few argument sets per macro
function. Looping a macro over a registry in hot paths re-parses commands every call, which hurts
TPS with 10-20 players. These hot paths are item classification, the layout check, pickup rights,
limits and ammo. So no runtime registry loops. Macros are fine only in rare events (a purchase,
placing a trap).

Migration is done **stage by stage**. Each stage is one commit. The user checks it in the game
before the next stage starts. **Behavior must stay 100% identical** at every stage unless the user
asks for a change.

1. **Move without changes.** Set up beet, copy the datapack as is, get a clean build whose output
   matches the old datapack. A test build of the old datapack already passed: all 499 functions
   parse with mecha for 1.21.4. The output keeps the same commands; beet only strips comments and
   joins `\` line continuations.
2. **Core hooks.** Phase events and phase ticks go through function tags (`#ctf:on/<event>`,
   `#ctf:tick/<phase>`). Phases no longer list the modules by hand.
3. **Split `ctf` into namespaces:** `ctf_lobby`, `ctf_maps`, `ctf_flag`, `ctf_fight` (death, kill
   credit, death camera), `ctf_traps`, `ctf_grenades`, `ctf_ult`.
4. **Registries, module by module.** Each registry generates its static code:
   - 4a items / ammo / limits → classification, pickup caps, layout, ammo fill / check;
   - 4b shop;
   - 4c traps, ultimates, maps;
   - 4d economy kill rewards, loot tasks / rewards.
5. **Cleanup.** Update README and MECHANICS to the new structure.

Target layout:

```
<project>/
  beet.json
  registry/            items, weapons, ammo, traps, ultimates, maps, shop, tasks (JSON / bolt modules)
  src/data/
    ctf/               core: phases, teams, timers, hooks (function tags)
    ctf_lobby/ ctf_maps/ ctf_flag/ ctf_fight/ ctf_traps/ ctf_grenades/ ctf_ult/
    ctf_inv/ ctf_shop/ ctf_econ/ ctf_guns/ ctf_loot/ ctf_fx/ ctf_test/ admin/
```

Every module has the same layout:

- `config.mcfunction` - settings;
- `api/` - may be called by other modules;
- `internal/` - private to the module;
- `tick.mcfunction` - only if the module needs a tick.

Dependencies go one way: content → systems → core. The core never calls modules directly, only
through tags.

## Build

- Tools: beet 0.121.x, mecha 0.107.x, bolt 0.53.x (Python 3.14 works).
- **Windows long path:** a venv in a very long path fails (Pillow: "DLL load failed ... filename
  too long"). Keep the venv in a short path, e.g. `<project>/.venv` or `%TEMP%\ctfbeet`.
- `beet.json` must target 1.21.4:

  ```json
  {
    "name": "CaptureTheFlag",
    "minecraft": "1.21.4",
    "data_pack": {"name": "CaptureTheFlag", "load": ["src"], "pack_format": 61, "description": "..."},
    "require": ["bolt"],
    "pipeline": ["mecha"],
    "output": "<world>/datapacks",
    "meta": {"mecha": {"formatting": {"json_ensure_ascii": false}}, "bolt": {"entrypoint": ["ctf_inv:gen"]}}
  }
  ```

  `data_pack.load` also maps the registry: `["src", {"data/registry/modules": "registry"}]`, so
  `registry/items.bolt` is the bolt module `registry:items`.

  - `data_pack.name` sets the output folder name (default would be `capturetheflag_data_pack`).
  - `json_ensure_ascii: false` keeps unicode (`⚑`, `❸`, emoji) as is instead of `\uXXXX`.
  - The output goes into the world:
    `C:\Users\Leonid\AppData\Roaming\PrismLauncher\instances\1.21.4\minecraft\saves\CaptureTheFlag\datapacks\CaptureTheFlag`.
  - A one-off build elsewhere: `beet -s output=<dir> build`.
- The venv with beet is `%TEMP%\ctfbeet\env` (`Scripts\beet`).
- **mecha re-serializes every command** (bolt parses all functions). The output is equivalent, not
  byte-identical: `20t` → `20`, `1024f` → `1024.0f`, `'x'` → `"x"`, NBT spacing. `\` line
  continuations are joined without a space, exactly as Minecraft does.
- **beet maps legacy folder names** (`advancements` → `advancement`), so files that 1.21.4 ignored
  would become active. The old `minecraft/advancements/*/root.json` (dead since 1.21) were deleted
  for this reason.
- **bolt (build-time code):** every `.mcfunction` is a bolt file. Learned so far:
  - `function f"ns:path":` + an indented block **defines** a function (no call is written);
    modules listed in `bolt.entrypoint` (e.g. `ctf_inv:gen`) generate such functions.
  - A `def` with commands inside writes them into the calling function (`ctf_inv:lib` `count`).
  - Expressions go into command arguments: f-strings, `a["max"]`, `(f"..{n}")` for ranges.
  - **Values put in by bolt are not validated by mecha** (a broken item predicate builds fine).
    Check the output.
  - Macro lines (`$...`) are copied as they are: no bolt expressions inside them.
  - No list comprehensions; use loops.
- **Checking a refactoring:** compare the new build with the previous one. Stage 4a used a
  symbolic check: macro calls with constant arguments are substituted, calls are replaced by the
  hash of the callee, so a generated static function must expand to the same commands as the old
  macro call.
- `beet build` - one build; `beet watch` - rebuild on save. Then `/reload` in the game.
- **Never edit the output folder:** it is overwritten by every build.
- mecha validates every command at build time (selectors, NBT, macros) and stops on errors, with
  the file, line and column. A clean build is the first check of every change.

## Working rules (from the user)

- **Commit only when asked. Push only when asked.**
- I can't run the game. After a change, say what is not tested and list what the user should check
  in the game.
- **All scoreboard objectives are created in one place:** `ctf:set_parameters`, in sections per
  module. The user asked for one place.
- Module configs are loaded in `ctf:load` (every `/reload`) and again at match start.
- **Adventure mode is never disabled.** Placing items uses `can_place_on`, as the walls / stun
  trap rewards do.
- **Every `playsound` / `particle` of the match targets `@a[tag=!lobby]`**, so lobby players never
  hear or see match effects.
- Performance first, but nothing extra. In tick paths:
  - no `nbt=` selectors: use `if items` / `custom_data~` and tags;
  - always give `@e` a `type=`;
  - do work only on change (dirty tags, "only write when different").
- Don't remove code or comments the user wrote on purpose without asking. Examples: disabled shop
  products, alternative map spawns, the `elevator` map function, `admin:tp/*`.

## Architecture (after stage 3)

**Game state:** `game state` against constants in the `state` objective:

| State | Value |
| --- | --- |
| lobby | 0 |
| vote | 1 |
| warmup | 2 |
| freeze | 3 |
| round | 4 |
| end_round | 5 |
| swap | 6 |
| end | 7 |

`ctf:tick` calls `ctf:match/<phase>/tick`.

**Registries (stage 4).** `registry/*.bolt` hold data only (lists of dicts). Generated code is
static: no runtime loops over a registry, no macro calls in hot paths.

- `registry/items.bolt` (4a): `GROUPS` (item groups and their slots), `AMMO` (max, fill),
  `LIMITS` (carry limits, pickup kinds of limited items). Used by `ctf_inv:gen` (generates
  `ammo/cap|check|max|fill/<id>`, `limits/max/<id>`, `layout/has_<kind>`) and by
  `ground/classify`, `ground/claim`, `layout/caps`, `layout/take_misplaced`, `stash/place_one`,
  `ammo/*_all`, `limits/enforce`. The ammo items themselves are still given by the hand-written
  `ctf_inv:ammo/give/<id>` (bolt can't fill macro lines).
- `ctf_inv:lib` `count(pred)` = `ctf_inv:limits/count` without a macro call. The macro
  `limits/count` / `limits/one` stay for callers with a runtime predicate (`ctf_shop`).

**Core hooks (stage 2).** The phase functions don't call modules; they run function tags in
`ctf/tags/function/`. **The order of the values in a tag is the order of execution**: it repeats
the old order of the calls, so keep it when adding entries.

- `#ctf:config` - module settings (`ctf:load` and match start).
- `#ctf:tick/<phase>`: `lobby`, `global` (every tick), `freeze`, `round`, `end_round`, `end`.
  `combat` holds the fight events and is included by `round` and `end_round`. A phase tick
  decrements its timer, runs its tag, then checks its own end / win conditions. `round_win` runs
  after the defense win checks of the round (the flag delivery).
- `#ctf:on/<event>`: `match_start`, `warmup_end`, `round_cleanup` (death cameras, Creepenator: start
  of freeze, swap, end), `freeze_start`, `round_start`, `round_win` (storage
  `ctf:round won {winner, loser, reason}`), `end_round_start`, `end_round_end`, `swap`,
  `player_reset` (as a player, before his inventory is cleared: swap, end, lobby join), `prepare`
  (the map is cloned, then warm-up or freeze starts), `match_end`, `reset` (`ctf:set_parameters`),
  `player_join` (as the player).
- Handlers: `<module>:on/<event>`, `<module>:tick/<phase>`, `<module>:tick` (every tick).
- The core (`ctf`) never calls a module function, not even in a `clickEvent` string. Modules call
  each other only through `api/`. Storages (`ctf:flag`, `ctf:ultimate`, `ctf:round`) and the bossbar
  `ctf:match` kept their ids.
- **Function ids are also stored in the world:** the lobby signs (`ctf_lobby:internal/settings/*`,
  rewritten by `ctf_lobby:internal/settings/update_signs`) and the laboratory elevator command
  block at 155 -48 262 (`ctf_maps:map/laboratory/elevator`). Renaming them needs an update in the
  world. Three dead command blocks still call removed functions (`ctf:match/event/*`, a
  `yellow_banner` check).

- **Freeze:** buying, placing the flag and traps.
- **Round:** inventory slots 9-35 are locked with glass panes.
- **End_round:** fighting continues.
- **Swap:** after `swap rounds` rounds the teams swap sides.

**Teams and roles:**

- `team_1` / `team_2` are the scoreboard teams.
- `attack` / `defense` are the side tags. The attack is always red, the defense blue.
- `player` / `lobby` / `spectator` / `dead` / `ultimate` are player tags.

**Modules:**

- `ctf` - the core: phases, teams, timers, hooks, all scoreboard objectives (`set_parameters`),
  the round rules (`match/rules`).
- `ctf_lobby` - the lobby, the map vote, the settings signs, joining the server / the lobby.
- `ctf_maps` - the maps (`map/<map>/<event>`, the dispatch `api/call_current`), map cloning
  (`internal/prepare`).
- `ctf_flag` - the flag: placing, breaking, carrying, delivery; its look (`config`).
- `ctf_fight` - kills, deaths, kill credit (`credit/*`), the death camera.
- `ctf_traps`, `ctf_grenades` (HE and smoke), `ctf_ult` (ultimates and their bar).
- `ctf_inv` - the hotbar layout and the item rules:

  | Slot | Content |
  | --- | --- |
  | 1 | primary weapon |
  | 2 | secondary weapon |
  | 3 | HE grenade |
  | 4-6 | free |
  | 7 | ammo |
  | 8 | stick / flag |
  | 9 | ultimate |
  | offhand | shield, wind charge, totem, fireworks |

  It also handles: the layout check on `inventory_changed` (`ctf.inv_dirty`), item buffers
  (`api/stash` + `api/place`), carry limits, ammo per weapon, ground pickup rights
  (`ctf.can.<kind>` on players, `ctf.r.<kind>` on items, the claim system), armor sets, the exit
  button in the 2x2 crafting grid, bound loot rewards, and the chorus fruit in freeze.
- `ctf_shop` - the shop inside the inventory (slots 9-35 hold paper UI items, `custom_data.ctf_ui`).
  It has a fast path (count of UI items == 27) and pages with `render` + `click` per page.
- `ctf_econ` - CS-like economy; all money values are in its `config`.
- `ctf_guns` - hitscan rays (`ray/*`), the assault rifle; `ctf_sniper` - the sniper (spyglass).
- `ctf_loot` - loot crates for attackers' tasks, and rewards: Inferno blade, walls, stun trap,
  Creepenator.
- `ctf_fx` - camera shake, explosion look.
- `ctf_test` - manual tests (`/function ctf_test:help`).
- `admin` - log and teleports.

**Item `custom_data` keys:**

| Key | Meaning |
| --- | --- |
| `tags:["main weapon"\|"secondary weapon"\|"he_grenade"\|"shield or totem"\|"smoke_grenade"\|"trap"\|"ultimate"]` | group |
| `bind:1b` | has its own slot |
| `wpn:"<id>"` | weapon: kill reward, ammo owner |
| `ammo:"<type>"` + `ctf_ammo:1b` | ammo |
| `lim:"regen"\|"speed"` | limited potion |
| `ctf_item:"chorus"\|"chorus_locked"\|"wind"` | game item |
| `ctf_ui:{slot:N}` / `ctf_craft:{id}` | UI items |
| `ctf_set:{...}` / `ctf_part:1b` | armor set chestplate / its leggings and boots |
| `ctf_bound:1b, ctf_owner:<player_id>` | loot reward |
| `action:"ultimate"\|"exit"\|"skip"` | buttons |

**Kill credit for kills the game credits to nobody** (`ctf_fight:*/credit`):

- `kc.owner` - on trap markers, grenades and clouds.
- On a player: `kc.by` (who), `kc.time` (ticks left), `kc.src`.
- `kc.src` values: 1 grenade, 2 trap, 3 ultimate, 4 inferno fire, 5 Creepenator explosion,
  6 a killed Creepenator creeper.
- `kc.hit` - the last player who hurt this player.
- `credit/mark_traps` lets trap markers in a blast remember the owner of the explosion.
- A vanilla player kill has priority. `credit/trap_task` still counts the loot task "enemy_trap".

**Entity invariants used for typed selectors:**

- trap markers (`trap_marker`) are always **frogs** with 1024 HP and no knockback;
- trap displays (`trap_display`) and `win_trigger` are always **armor stands**.
- Any damage to a trap marker sets the trap off; a direct melee hit removes it (`ctf_traps:trap_hit`).

## Minecraft gotchas learned in this project

- **Default components are not saved.** A component equal to the item's default (for example
  `max_damage` = the default durability) is not stored in the item NBT. Don't read it back: armor
  sets keep `max` in their own `custom_data`.
- **Damage types need a world restart.** Custom damage types (`ctf_guns:*`) are registry entries:
  `/reload` doesn't load them. Damage type tags use `"required": false`, and the code falls back to
  `minecraft:arrow`.
- **`return run` returns failure.** It returns 0 when the command fails; `execute if function` uses
  the return value.
- **`@e` selects only living entities.** An entity killed this tick (death animation) can't be
  selected. That is why trap markers have 1024 HP.
- **Armor stand names ignore teams.** An armor stand shows its custom name to everyone and ignores
  the team `nametagVisibility`. Use a small invisible NoAI mob for team-only names.
- **A mob passenger steers its vehicle.** A NoAI passenger freezes it, so move such entities with
  `tp` every tick instead of riding.
- **Zero damage doesn't hurt.** Player damage of 0 doesn't count as a hit (no `entity_hurt_player`).
  The Creepenator arrow hits hard; nearby players get resistance 255 for one tick.
- **The vanilla kill credit** goes to the last player who hurt the victim within 5 s, even if a trap
  or explosion killed him.
- **`Inventory` NBT covers more than the hotbar.** It includes hotbar, inventory, armor (100-103)
  and offhand (-106), but not the cursor or the crafting grid.
- **`clear` covers the cursor and crafting grid.**
- **Bullet steps are coarse.** Hitscan rays step 0.25 (sniper) / 0.5 (rifle). Thin shapes (doors,
  trapdoors) need the finer check between steps (`ray/fine_*`) and the shape table in `ray/solid`.
