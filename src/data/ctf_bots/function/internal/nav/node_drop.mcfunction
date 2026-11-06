# A bot marker in the air: a block down while there is no floor under it, 3 blocks at most (then nav_air)
scoreboard players add #dd nav 1
execute if score #dd nav matches 4.. run return run tag @s add nav_air
tp @s ~ ~-1 ~
execute at @s if block ~ ~-1 ~ #ctf_bots:gap run function ctf_bots:internal/nav/node_drop
