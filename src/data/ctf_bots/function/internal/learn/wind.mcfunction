# As a player who used a wind charge (lrn.sw grew): the point within 8 counts it (lrn.ws), in a fight
# (an enemy within 10: lrn.wf)
scoreboard players operation @s lrn.bw2 = @s lrn.sw
execute as @n[type=marker, tag=lrn_pt, distance=..8] run scoreboard players add @s lrn.ws 10
scoreboard players set #f lrn 0
execute if entity @s[tag=attack] if entity @a[tag=defense, tag=!dead, gamemode=!spectator, distance=..10] run scoreboard players set #f lrn 1
execute if entity @s[tag=attack] if entity @e[type=zombified_piglin, tag=ctf_bot, tag=defense, distance=..10] run scoreboard players set #f lrn 1
execute if entity @s[tag=defense] if entity @a[tag=attack, tag=!dead, gamemode=!spectator, distance=..10] run scoreboard players set #f lrn 1
execute if entity @s[tag=defense] if entity @e[type=zombified_piglin, tag=ctf_bot, tag=attack, distance=..10] run scoreboard players set #f lrn 1
execute if score #f lrn matches 1 as @n[type=marker, tag=lrn_pt, distance=..8] run scoreboard players add @s lrn.wf 10
