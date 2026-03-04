# Capture the Flag Datapack

A competitive **Capture the Flag PvP minigame** implemented entirely with a Minecraft **datapack**.

The game is designed for multiplayer servers and focuses on tactical gameplay, economy management, traps, and team coordination.


## Overview

Two teams fight for control over a hidden flag.

* **Defenders** hide a flag somewhere on the map and place traps.
* **Attackers** must find the flag and bring it back to their base before the round timer expires.
* If all attackers die or time runs out — defenders win.

There are **no respawns during a round**, so every decision matters.


## Core Gameplay

### Teams

Players are split into two teams:

* **Defenders**
* **Attackers**

Teams switch sides halfway through the match.


### Match Structure

Each match consists of **10 rounds**.

After **5 rounds**, teams swap roles.

Game phases:

1. **Lobby**
2. **Map Vote**
3. **Warmup**
4. **Freeze (Buy + Setup Phase)**
5. **Round**
6. **Intermission**
7. **Rotation (Team Swap)**
8. **Match End**


### Setup Phase

Before each round:

**Defenders**

* hide the flag
* place traps
* choose defensive positions
* buy equipment

**Attackers**

* buy weapons and utilities
* prepare their strategy
* wait until defenders finish placing the flag

After the setup phase ends, attackers are released into the map.


### Round Phase

Attackers must:

1. Locate the hidden flag
2. Break it
3. Carry it back to their spawn

Defenders must:

* protect the flag
* eliminate attackers
* delay the round until time runs out

Victory conditions:

| Condition                  | Winner    |
| -------------------------- | --------- |
| Attackers deliver the flag | Attackers |
| All attackers die          | Defenders |
| Timer expires              | Defenders |


## Economy System

Players earn money during the match.

Rewards include:

* round victory
* round loss
* kills
* objectives

Money can be spent during the **freeze phase**.


## Shop

Players can purchase equipment before each round.

### Weapons

* Iron Sword
* Diamond Sword
* Netherite Sword
* Mace
* Bow
* Crossbow
* Arrows
* Poison Arrows
* Firework Rockets


### Armor

* Iron Armor
* Diamond Armor
* Shield


### Consumables

* Totem of Undying
* Regeneration Potion
* Speed Potion


### Traps (Defenders)

Defenders can place traps around the map.

Examples:

* TNT trap
* Falling anvil
* Cobweb trap
* Levitation trap
* Wither trap

Traps activate when attackers enter a small radius around them.


## Features

* Fully vanilla datapack
* No mods required
* Round-based gameplay
* Economy system
* Shop implemented in inventory
* Hidden flag mechanics
* Trap system
* Map voting
* Bossbar timers
* Scoreboards for statistics


## Installation

1. Download or clone the repository.
2. Place the datapack folder into:

```
.minecraft/saves/<world>/datapacks/
```

3. Run:

```
/reload
```

4. Start the game using the provided functions.


## Datapack Structure

```
data/
 ├ minecraft/
 │  └ tags/function/
 │     ├ load.json
 │     └ tick.json
 │
 ├ admin/
 │  └ function/
 │     ├ log/
 │     └ tp/
 │
 └ ctf/
    ├ function/
    │  ├ load.mcfunction
    │  ├ tick.mcfunction
    │  ├ set_parameters.mcfunction
    │  ├ set_default_settings.mcfunction
    │  ├ combine_commands.mcfunction
    │  ├ events/
    │  ├ lobby/
    │  └ match/
    │     ├ start.mcfunction
    │     ├ swap_teams.mcfunction
    │     ├ spectate.mcfunction
    │     ├ keep_spectators_in_bounds.mcfunction
    │     ├ events/
    │     ├ helpers/
    │     ├ maps/
    │     ├ prepare/
    │     ├ warmup/
    │     ├ freeze/
    │     ├ round/
    │     ├ end_round/
    │     └ end/
    │
    ├ predicate/
    └ advancement/
```


## Development

The datapack relies heavily on:

* `scoreboard`
* `storage`
* `execute`
* `functions`
* custom items
* bossbars
* scheduled functions

The codebase is organized around **game states and phases**.


## Future Plans

Possible improvements:

* additional maps
* more trap types
* better UI
* spectator features
* replay / statistics
* balance changes


## Contributing

Pull requests and suggestions are welcome.

If you want to:

* add a new map
* improve game balance
* add new traps or mechanics

feel free to open an issue.


## License

Code is licensed under the MIT License.

<!-- See the LICENSE file for details. -->
