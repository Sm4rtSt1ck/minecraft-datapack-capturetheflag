# At the point lrn_A: a link to lrn_B of the observed kind #lt2 lrn (a player did it), within 24 blocks:
# its cost = the distance x 10 x the cost of its kind / 10 (+ the failures); a fall: its height - 3 hurts
from registry:bots import NAV
execute as @n[type=marker, tag=lrn_B] run function ctf_bots:internal/team/dist
execute unless score #dist bots matches ..24 run return 0
scoreboard players operation #c lrn = #dist bots
scoreboard players set #k lrn 10
execute if score #lt2 lrn matches 3 run scoreboard players set #k lrn (NAV["cost"]["jump"])
execute if score #lt2 lrn matches 5..6 run scoreboard players set #k lrn 25
execute if score #lt2 lrn matches 7 run scoreboard players set #k lrn (NAV["cost"]["fall"])
execute if score #lt2 lrn matches 8 run scoreboard players set #k lrn (NAV["cost"]["wind"])
scoreboard players operation #c lrn *= #k lrn
execute if score #lt2 lrn matches 8 run scoreboard players add #c lrn (NAV["wind_cost"])
scoreboard players operation #x lrn = #lf lrn
scoreboard players set #k lrn 150
scoreboard players operation #x lrn *= #k lrn
scoreboard players operation #c lrn += #x lrn
execute store result score #ya lrn run data get entity @n[type=marker, tag=lrn_A] Pos[1]
execute store result score #yb lrn run data get entity @n[type=marker, tag=lrn_B] Pos[1]
scoreboard players operation #ya lrn -= #yb lrn
scoreboard players remove #ya lrn 3
execute if score #ya lrn matches ..0 run scoreboard players set #ya lrn 0
summon marker ~ ~ ~ {Tags: ["nav_link", "map_entity", "nav_new"]}
scoreboard players operation @e[type=marker, tag=nav_new] nav.to = #bid lrn
scoreboard players operation @e[type=marker, tag=nav_new] nav.t = #lt2 lrn
scoreboard players operation @e[type=marker, tag=nav_new] nav.c = #c lrn
scoreboard players operation @e[type=marker, tag=nav_new] nav.f = #ya lrn
tag @e[type=marker, tag=nav_new] remove nav_new
