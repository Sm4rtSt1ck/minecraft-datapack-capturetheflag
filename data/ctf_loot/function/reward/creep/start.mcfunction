# The player becomes a creeper: his camera is put into a creeper (forced spectate) that lives its own
# life. It blows up -> the player dies (the kill goes to loot.cby, who made him a creeper); it is
# killed -> the player dies with it, killed by its killer; the round ends -> he is back (stop_all).
execute if entity @s[tag=ultimate] run function ctf:match/events/ultimate/end
# The flag can't stay with him
execute if function ctf_inv:api/has_flag run function ctf_loot:reward/creep/drop_flag

summon creeper ~ ~ ~ {PersistenceRequired: 1b, Tags: ["loot.creeper", "loot.creeper_new"]}
tp @e[type=creeper, tag=loot.creeper_new, limit=1] @s
scoreboard players operation @e[type=creeper, tag=loot.creeper_new] loot.cown = @s player_id
function ctf_loot:reward/creep/name
tag @s add loot.creep
gamemode spectator @s
spectate @e[type=creeper, tag=loot.creeper_new, limit=1] @s
tag @e[type=creeper, tag=loot.creeper_new] remove loot.creeper_new

particle minecraft:happy_villager ~ ~1 ~ 0.4 0.8 0.4 0 40 force @a[tag=!lobby]
particle minecraft:poof ~ ~1 ~ 0.3 0.6 0.3 0.05 30 force @a[tag=!lobby]
playsound minecraft:entity.zombie_villager.converted player @a[tag=!lobby] ~ ~ ~ 1 1.4
title @s title {"text": "CREEPER", "color": "green"}
title @s subtitle {"text": "Get close to someone to blow up", "color": "gray"}
