# Game Mechanics

Detailed description of the game mechanics. A short overview is in the [README](README.md).


## Loot Crates (attackers)

Code: [`ctf_loot`](data/ctf_loot/function/), settings: [`ctf_loot:config`](data/ctf_loot/function/config.mcfunction).

### How it works

1. During a round (including the **end of round** phase) an attacker can complete **tasks**.
   Tasks are never given out: they are things a player can do by chance.
2. For every attacker only the **rarest** task of the round counts. When it is completed, the
   player gets a chat message.
3. At the start of the **next freeze phase** a shulker box falls for every such attacker onto a
   landing point of the map near the attackers' spawn.
4. Only its **owner** can open it (a click on the box). The reward goes straight into his
   inventory and the box disappears. Other players get the message that the crate is not theirs.
5. A crate that wasn't opened disappears with an explosion when the round starts: the reward is lost.

Crates are only for the attacking side. A task completed in the last round of a half (before the
teams swap) gives no crate, because the player is a defender in the next round.

### Tasks

| Task | Rarity | How it is detected |
| --- | --- | --- |
| Deliver the flag to the base | Common | the flag delivery (`ctf:match/events/flag/bring`) |
| Break the flag | Rare | the flag breaking (`ctf:match/events/flag/break`), the player who broke it |
| Kill an enemy with their own trap | Epic | a defender is killed by a trap set off by the attacker: by walking into it, shooting it (bow, crossbow, sniper rifle, assault rifle, fireworks, wind charges) or setting it off otherwise. Any defender counts, not only the one who placed the trap |
| Kill an enemy with bare hands | Legendary | a kill with an empty main hand |
| Kill 5 enemies in one round | Mythic | kills of the round (any weapon, grenades, traps); only if the enemy team has at least 5 players in the match |
| Kill an enemy with a flying wind charge | Mythic | advancement `player_killed_entity` with the killing blow by a `wind_charge` (a direct hit) |

Teamkills never count. Kills, money and the kill credit of traps / grenades are described in the
[README](README.md#kill-rewards).

### Rarities

| Rarity | Shulker box | Falling trail | Reward (test) |
| --- | --- | --- | --- |
| Common | light gray | dark gray → gray | light gray wool |
| Rare | blue | dark blue → blue | blue wool |
| Epic | purple | dark purple → purple | purple wool |
| Legendary | yellow | dark gold → gold | yellow wool |
| Mythic | red | dark → crimson | red wool |

The rewards are test items for now; every rarity has one `reward` in the config (an item for `give`,
components allowed).

### The fall

* The crate falls from **30 blocks** above its landing point, accelerating: 30 blocks in 30 ticks.
* It is an invisible marker moved with `tp`, so it flies through any blocks (invisible ceilings too).
* Trail: `dust_color_transition` from a darker shade to the rarity color.
* Landing: the shulker box (rarity color), a white (pale oak) sign above it with the rarity and
  the owner's name, a TNT-like explosion (particles + sound, no damage) and a camera shake for
  attackers within 25 blocks.
* The box is never opened as a container: an invisible `interaction` entity over it catches the
  clicks and checks the clicker's UUID.

### Settings

[`ctf_loot:config`](data/ctf_loot/function/config.mcfunction):

* `rarities` - for every rarity: sign text, box, trail colors, text color, reward;
* `tasks` - for every task: rarity rank (1 common .. 5 mythic) and chat text;
* `kills` - the "kills" task: kills needed and the minimum number of enemies.

**Landing points:** `ctf:match/maps/<map>/loot.mcfunction`, one line per point (the block where the
box lands). Every crate needs its own point, so a map needs as many points as attackers can be:

```mcfunction
function ctf_loot:point {x: -170, y: -49, z: -115}
```

**New task:** call `function ctf_loot:task {id: "<id>"}` as the player where it happens and add the
id to `tasks` in the config.

### Tests

`/function ctf_test:help` lists the tests (click a line to put the command into the chat):

* `ctf_test:loot/drop {x, y, z, rarity}` - your crate onto any block;
* `ctf_test:loot/drop_here {rarity}` - your crate onto the block you stand in;
* `ctf_test:loot/task {id}` - count a task as done (any phase), `ctf_test:loot/best` - your best task;
* `ctf_test:loot/freeze` - drop the crates like at the start of freeze;
* `ctf_test:loot/clear` - remove all crates with the explosion;
* `ctf_test:loot/reload_config` - apply changes of the config.


## Death Camera

Code: [`ctf:match/events/fight/deathcam`](data/ctf/function/match/events/fight/deathcam/).

After a death (when the player is moved to his death location) his camera is put for **3.5 seconds**
into a tiny invisible enderman (no AI, silent, invulnerable, no gravity). The game shows the world
in negative from the eyes of an enderman. The enderman keeps turning to the **killer**.

* No killer (fall, void, own explosion) - no death camera.
* The killer is highlighted **only for the victim**: particles around him are shown to this player
  only (a real glowing outline is seen by everyone). They are cyan, so in the negative view they look red.
* The camera is forced: if the player leaves it (sneak), he is put back the next tick.
* Entering: the blindness of the death fades out. Leaving: a blindness fades in shortly before the
  end and fades out after it. The negative view itself switches on / off instantly (it is the game's
  own camera effect).
* The start of freeze, the team swap, the end of the match and leaving to the lobby end it right away.
* The tiny enderman still makes a few portal particles (the client always spawns them) and its eyes
  may be seen by others as two dots.

Test: `/function ctf_test:fx/deathcam` (looks at the nearest other player, makes you a spectator).
