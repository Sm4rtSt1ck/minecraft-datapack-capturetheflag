# A step of 1 block from the bot's eyes to the node tagged nav_see: reached (#los nav 1), a solid block
# on the way, or 16 steps
execute if entity @e[type=marker, tag=nav_see, distance=..1.2] run return run scoreboard players set #los nav 1
execute unless block ~ ~ ~ #ctf_bots:gap run return 0
scoreboard players add #step nav 1
execute if score #step nav matches 16.. run return 0
execute positioned ^ ^ ^1 run function ctf_bots:internal/nav/los_node
