# #ctf:on/freeze_start (after the map spawns). Like the players: the bots alive go back to their base,
# healed, with the freeze effects; the dead ones of the last round come back (BOTS.md)
from registry:bots import POST_TP
execute if score team bots matches 0 run return run function ctf_bots:on/remove
function ctf_bots:internal/flag/clear
# New trail points learned: the graph baked again (they become nodes)
execute if score #lrn_new lrn matches 1 run function ctf_bots:internal/nav/bake_start
scoreboard players set #lrn_new lrn 0

function ctf_bots:internal/spawn/missing
function ctf_bots:internal/score/init
function ctf_bots:internal/spawn/side
execute as @e[type=zombified_piglin, tag=ctf_bot_new] run function ctf_bots:internal/spawn/id
function ctf_bots:internal/spawn/numbers
tag @e[type=zombified_piglin, tag=ctf_bot_new] remove ctf_bot_new
function ctf_bots:internal/trick/traits
execute as @e[type=zombified_piglin, tag=ctf_bot] run function ctf_bots:internal/freeze_reset
function ctf_maps:api/call/spawn_bots
function ctf_bots:internal/count

# Buying (like the players, from their wallets; a defense bot on a high base buys ranged weapons)
function ctf_bots:internal/money/wallets
tag @e[type=marker, tag=bot_wallet] remove dead
function ctf_bots:internal/buy/high_base
scoreboard players set #ranged bots 0
execute if score #high bots matches 1 if score #attack bots matches 0 run scoreboard players set #ranged bots 1
execute as @e[type=zombified_piglin, tag=ctf_bot] run function ctf_bots:internal/buy/start

# Defense bots: the flag goes to a random flag spot of the map (bot markers, BOTS.md); a map without
# flag spots: where a defense bot stands
execute if entity @e[type=zombified_piglin, tag=ctf_bot, tag=defense] run function ctf_bots:internal/flag/hide

# Traps of the defense bots (with the money left), near the flag more often
execute if entity @e[type=zombified_piglin, tag=ctf_bot, tag=defense] run function ctf_bots:internal/traps/buy

# Defend spots free again; some defense bots go straight to their spots (POST_TP: ctf_bots:internal/brain/post)
tag @e[type=marker, tag=bot_defend] remove bot_taken
scoreboard players reset @e[type=marker, tag=bot_defend] bot.own
tag @e[type=zombified_piglin, tag=ctf_bot] remove bot_posted
execute as @e[type=zombified_piglin, tag=ctf_bot, tag=defense, sort=random] if predicate {condition: "minecraft:random_chance", chance: (POST_TP)} run function ctf_bots:internal/brain/post
