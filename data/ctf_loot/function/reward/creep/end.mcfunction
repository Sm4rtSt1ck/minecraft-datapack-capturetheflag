# The player is no longer in a creeper (his camera goes back to him); his name above it is removed
tag @s remove loot.creep
scoreboard players reset @s loot.cby
spectate
scoreboard players operation #me loot.tmp = @s player_id
execute as @e[type=bat, tag=loot.creep_tag] if score @s loot.cown = #me loot.tmp run function ctf_loot:reward/creep/remove
