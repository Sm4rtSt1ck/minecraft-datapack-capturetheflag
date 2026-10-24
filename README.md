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

The money values live in [`ctf_econ:config`](src/data/ctf_econ/function/config.mcfunction)
(start, max, round rewards, loss bonus, objectives, teamkill) and the kill rewards in
[`registry/econ.bolt`](registry/econ.bolt). After a change: `beet build`, then `/reload`.

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
| Ultimate (any kill during an active ultimate) | $20 | |
| Grenade | $30 | |
| Trap | $30 | |
| Assault rifle | $25 | strong at close range |
| Sniper rifle | $15 | like an AWP |
| Anything else | $30 | |

Bought weapons carry `custom_data={wpn:"<id>"}`; this is how the kill
reward finds the weapon.

**Grenades, traps and ultimates.** The game credits nobody for these kills
(creeper explosions, falling anvils, effect clouds), so they are credited by
[`ctf_fight:internal/credit`](src/data/ctf_fight/function/internal/credit/):

* every trap marker, grenade and trap effect cloud stores its owner (`kc.owner`);
* when it goes off, every player in its damage radius is marked with the owner
  for a short time (3 s for explosions and anvils, 10 s for wither / levitation);
* if a marked player dies within that time and **no player** got the vanilla
  kill credit, the owner gets the kill (+1 kill, money, ultimate points);
* no reward for killing yourself or a teammate.

The foot eater ultimate deals its damage `by` the ultimate player, so the game
credits those kills itself.

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

Every product is one entry of [`registry/shop.bolt`](registry/shop.bolt): its slot, price,
look and purchase. The shop pages are generated from it at build time, so the price shown
and the price charged are always the same. The purchase limits per round are there too
(`ROUND_LIMITS`); the carry limits are in [`registry/items.bolt`](registry/items.bolt).

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
| Mace (Wind Burst I) + 10 wind charges | $340 | 6 dmg, 0.6 speed; huge damage when falling, hard to use |
| Bow (Power I, Piercing IV) + 30 arrows | $180 | ~9 dmg per full shot |
| Punch bow (Power I, Punch II) + 24 arrows | $220 | knocks enemies off ledges |
| Fire bow (Power I, Flame) + 24 arrows | $230 | + fire |
| Assault rifle + 30 + 90 rounds | $470 | 6 shots/s, every bullet hits (no damage cooldown): ~1.05 dmg in iron, ~1.8 in leather |
| Crossbow (Multishot) + 5 fireworks | $420 | 7-star fireworks, ~19 area dmg per rocket |
| Sniper rifle + 20 rounds | $450 | 20 dmg in leather (one-shot), ~19.3 in gold, ~17.5 in iron; no bullet drop, real scope zoom |

**Sniper rifle** ([`ctf_sniper`](src/data/ctf_sniper/function/)). It is a spyglass: hold right click to
aim (real zoom with lower mouse sensitivity), **release to shoot**. The bullet is hitscan:
a ray from the eyes, no travel time and no drop, stopped by solid blocks, up to 181 blocks.

* Switching the hotbar slot (or dropping the rifle) while aiming cancels the shot.
* Each shot uses 1 sniper round; 3 s reload between shots, shown as a progress bar on the actionbar.
* Damage is reduced by vanilla armor: 21.19 → exactly 20 in leather. Shields block it.
* A hit knocks the target back harder than a normal hit.
* Shooting a trap sets it off; the shooter gets the kill credit for it.
* A shot after less than 0.5 s of aiming (no-scope) gets a random spread of up to 8°.
* Shots are possible during the round and after it ends (end_round), not during freeze.
  Aiming that started during freeze never fires (even if released after the round started);
  the tracer and the sound give away the sniper.
* Damage is dealt by the shooter, so the kill is credited normally. Armor and shields reduce it.
* Settings: [`ctf_sniper:config`](src/data/ctf_sniper/function/config.mcfunction) (reload, scope, spread),
  [`ctf_guns:config`](src/data/ctf_guns/function/config.mcfunction) (damage, range).

**Assault rifle** ([`ctf_guns`](src/data/ctf_guns/function/)). Hold right click to shoot: 6 shots per second.
It is an item with an endless `consumable` use time; while it is "used", the
`ctf_guns:rifle_use` advancement fires every tick; the pause between shots alternates (3-3-4 ticks) for exactly 6 shots/s.

* Its damage type `ctf_guns:rifle` bypasses the damage cooldown, so every bullet deals damage.
  2.35 per bullet, reduced by vanilla armor: ~1.05 in iron, ~1.45 in gold, ~1.8 in leather.
* Small knockback (the target gets 75% knockback resistance during the hit).
* Magazine 30, reserve 90 (slot 7); automatic reload (2.5 s, progress bar) when the magazine is empty.
  Switching the slot cancels the reload. Ammo is shown on the actionbar.
* The spread grows during a burst and resets when the trigger is released; sneaking halves it.
* Thin yellow tracer, up to 181 blocks. Shooting a trap sets it off.
* Both guns share the ray code (`ctf_guns:ray`). The damage types are registry entries:
  after adding or changing them, restart the world (`/reload` is not enough).

### Defense

| Item | Price | Notes |
| --- | --- | --- |
| Gold armor (chestplate, leggings, boots) | $110 | 9 armor points (default leather: 6) |
| Iron armor (chestplate, leggings, boots) | $210 | 13 armor points |
| Leather helmet | $40 | team color, +1 armor point; sold only separately |
| Shield | $90 | low durability; can't be owned together with a totem |

### Stuff

| Item | Price | Limit per round |
| --- | --- | --- |
| Wind charges +5 ($24 each) | $120 | at most 10 in the inventory |
| Regeneration potion (Regen II, 10 s, +8 HP) | $120 | 1 |
| Less fall damage boots (Feather Falling III) | $50 | — |
| Totem of undying | $350 | 1 (can't be owned together with a shield) |
| Speed potion (Speed V, 8 s) | $90 | 1 |
| Chorus fruit | $40 | 3 |
| Grenade | $60 | 1 |
| Smoke grenade (5-block smoke cloud, 20 s) | $50 | 1 |

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

* Any damage to a trap sets it off (`ctf_traps:internal/hurt`): a bullet, an arrow, crossbow
  fireworks, a wind charge, a trident, a grenade or another trap going off nearby (chain reactions),
  fire, the wither cloud... The player who shoots it (any team) gets the kill credit; a trap set off by an
  explosion (a grenade, another trap, the bomber) credits its kills to the owner of that explosion,
  so a chain reaction keeps the first owner (`ctf_fight:api/credit/mark_traps`). The trap markers have
  1024 HP, so damage never kills them before they go off.
* A hit with the hand (any melee hit) removes a trap without setting it off
  (`ctf_traps:internal/hit_by_hand`).

### Ultimates

Free. The selected ultimate is shown in hotbar slot 9.

### Body armor

Chestplate, leggings and boots work as **one set** ([`ctf_inv:armor`](src/data/ctf_inv/function/armor/));
the helmet is separate.

* The set is its chestplate: it stores the material and the boots. When it is put on, the
  leggings and boots appear; they exist only while it is worn.
* All three pieces have the same durability and damage, so they wear out and break together.
* Armor is only worn, never kept in the inventory: a chestplate / helmet that gets into the
  inventory (shift-click, closing the inventory with it on the cursor) is put back on, or dropped
  if that armor slot is taken.
* Taking any piece with the cursor turns the whole set into one chestplate on the cursor (to drop
  it outside the window); dropping any piece drops the whole set.
* Armor on the ground is never picked up into the inventory: walking over it puts it straight on
  if that armor slot is empty, even with a full inventory (`ctf_inv:ground/wear`).
* "Less fall damage" replaces the boots of the worn set (Feather Falling III, same durability).
* Every set gets a random id (`sid`) when it is assembled, so parts of another set are never
  mixed with it (e.g. when another chestplate is put on over the worn one).
* Without body armor a player gets the team leather set at the start of freeze.
* Buying a set: the worn set is dropped at the player's feet and the new one is put on (the
  default leather set is just replaced, like the golden sword). The same set can be bought again
  only when the worn one is damaged.

### Ammo

Every ranged weapon has its **own ammo** (different arrow colors, see
[`ctf_inv:ammo`](src/data/ctf_inv/function/ammo/)). Ammo works by weapon type, not by
weapon instance: you can pick up ammo dropped by anyone, but only for the weapon you have.

| Weapon | Ammo | Max |
| --- | --- | --- |
| Bow | white arrows | 30 |
| Fire bow | orange arrows | 24 |
| Punch bow | purple arrows | 24 |
| Assault rifle | rifle rounds (iron nuggets) | 90 (+30 in the magazine) |
| Sniper rifle | dark red rounds | 20 |
| Crossbow | fireworks | 5 |
| Mace | wind charges | 10 |

* A purchase gives the max ammo; at the start of every freeze phase the ammo is restored to max.
* You can't carry more than max; extra ammo is dropped.
* Ammo without its weapon is dropped, so dropping a weapon drops its ammo too.
* Shot arrows can't be picked up.
* Bows and crossbows can't shoot during freeze: the projectile is removed and the ammo is given back.
* Wind charges can also be bought separately, but at most 10 can be in the inventory.

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
| 7 | ammo of the ranged weapon |
| 8 | attackers: flag breaker until the flag is broken; then the flag only |
| 9 | ultimate |
| Offhand | only shield, wind charge, totem, fireworks |

Items are moved to their slots automatically. Items with no free place are
dropped; nothing is ever destroyed by the inventory UI. The exit button is
in the top-left slot of the 2×2 crafting grid (freeze, round, end of round, match end) and
asks for confirmation.


## Loot Crates (attackers)

An attacker who completes a task by chance during a round (break or deliver the flag, kill with
bare hands, with a wind charge, with an enemy's own trap, 5 kills) gets a shulker box with a
reward at the start of the next freeze phase. It falls from the sky onto his base, only he can
open it, and it disappears when the round starts. Rarity depends on the task.

Full description of the tasks, rarities, settings and landing points: [MECHANICS.md](MECHANICS.md#loot-crates-attackers).


## Tests

Manual tests live in [`ctf_test`](src/data/ctf_test/function/). `/function ctf_test:help` lists them
(click a line to put the command into the chat): camera shake, explosion, dropping a crate
onto any coordinates with any rarity, counting a task as done, dropping the crates of freeze.

Reusable effects: [`ctf_fx`](src/data/ctf_fx/function/) (`ctf_fx:shake`, `ctf_fx:explosion`).

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

The datapack is built with [beet](https://github.com/mcbeet/beet) + bolt from `src/`.

1. Download or clone the repository.
2. Install the build tools (Python 3): `pip install beet mecha bolt`.
3. Set `output` in `beet.json` to the datapacks folder of your world:

```
.minecraft/saves/<world>/datapacks/
```

4. Run `beet build` (or `beet watch` to rebuild on every save). The build creates the
   `CaptureTheFlag` datapack there.
5. Run:

```
/reload
```

6. Start the game using the provided functions.


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
 ├ ctf_econ/          economy: config (money values; kill rewards: registry/econ.bolt), round rewards, loss bonus
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
