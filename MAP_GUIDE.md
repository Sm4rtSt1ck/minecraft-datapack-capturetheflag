# Map Guide

How to build a Capture the Flag world from scratch with this datapack: the lobby, the warm-up room,
the podium, the arena, the map templates, their registry entries, the unbreakable blocks and the
markup for the bots.

Short version:

1. Create a 1.21.4 world, install the datapack, run `/function ctf:set_parameters`.
2. Build the fixed places (lobby, warm-up room, podium) at the coordinates of
   [`registry/world.bolt`](registry/world.bolt), or move them there first.
3. Build every map in its own 128 x 64 x 128 box (a *template*) somewhere in the world.
4. Describe each map in [`registry/maps.bolt`](registry/maps.bolt): spawns, flag delivery point,
   walls, loot points, vote button.
5. Place the bot markers in the template, rebuild, `/reload`, play a test match.

Contents:

- [1. How the world is organised](#1-how-the-world-is-organised)
- [2. Creating the world](#2-creating-the-world)
- [3. The fixed places (registry/world.bolt)](#3-the-fixed-places-registryworldbolt)
- [4. Building a map template](#4-building-a-map-template)
- [5. Registering the map (registry/maps.bolt)](#5-registering-the-map-registrymapsbolt)
- [6. Unbreakable blocks](#6-unbreakable-blocks)
- [7. Bots](#7-bots)
- [8. Test checklist](#8-test-checklist)
- [9. Troubleshooting](#9-troubleshooting)


## 1. How the world is organised

```
            north (-Z)
                ^
                |
   ARENA  (-200,-52,-200) .. (-73,11,-73)      LOBBY  around (0,-40,0)
   empty: every match clones                   settings signs at z = 28
   the voted map in here
                                               WARM-UP room  (-87,-51,27) / (-74,-51,26)
                                               PODIUM        around (-80,-48,-5)

   MAP TEMPLATES: one 128 x 64 x 128 box per map, anywhere else in the world
   (the shipped maps use x 0..400, z 43..528)
```

- **Templates** are where the maps are really built. They are never played on.
- **The arena** is an empty box. At the match start the voted template is copied into it
  (`clone`, 128 x 64 x 128 blocks), and again at the side swap. Explosions and broken blocks only
  damage the copy; the template stays clean.
- **All coordinates of a map are written in template coordinates** (what F3 shows while you stand
  on the template). The build moves them into the arena by itself.
- The fixed places (lobby, warm-up room, podium, arena) are the same for every map. Their
  coordinates are in [`registry/world.bolt`](registry/world.bolt).

No coordinate is written in the functions themselves: everything is in the two registries.
After changing a registry, rebuild (`beet build`) and run `/reload`.


## 2. Creating the world

1. **Create the world** in Minecraft Java **1.21.4** with cheats on. A *Superflat* world with the
   *The Void* preset is the easiest: nothing to clear, and the void around the arena keeps
   spectators and falling players out of trouble. Any world type works if the arena box is empty.
2. **Install the datapack** (see [Installation](README.md#installation)): set `output` in
   `beet.json` to `<world>/datapacks`, run `beet build`.
3. **Restart the world once** (leave and join again). The custom damage types of the guns are
   only loaded on a world start, `/reload` is not enough.
4. **Make yourself an admin:** `/tag @s add admin`. Admins get the "Datapack loaded!" title and
   the log messages.
5. **Run `/function ctf:set_parameters`.** It creates all scoreboards and teams, sets the game
   rules, the world spawn and the lobby signs, and sends everyone to the lobby. Run it again
   whenever something looks broken; outside a match it removes nothing you built (see
   [Troubleshooting](#9-troubleshooting)).

While building you are in creative mode. The lobby puts players in adventure mode: use
`/function admin:tp/<map id>` (creative, out of the lobby) or `/gamemode creative` to build.


## 3. The fixed places (registry/world.bolt)

You can build them at the default coordinates below, or build them anywhere and change
[`registry/world.bolt`](registry/world.bolt) (then rebuild and `/reload`). A point is `[x, y, z]`,
a rotation is `[yaw, pitch]` (yaw: -90 faces east, 0 south, 90 west, 180 north).

### Lobby

| Key | Default | What it is |
| --- | --- | --- |
| `LOBBY.spawn`, `spawn_rotation` | `[0, -40, 0]`, `[90, 0]` | where a joining player is teleported |
| `LOBBY.spread`, `spread_under` | `[0.5, 0.5]`, `-40` | then spread around `[x, z]` onto the highest block below this y |
| `LOBBY.world_spawn` | `[0, -41, 0]` | the world spawn |
| `LOBBY.sign_rounds` | `[0, -40, 28]` | sign "ROUNDS TO WIN" |
| `LOBBY.sign_music` | `[1, -40, 28]` | sign "MUSIC" |
| `LOBBY.sign_bots` | `[-1, -40, 28]` | sign "BOTS" (bot count) |
| `LOBBY.music` | `[0, 1000, 0]` | where the lobby music plays from (nothing to build) |

What to build:

- **A floor with its top at y = -41** around `(0, -41, 0)` (players stand at y = -40). Leave the
  space above free: `spreadplayers ... under -40` looks for the highest block below y = -40.
- **A wall behind the signs:** a solid block at `(-1..1, -40, 29)`. The datapack places the signs
  itself (`ctf:set_parameters`), as wall signs facing north, so they hang on the block south of
  them. Without that block a sign pops off at the next block update.
- Nothing else is required. The vote, the "START VOTING" button, the bots button and the
  spectator button are hotbar items the datapack gives.

### Warm-up room

| Key | Default |
| --- | --- |
| `WARMUP.attack`, `attack_rotation` | `[-87, -51, 27]`, `[-90, 0]` |
| `WARMUP.defense`, `defense_rotation` | `[-74, -51, 26]`, `[90, 0]` |

After the vote the players spend 30 seconds here while the map is ready (they can skip it).
Each team stands at its point (the attack faces east, the defense west, 13 blocks apart) with a
firework crossbow and a stone sword; fall damage is on and the inventory is kept.

What to build: **a closed room with its floor top at y = -52** containing both points, big enough
for a fun 30-second fight (cover, a few levels). Players can't leave it (adventure mode, keep it
closed with barriers). The players respawn at their team's point here.

### Podium

| Key | Default | Who stands there |
| --- | --- | --- |
| `PODIUM.winners` | `[-74, -48, -5]` | the top 3 players of the winning team |
| `PODIUM.losers` | `[[-87, -48, -5], [-87, -49, -1], [-87, -50, -9]]` | the losing team's top 1, 2, 3 |

At the match end the best players are shown here, then everyone goes back to the lobby. Build a
stage at the winners' point and three steps for the losers. Each point is the block the player
stands in (floor top = y - 1).

### Arena

| Key | Default | What it is |
| --- | --- | --- |
| `ARENA.corner` | `[-200, -52, -200]` | the lowest north-west block of the arena |
| `ARENA.size` | `[128, 64, 128]` | its size: the arena is x -200..-73, y -52..11, z -200..-73 |
| `ARENA.spectator_min/max` | `[-201, -53, -201]` / `[-72, 76, -72]` | spectators are kept inside this box |
| `ARENA.spectate` | `[-150, -30, -150]` | a new spectator starts here |
| `ARENA.respawn` | `[-150, 0, -150]` | the players' spawnpoint during the match |
| `ARENA.death_marker`, `music` | | technical points, nothing to build |

What to build: **nothing. Keep the arena box empty**: every match overwrites it with the map.
Also keep a margin around it free (spectators are pushed back from a 100-block layer around it).
The arena chunks are force loaded at the match start, the template chunks while it is copied.

### Other

- `HOLD = [0, 100000, 0]`: players wait there, blind and levitating, while the map is copied.
  Nothing to build.
- `ADMIN_TP`: your own admin teleports, `/function admin:tp/<name>`. Change or remove the shipped
  `matchfield` / `testfield`.


## 4. Building a map template

### The box

A template is a box of **128 x 64 x 128 blocks** (`ARENA.size`), starting at its lowest north-west
block (smallest x, y and z). Everything inside the box is copied into the arena, nothing outside.

- Put each template where it overlaps neither the arena nor another template. The shipped maps use
  boxes 150-250 blocks apart, e.g. `[0, -52, 100]`, `[150, -54, 100]`, `[250, -52, 100]`.
- Mark the corner first (for example a block of a striking color under the corner, outside the box)
  and write its coordinates down: this is the map's `template`.
- The map may use the full height of 64 blocks, but nothing above.

### What a Capture the Flag map needs

- **The attack base**: the attack spawn, the **flag delivery point** (the attackers bring the flag
  here: within 2.5 blocks of it), the **loot crate landing points** (6-10 free blocks near the
  spawn) and **walls** that keep the attackers inside during freeze.
- **The defense spawn**, usually far from the attack base, in the area the defense protects.
- **Several routes** between the bases (2-4), with cover, height differences and side paths. The
  defenders hide the flag anywhere they like in freeze, so the defense area should offer many
  hiding places.
- **A closed map.** The arena is surrounded by void: close the map with barriers or walls and a
  roof (or a ceiling of barriers) so nobody leaves it. Players are in adventure mode: they can't
  place or break normal blocks.

### Things to keep in mind

- **Explosions break blocks** (grenades, the TNT trap, Creepenator, the bomber). The map is copied
  again only at the match start and at the side swap, so damage stays for a whole half. Keep the
  important parts safe: use blast-proof blocks (obsidian, bedrock, barriers...) or the
  [unbreakable blocks](#6-unbreakable-blocks), which look like any block.
- **Fire doesn't spread** (`doFireTick false`), blocks drop nothing.
- **Entities in the template are copied too**: armor stands, item frames, paintings, minecarts...
  Don't leave mobs or items in the box. Entities that must be summoned fresh at every copy go
  into the map's `entities` (see [section 5](#5-registering-the-map-registrymapsbolt)).
- **Thin blocks stop bullets only partly**: the guns use a fine check for doors and trapdoors, glass
  and panes are see-through for the bots.
- **Daylight:** the map is played at the current time unless it sets its own `time`.
- **The flag** is placed by a defender in freeze as an item; it falls down to the floor. Avoid
  places where it would fall into the void.

### Reading coordinates

Stand on the block and read F3 (or look at the block: "Targeted block"). For a point where a
player stands (spawn, delivery point), the block the player's feet are in. For areas, the two
opposite corner blocks. All coordinates are template coordinates.


## 5. Registering the map (registry/maps.bolt)

Every map is one entry of `MAPS` in [`registry/maps.bolt`](registry/maps.bolt). All its functions
(`ctf_maps:map/<id>/start|prepare|clone|freeze|round|loot|...`), the vote button and the admin
teleport are generated from this entry at build time.

> **A new world has none of the shipped templates.** The 7 shipped entries point to templates of
> the original world: replace them with your own maps (voting for a map whose template is missing
> copies empty space into the arena).

### Example

```python
{
    "id": "harbor",                      # unique, lowercase: function ids, the bots' learning
    "name": "Harbor",                    # vote button text
    "vote_slot": 0,                      # hotbar slot of the vote button (0..6)
    "map_item": 0,                       # map_id of the button picture (0..9)
    "title": {"text": "Harbor", "color": "aqua"},   # JSON text at the match start
    "music": {"disc": "minecraft:music_disc.cat", "pitch": 1, "period": "3700t"},  # or None
    # "time": 13000,                     # optional: own daylight (the cycle runs)
    "template": [500, -52, 100],         # lowest north-west block of the template box
    # "admin_tp": [560, -30, 160],       # optional: admin:tp/harbor (default: above the middle)
    "win_trigger": [520, -50, 112],      # flag delivery point (attack base)
    "spawns": {
        "attack":  {"center": [520, 110], "under": -49, "spread": 1, "range": 3},
        "defense": {"center": [600, 200], "under": -45, "spread": 1, "range": 3},
    },
    "wall_block": "minecraft:light_blue_stained_glass_pane",
    "walls": [
        {"area": "gate1", "fx": fx("gate1", [["minecraft:explosion_emitter", [0, 1, 0], 0, 1]])},
        {"area": "gate2", "open": "all"},
    ],
    "areas": {
        "gate1": [525, -50, 118, 527, -48, 118],
        "gate2": [530, -50, 105, 530, -48, 107],
    },
    "points": {
        "gate1": [526.5, -48.5, 118.5],
    },
    "loot": [[515, -50, 108], [517, -50, 108], [519, -50, 108],
             [515, -50, 104], [517, -50, 104], [519, -50, 104]],
},
```

### The keys

| Key | Meaning |
| --- | --- |
| `id` | Unique id: `ctf_maps:map/<id>/*`, `admin:tp/<id>`, the bots' learned data of the map. Changing it later loses that data. |
| `name`, `vote_slot`, `map_item` | The vote button: its name, its hotbar slot, the picture. **Slots 0..6 only** (7 is the spectator button, 8 the bots button): at most 7 maps can be voted. |
| `title` | Shown to everyone at the match start. |
| `music` | `disc` (a sound event), `pitch`, `period` (when it is played again; the disc length in ticks). `None`: no music. Players can turn the music off with the lobby sign. |
| `time` | Optional: the time of day set at the match start, the daylight cycle runs. |
| `template` | The lowest north-west corner of the box (rounded down to its block). |
| `admin_tp` | Optional: where `/function admin:tp/<id>` takes you (default: above the middle of the template). |
| `prepare_fills` | Optional fixes applied to the arena before the copy: `[{"area": ..., "block": ..., "replaces": ...}]`. |
| `entities` | Optional: entities summoned at every copy: `[entity, point name, NBT]`. Give them the tag `map_entity` (removed at the next copy). |
| `win_trigger` | The flag delivery point. |
| `spawns` | Every freeze each side is spread (`spreadplayers`) around `center` `[x, z]`, onto the highest block below `under` (set it just above the spawn floor, below any roof), `spread` blocks apart, within `range`. The bots use it too. |
| `wall_block` | The block of the walls. |
| `walls` | Closed at every freeze, opened when the round starts. See below. |
| `areas`, `points` | Named areas `[x1, y1, z1, x2, y2, z2]` and points used by `walls`, `entities`, `prepare_fills`. |
| `loot` | The blocks where the attackers' loot crates land (they fall from 30 blocks above, through blocks). |
| `bot` | Optional backup of the bot markers ([section 7](#7-bots)). |

### Walls

A wall is an area filled at the start of every freeze and emptied when the round starts. Use
them to close the exits of the attack base (and anything else that must open later).

| Wall key | Meaning |
| --- | --- |
| `area` | The area name. |
| `block`, `replaces` | Freeze: `block` (default `wall_block`) replaces `replaces` (default air). |
| `open` | `"replace"` (default): only the wall block is removed; `"all"`: the whole area becomes air; `None`: never opened (a permanent part filled every freeze, e.g. removing lava). |
| `open_area` | Optional: another area emptied at the opening. |
| `fx` | Optional: `fx(point, [[particle, [dx, dy, dz], speed, count], ...], sound_point)`: particles and a sound at the opening. |

### The vote picture

`map_item` is the id of a filled map in the world (`data/map_<id>.dat`). Make a map item of your
template (or any map art), look at its id in the tooltip (advanced tooltips: F3 + H) and use it.
Keep the ids between 0 and 9: the lobby loads these pictures when the vote starts.

### Build and check

1. `beet build` (watch the output: mecha reports errors with file, line and column), `/reload`.
2. `/function admin:tp/<id>`: you should land above your template.
3. Start a match (see the [test checklist](#8-test-checklist)).


## 6. Unbreakable blocks

Explosions break normal blocks. An *unbreakable block* is a barrier with a `block_display` of any
block in it: it looks normal and can't be destroyed. Build them in the template, in the lobby
phase (the tools only work in the lobby state). They are copied into the arena with the map.

| Command | What it does |
| --- | --- |
| `/function admin:build/solid/set {p:[x, y, z], b:"stone"}` | one block |
| `/function admin:build/solid/fill {p:[x1, y1, z1, x2, y2, z2], b:"stone"}` | an area: every block of it becomes unbreakable (whatever stood there is replaced) |
| `/function admin:build/solid/fill_state {p:[...], b:"oak_stairs", s:{facing:"east"}}` | with block states |
| `/function admin:build/solid/remove {p:[...]}` | removes them (barriers become air) |
| `/function admin:build/solid/get {b:"stone"}` | an item that places one (creative), `get_state` with states |
| `/function admin:build/get_tools` | markers: **+** one block, **A** / **B** the corners of an area |
| `/function admin:build/solid/set_pointwise {b:"stone"}` / `remove_pointwise` | on every **+** marker |
| `/function admin:build/solid/fill_markers {b:"stone"}` / `remove_markers` | the area between **A** and **B** |
| `/function admin:build/clear_markers` | removes all build markers |

Break an unbreakable block by hand in creative: its display goes with it.


## 7. Bots

The bots play a match like players: they buy, place traps, hide and defend the flag, take routes,
fight. They play on any map, but they need some markup to play it well. The markup is a set of
**markers placed in the template**: every copy of the map brings them into the arena.

### Markers

`/function admin:build/bots/get_tools` (lobby state) gives spawn eggs of small labelled armor
stands. An egg places its marker **in the block next to the face you click** (click the floor:
the marker stands on it). Only the markers of the kind you hold glow. Hit one in creative to
remove it, `/function admin:build/clear_markers` removes all of them in the loaded chunks.

| Marker | Kind | Where to put it |
| --- | --- | --- |
| **F** (magenta) | flag spot | Where a defense bot may hide the flag. 8-16 spots spread over the defense area, on the floor, reachable. |
| **D** (cyan) | defend spot | Where a defense bot holds a position: corners with cover, windows, high places covering the routes, places near the flag spots. 10-15 spots. A D may stand on a T. |
| **T** (orange) | trap spot | Where a defense bot may place a trap: doorways, corridors, ladders' feet, narrow passages. 10-20 spots. |
| **AN** (brown) | anvil trap spot | Under a ceiling above a passage: click the **underside** of the ceiling block. The anvil falls on whoever walks below. |
| **R1..R4** (lime, yellow, light blue, pink) | attack routes | Up to 4 routes from the attack base to the defense area, one color each. **Place the points in order**, from the attack spawn onwards (they are numbered `R1.1`, `R1.2`...). To change the order, remove the route's markers and place them again. |
| **N** (white) | nav point | A node of the bots' paths only (see below). |

### How the bots find their way

Every marker (except AN) is a **node** of a path graph. After each copy of the map the datapack
tests every pair of nodes up to 16 blocks apart along a **straight line** and links them by what a
player would do there: walk, a narrow path, a jump over a gap (up to 4 blocks), a drop of 2-3
blocks, a fall, a ladder up or down, a wind charge jump. The bots then go from node to node.

So add **N** markers where a straight line between the other markers isn't enough:

- at **both ends of every ladder** (the top one standing on the floor next to the ladder);
- at **both edges of a gap** to jump over, and above and below a drop;
- at **every turn** of a corridor and at crossings (links are straight lines);
- on **platforms, balconies, roofs** the bots should reach, and at the bottom and top of stairs.

Tips:

- Bots climb **ladders** (not vines or scaffolding).
- Fences and walls block a walk link (the bots can't jump them).
- Bots look through glass, panes, bars, leaves and fences; they can blow holes into walls up to
  1.5 blocks thick with grenades, but not into blast-proof blocks (obsidian, bedrock, barriers,
  the unbreakable blocks).
- A map without any marker still works: the bots go straight and use what they learn.

### Seeing the graph

- **In the lobby**, standing on the template: `/function ctf_test:bots/nav` shows the graph of the
  map: nodes as flames, links as colored dust by kind. Run it again to hide it.
  `/function ctf_test:bots/bake` rebuilds it after you move markers.
- **In a match with bots**: the same command shows the arena graph.

Look for nodes without links (a marker floating, inside a block, or too far from others) and add
N markers where links are missing.

### Backup of the markers

The markers live in the world only. Save them into the registry once you're done:

1. In the lobby, with only this template loaded around you, run
   `/function admin:build/bots/dump`.
2. Click the printed line to copy it, paste it into the map's entry as `"bot": {...}`.
3. `/function admin:build/bots/show/<map id>` puts the markers back from this backup (for example
   after they were removed by accident).

The bots read the markers in the template, not the backup.

### Learning

The bots learn on every map in every match (with or without bots; setting `Bots_learn`, on by
default):

- where players walk, jump, climb, fall and use wind charges: new nodes and links of the graph
  where you placed no markers;
- where defenders stand, hide the flag and place traps; where attackers come from; where players
  die and throw grenades; what players buy in each situation;
- what worked for the bots themselves.

So the fastest way to teach the bots a new map is to **play it**: walk all routes, climb, jump,
defend the places you'd defend. Commands:

| Command | What it does |
| --- | --- |
| `/function ctf_test:bots/learn_info` | what the bots learned on the current map (in a match) |
| `/function ctf_test:bots/learn` | learning on / off |
| `/function ctf_test:bots/learn_decay {pct: 95}` | how fast old knowledge fades (once a match) |
| `/function ctf_test:bots/learn_forget` | forget everything learned |

Changing a map a lot? Forget what was learned on it, the old trails would lead into walls.

### Bot settings

Turn the bots on with the bots button in the lobby (hotbar slot 9) and set their count with the
"BOTS" sign. Their behavior is tuned in [`registry/bots.bolt`](registry/bots.bolt), the details are
in [BOTS.md](BOTS.md).


## 8. Test checklist

After `beet build` and `/reload`:

1. **Lobby:** `/function ctf:set_parameters` sends you to the lobby floor; the three signs stand
   at z = 28.
2. **Vote:** "START VOTING" (hotbar slot 5), your map's button is in its slot with its picture.
3. **Copy:** after the vote the arena holds your map (watch from `ARENA.spectate` as a spectator,
   or `/tp` there).
4. **Warm-up:** both teams appear in the warm-up room at their points.
5. **Freeze:** each team stands at its spawn, the attack base is closed by its walls, the defense
   gets the flag and can hide it.
6. **Round:** the walls open (with their particles and sound), the flag can be broken and carried
   to the delivery point.
7. **Loot:** win a round with a loot task (e.g. deliver the flag): at the next freeze a crate
   lands on a loot point.
8. **Swap:** after the half the map is copied again, sides swap.
9. **Bots:** with bots on, the defense bots spread to D spots, place traps on T / AN, hide the
   flag on an F; the attack bots take the routes. `/function ctf_test:bots/nav` shows a connected
   graph.


## 9. Troubleshooting

| Problem | Cause / fix |
| --- | --- |
| Players spawn inside blocks or on the roof | `spawns.*.under` too high (above a roof) or too low (below the floor). |
| The flag delivery doesn't count | The carrier must be within 2.5 blocks of `win_trigger`. |
| Part of the map is missing in the arena | It is outside the 128 x 64 x 128 box of `template`. |
| Blocks of another map appear | Two template boxes overlap. |
| The vote button has no picture | `map_item` is not an existing map id, or above 9. |
| A wall doesn't open | `open: "replace"` removes only `wall_block` / `block`; use `"all"` for a mixed area. |
| Commands fail after a registry change | Read the `beet build` output: mecha stops on errors with file, line and column. |
| `ctf:set_parameters` reset the lobby settings | It does: rounds, music, bots on / off and count go back to their defaults (nothing you built is removed outside a match; the bots' learning is kept). |
| Bots stand still or walk into walls | Missing links: show the graph and add N markers (ladder ends, gap edges, turns). |
| Bots ignore a ladder | No N at its top and bottom, or the top N is not next to the ladder. |
| Guns use arrow damage | The world was not restarted after the datapack was installed (custom damage types). |
