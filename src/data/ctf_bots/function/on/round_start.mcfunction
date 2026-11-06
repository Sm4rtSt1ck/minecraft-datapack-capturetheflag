# #ctf:on/round_start: the bots wake up, the resistance of freeze ends (like the players); each bot
# gets its lure, its route (attack) or its defend spot (defense)
execute as @e[type=zombified_piglin, tag=ctf_bot] run data merge entity @s {NoAI: 0b}
effect clear @e[type=zombified_piglin, tag=ctf_bot] minecraft:resistance
kill @e[type=rabbit, tag=bot_lure]
tag @e[type=marker, tag=bot_defend] remove bot_taken
scoreboard players reset @e[type=marker, tag=bot_defend] bot.own
execute as @e[type=zombified_piglin, tag=ctf_bot] at @s run function ctf_bots:internal/brain/start
