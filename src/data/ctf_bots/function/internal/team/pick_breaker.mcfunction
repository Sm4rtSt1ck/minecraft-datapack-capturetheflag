# The breaker: the attack bot with the shortest way to the flag (ctf_bots:internal/team/path)
scoreboard players set #best bots 1000000
execute as @e[type=zombified_piglin, tag=ctf_bot, tag=attack] at @n[type=armor_stand, tag=flag] run function ctf_bots:internal/team/path_store
execute as @e[type=zombified_piglin, tag=ctf_bot, tag=attack] if score @s bot.pf = #best bots run tag @s add bot_brk_new
tag @e[type=zombified_piglin, tag=bot_brk_new, limit=1] add bot_brk
tag @e[type=zombified_piglin, tag=bot_brk_new] remove bot_brk_new
