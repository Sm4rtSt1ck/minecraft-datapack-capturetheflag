# A step of 1 block of the ray from the sniper's place to a node (bk_cov): reached (within 1.8 of it)
# -> #los bots 1 (he sees it)
execute if entity @e[type=marker, tag=bk_cov, distance=..1.8] run return run scoreboard players set #los bots 1
execute unless block ~ ~ ~ #ctf_bots:see run return 0
scoreboard players add #step bots 1
execute if score #step bots matches 82.. run return 0
execute positioned ^ ^ ^1 run function ctf_bots:internal/duel/hide_ray
