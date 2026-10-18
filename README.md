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

The economy is modeled on Counter-Strike: winning pays a lot, losing pays a
growing **loss bonus**, and cheap or hard-to-use weapons pay more per kill
than strong ones. Money is spent in the shop during the **freeze phase**.

All money values live in one file:
[`data/ctf_econ/function/config.mcfunction`](data/ctf_econ/function/config.mcfunction).
It is loaded at the start of every match, so balance changes need only a `/reload`.

### Starting money and limit

| Value | Amount |
| --- | --- |
| Money at the start of each half (pistol round) | $150 |
| Maximum money | $1600 |

At the start of each half (match start and team swap) money is reset to the
starting amount and both loss streaks are reset to 0. Money above the maximum
is cut off every time it's earned and again at the start of each freeze phase.

### Round rewards

Every player of the winning team gets the win reward:

| How the round was won | Winner | Reward |
| --- | --- | --- |
| The flag was delivered to the attackers' base | Attack | $350 |
| The defenders did not place the flag before the round started | Attack | $325 |
| All attackers are dead | Defense | $325 |
| The time is over | Defense | $325 |

Every player of the losing team gets the **loss bonus** (see below), with
two exceptions borrowed from CS:

* **Time-out:** attackers who are still alive when the timer runs out get
  **no loss bonus**. Hiding until the end of the round is not rewarded.
* **Flag broken:** if the attack loses the round after breaking the flag,
  every attacker gets **+$80** on top of the loss bonus (like the bomb plant
  bonus in CS).

A round can be won only once: if two win conditions happen in the same tick,
only the first one counts.

### Loss bonus

Each side (attack and defense) has its own **loss streak** counter.

* A lost round raises the counter by 1 (up to 5).
* A won round lowers the counter by 1 (down to 0).
* The bonus is `$140 + $50 × (streak − 1)`:

| Losses in a row | Loss bonus |
| --- | --- |
| 1 | $140 |
| 2 | $190 |
| 3 | $240 |
| 4 | $290 |
| 5 or more | $340 |

Because a win lowers the counter only by 1, a team that keeps losing still
gets a large bonus after an occasional win, just like in CS.

### Personal rewards

| Action | Reward |
| --- | --- |
| Breaking the flag | +$30 |
| Delivering the flag | +$30 |
| Killing a teammate | −$30 (money can't go below $0) |

### Kill rewards

The reward depends on the weapon in the killer's **main hand** at the moment
of the kill. Cheap, default and hard-to-use weapons pay more, strong weapons
pay less:

| Weapon | Reward | Why |
| --- | --- | --- |
| Bare hands / flag breaker (stick) | $150 | like a knife kill |
| Iron sword | $50 | cheap upgrade, like an SMG |
| Bow | $45 | ranged, needs aim |
| Golden sword (default) | $40 | like the default pistol |
| Mace | $40 | needs skill (fall height, wind charges) |
| Fire bow / Punch bow | $40 | |
| Diamond sword | $35 | |
| Netherite sword | $30 | the best melee weapon |
| Crossbow | $20 | very high burst damage |
| Ultimate | $20 | |
| Power bow | $15 | almost one-shot, like an AWP |
| Anything else | $30 | |

Bought weapons carry `custom_data={wpn:"<id>"}`; this is how the kill
reward finds the weapon. Kills by traps and grenades aren't credited to
any player by the game, so they give no money.

Teamkills are detected with the `teamkill.red` / `teamkill.blue` criteria:
the attack team is always red and the defense team is always blue.

### Every reward is shown in chat

```
+$50 kill (iron sword)
+$190 loss bonus (2 in a row)
+$80 the flag was broken
```


## Shop

The shop is built into the player's inventory (slots 9–35) and is available
during the freeze phase. Prices are balanced by damage, attack speed,
melee or ranged, how hard the weapon is to use and how much it changes the
fight.

The price is written twice: in `page/<category>/render.mcfunction` (the price
shown) and in `page/<category>/click.mcfunction` (the price charged). Keep
them in sync.

### Weapons

Only **one primary** (sword / mace) and **one secondary** (bow / crossbow)
weapon can be owned. A bought primary weapon replaces the default golden
sword.

| Item | Price | Stats |
| --- | --- | --- |
| Golden sword (default) | free | 4 dmg, 1.6 speed (6.4 DPS), Knockback II, Sweeping Edge III |
| Iron sword (Fire Aspect I) | $130 | 6 dmg (9.6 DPS) + fire |
| Diamond sword | $200 | 7 dmg (11.2 DPS) |
| Netherite sword | $270 | 8 dmg (12.8 DPS) |
| Mace (Wind Burst I) | $300 | 6 dmg, 0.6 speed; huge damage when falling, hard to use |
| Bow (Power I, Piercing IV) + 30 arrows | $180 | ~9 dmg per full shot |
| Punch bow (Power I, Punch II) + 30 arrows | $220 | knocks enemies off ledges |
| Fire bow (Power I, Flame) + 30 arrows | $230 | + fire |
| Power bow (Power V) + 30 arrows | $400 | ~15 dmg per full shot |
| Crossbow (Multishot) + 5 fireworks | $420 | 7-star fireworks, ~19 area dmg per rocket |

### Defense

| Item | Price | Notes |
| --- | --- | --- |
| Gold armor (full set) | $150 | 11 armor points (default leather: 7) |
| Iron armor (full set) | $250 | 15 armor points, ~60% less damage |
| Shield | $90 | low durability; can't be owned together with a totem |

### Stuff

| Item | Price | Limit per round |
| --- | --- | --- |
| Wind charge ×5 | $120 | — |
| Regeneration potion (Regen II, 10 s, +8 HP) | $120 | 1 |
| Less fall damage boots (Feather Falling III) | $50 | — |
| Totem of undying | $350 | 1 (can't be owned together with a shield) |
| Speed potion (Speed V, 8 s) | $90 | 1 |
| Chorus fruit | $40 | 3 |
| Grenade | $60 | 1 |

### Traps (defenders) and detector (attackers)

Only one kit of each trap can exist per round on the whole server.

| Item | Price |
| --- | --- |
| TNT traps ×3 | $150 |
| Anvil traps ×3 | $120 |
| Web trap | $50 |
| Levitation trap | $70 |
| Wither trap | $40 |
| Enemies detector (attack, within 10 blocks) | $80 |

Traps activate when attackers enter a small radius around them.

### Ultimates

Free. The selected ultimate is shown in hotbar slot 9.

### Round limits

Limited items (see the tables above) are restricted **twice**:

* **Purchase:** items you carried at the start of the freeze phase + items
  bought in this freeze phase can't exceed the limit. Dropping an item
  doesn't allow buying a new one: had 1 chorus → can buy 2 more.
* **Carrying:** you can't pick up more than the limit; anything above it is
  dropped at your feet.

### Inventory layout

| Slot | Item |
| --- | --- |
| 1 | primary weapon |
| 2 | secondary weapon |
| 3 | grenade |
| 4–6 | any other items |
| 7 | arrows |
| 8 | attackers: flag breaker until the flag is broken; then the flag only |
| 9 | ultimate |
| Offhand | only shield, wind charge, totem, fireworks |

Items are moved to their slots automatically. Items with no free place are
dropped; nothing is ever destroyed by the inventory UI. The exit button is
in the top-left slot of the 2×2 crafting grid (freeze and match end) and
asks for confirmation.


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
 ├ ctf_shop/          inventory shop & inventory lock (open / lock / tick)
 │  └ function/
 │     ├ internal/    change detection, click dispatch, rendering
 │     ├ ui/          glass, menu buttons, display items, actionbar
 │     ├ page/        render + click for each category
 │     ├ buy/         purchase templates (give, group, unique, ultimate)
 │     └ product/     non-standard products (armor, bows, crossbow...)
 │
 ├ ctf_econ/          economy: config (all money values), kill rewards, round rewards, loss bonus
 │
 ├ ctf_inv/           hotbar layout, exit button, items on the ground
 │  ├ advancement/    inventory_changed -> layout is checked only after a change
 │  ├ tags/item/      offhand / flag_slot / bound items
 │  └ function/
 │     ├ layout/      take misplaced items out, give stick & ultimate, pickup caps
 │     ├ stash/       put items back by the rules (or drop them, never destroy)
 │     ├ ground/      pickup restrictions (one item of a kind per player per tick)
 │     └ exit/        exit button + yes/no confirmation in the 2x2 crafting grid
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

See the [LICENSE](LICENSE) file for details.
