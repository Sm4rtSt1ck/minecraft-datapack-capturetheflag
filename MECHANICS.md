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
4. The reward **lies inside the box**: the owner opens it and decides whether to take it. Anyone can
   open the box, but the reward is bound to its owner (`ctf_bound`, `ctf_owner`): if another player
   takes it, it goes straight back into the box; dropped on the ground, only the owner can pick it up.
5. A crate that wasn't opened disappears with an explosion when the round starts: the reward is lost.

Crates are only for the attacking side. A task completed in the last round of a half (before the
teams swap) gives no crate, because the player is a defender in the next round.

### Tasks

| Task | Rarity | Reward | How it is detected |
| --- | --- | --- | --- |
| Deliver the flag to the base | Common | Stun trap | the flag delivery (`ctf:match/events/flag/bring`) |
| Break the flag | Rare | test item | the flag breaking (`ctf:match/events/flag/break`), the player who broke it |
| Take more than 20 damage in one round and stay alive ("unkillable") | Rare | 3 walls | stat `damage_taken` of the round (totems and regeneration make it possible); checked for alive players only |
| Kill an enemy with their own trap | Epic | Creepenator | a defender is killed by a trap set off by the attacker: by walking into it, shooting it (bow, crossbow, sniper rifle, assault rifle, fireworks, wind charges) or setting it off otherwise. Any defender counts, not only the one who placed the trap |
| Kill 10 enemies in this match | Epic | Inferno blade | kills of the whole match (both sides), once per match, counted at the start of freeze |
| Kill an enemy with bare hands | Legendary | test item | a kill with an empty main hand |
| Kill 5 enemies in one round | Mythic | test item | kills of the round (any weapon, grenades, traps); only if the enemy team has at least 5 players in the match |
| Kill an enemy with a flying wind charge | Mythic | test item | advancement `player_killed_entity` with the killing blow by a `wind_charge` (a direct hit) |

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

### Rewards

A task with its own reward gives it (`reward` in the config: function `ctf_loot:reward/<reward>`),
otherwise the crate gives the test item of the rarity.

**Inferno blade** (`ctf_loot:reward/inferno`). A netherite sword (Fire Aspect I). A hit also deals
4 damage to every enemy within 3 blocks in front of the player and sets the ground on fire for
5 seconds (fire blocks around, like a molotov; fire doesn't spread because `doFireTick` is off).
8 seconds cooldown; a sound when it is ready. Burn kills are credited to the owner.
A main weapon (slot 1): it replaces the default golden sword; with another main weapon it can't be
taken (it goes back into the box) - drop your weapon first.

**Walls** (`ctf_loot:reward/walls`), 3 pieces. Invisible invulnerable armor stands without gravity:
arrows bounce off them (vanilla behavior), bullets of the sniper rifle / assault rifle stop at them. Brown particles show where they are. They are removed when
the end of round phase ends.

**Stun trap** (`ctf_loot:reward/stun`). An invisible marker with faint pale particles. It works only
against the defense (crates are only for attackers): the first defender that comes within 1.5 blocks
sets it off, every defender within 2.5 blocks is stunned for 3 seconds (almost no movement, no jumping, no hitting, nausea). Removed at the end of
the round like the walls.

**Creepenator** (`ctf_loot:reward/creep`). A bow, a secondary weapon (like the Inferno blade: with
another secondary weapon it can't be taken). Its 3 green arrows are given when the bow is taken for
the first time; they are its ammo (slot 7, like every ammo: dropped together with the bow, never
refilled). A hit player
(any team) becomes a creeper:

* a creeper with his name above it (seen only by his team: a tiny invisible bat (no AI) of his team, moved above the creeper every tick) is spawned in his place and his camera is put into it (spectator, forced `spectate`:
  sneaking out puts him back). The creeper lives its own life: it walks to the nearest player of
  either team and blows up;
* the shooter loses the bow and the arrows left right after the hit;
* any hit player counts, teammates too (friendly fire is on). The arrow deals no damage: players next
  to a flying Creepenator arrow get resistance 255 for that tick (the arrow hits hard, so the damage
  cooldown never cancels the hit), so it works at any health. A hit blocked with a shield doesn't count;
* the creeper blows up -> the player dies there; the kill (and the kills of its explosion) go to
  the shooter (`kc.src` 5, money `kill.creepenator`; no reward for teammates);
* the creeper is killed (hits, bows, sniper rifle, assault rifle...) -> the player dies with it, no
  explosion; the kill goes to the player who killed the creeper (`kc.src` 6, money `kill.creeper`);
* the round ends and the creeper didn't blow up -> the player doesn't die; at the start of freeze the
  creeper is removed and he is back as usual. The creeper keeps living during the end of round phase;
* a player in a creeper still counts as alive for his team; if he carried the flag, it is dropped.

**Placing in adventure mode.** Walls and stun traps are spawn eggs of an armor stand with
`can_place_on` for any block: in adventure mode an item can be used on the blocks listed there, so the
armor stand is placed exactly where the player looks, like in survival. Adventure mode stays on.

### The fall

* The crate falls from **30 blocks** above its landing point, accelerating: 30 blocks in 30 ticks.
* It is an invisible marker moved with `tp`, so it flies through any blocks (invisible ceilings too).
* Trail: `dust_color_transition` from a darker shade to the rarity color.
* Sound: a falling bomb whistle (a flute note sliding down, `ctf_loot:fall/whistle`).
* Landing: the shulker box (rarity color), a white (pale oak) sign above it with the rarity and
  the owner's name, a TNT-like explosion (particles + sound, no damage) and a camera shake for
  attackers within 25 blocks.
* The reward is put into the middle slot of the box.

### Settings

[`ctf_loot:config`](data/ctf_loot/function/config.mcfunction):

* `rarities` - for every rarity: sign text, box, trail colors, text color, reward;
* `tasks` - for every task: rarity rank (1 common .. 5 mythic), chat text and the reward;
* `unkillable` - damage needed (tenths of HP), `kills_total` - kills needed in the match;
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
* `ctf_test:loot/reward {id}` - get a reward: inferno / walls / stun / creep;
* `ctf_test:loot/creep` - turn yourself into a Creepenator creeper;
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
