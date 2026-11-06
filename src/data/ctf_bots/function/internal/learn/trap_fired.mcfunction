# #ctf:on/trap_fired (as a trap marker going off, learning on, a map loaded): placed by a bot -> the
# point within 6 counts it (lrn.tw: a bot trap that worked)
execute unless score Bots_learn settings matches 1 run return 0
execute unless score #map lrn matches 1.. run return 0
scoreboard players operation #pl lrn = @s kc.placer
scoreboard players set #isb lrn 0
execute as @e[type=zombified_piglin, tag=ctf_bot] if score @s player_id = #pl lrn run scoreboard players set #isb lrn 1
execute if score #isb lrn matches 0 run return 0
execute at @s as @n[type=marker, tag=lrn_pt, distance=..6] run scoreboard players add @s lrn.tw 10
