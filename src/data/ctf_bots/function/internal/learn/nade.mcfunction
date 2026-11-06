# A grenade exploded (as its marker, at it; learning on, a map loaded): a player's -> the point within 8
# counts it (lrn.nd); a bot's with an enemy within 4 -> a hit (lrn.nh)
execute unless score Bots_learn settings matches 1 run return 0
execute unless score #map lrn matches 1.. run return 0
scoreboard players operation #pl lrn = @s kc.owner
scoreboard players set #isp lrn 0
execute as @a[tag=player] if score @s player_id = #pl lrn run scoreboard players set #isp lrn 1
execute if score #isp lrn matches 1 as @n[type=marker, tag=lrn_pt, distance=..8] run scoreboard players add @s lrn.nd 10
execute if score #isp lrn matches 1 run return 0
# A bot's grenade with an enemy within 4: a hit (lrn.nh)
scoreboard players set #isb lrn 0
execute as @e[type=zombified_piglin, tag=ctf_bot] if score @s player_id = #pl lrn run tag @s add lrn_nb
execute if entity @e[type=zombified_piglin, tag=lrn_nb, tag=attack] if entity @a[tag=defense, tag=!dead, gamemode=!spectator, distance=..4] run scoreboard players set #isb lrn 1
execute if entity @e[type=zombified_piglin, tag=lrn_nb, tag=defense] if entity @a[tag=attack, tag=!dead, gamemode=!spectator, distance=..4] run scoreboard players set #isb lrn 1
tag @e[type=zombified_piglin, tag=lrn_nb] remove lrn_nb
execute if score #isb lrn matches 1 as @n[type=marker, tag=lrn_pt, distance=..8] run scoreboard players add @s lrn.nh 10
