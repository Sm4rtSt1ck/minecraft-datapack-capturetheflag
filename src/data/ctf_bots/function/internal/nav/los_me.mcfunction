# A step of 1 block from where a bot must go (1 block up) to its eyes (the bot is @s): reached (#los nav
# 1), a solid block on the way, or 30 steps
execute if entity @s[distance=..2.2] run return run scoreboard players set #los nav 1
execute unless block ~ ~ ~ #ctf_bots:gap run return 0
scoreboard players add #step nav 1
execute if score #step nav matches 30.. run return 0
execute positioned ^ ^ ^1 run function ctf_bots:internal/nav/los_me
