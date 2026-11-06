# Up a ladder block by block; at its top: off it towards its wall (ctf_bots:internal/nav/ladder_exit)
scoreboard players add #lh nav 1
execute if score #lh nav matches 64.. run return 0
execute if block ~ ~1 ~ minecraft:ladder positioned ~ ~1 ~ run return run function ctf_bots:internal/nav/climb_up
execute if block ~ ~ ~ minecraft:ladder[facing=north] positioned ~ ~1 ~1 run return run function ctf_bots:internal/nav/ladder_exit
execute if block ~ ~ ~ minecraft:ladder[facing=south] positioned ~ ~1 ~-1 run return run function ctf_bots:internal/nav/ladder_exit
execute if block ~ ~ ~ minecraft:ladder[facing=west] positioned ~1 ~1 ~ run return run function ctf_bots:internal/nav/ladder_exit
execute if block ~ ~ ~ minecraft:ladder[facing=east] positioned ~-1 ~1 ~ run return run function ctf_bots:internal/nav/ladder_exit
