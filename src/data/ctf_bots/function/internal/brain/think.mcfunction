# As a bot, at it (4 times a second): what to do now. The target is set only when it changes
# (ctf_bots:internal/brain/target_want, lure_here)
scoreboard players operation #me bots = @s bot.n
execute as @e[type=rabbit, tag=bot_lure] if score @s bot.own = #me bots run tag @s add bot_mylure
execute if entity @s[tag=attack] run function ctf_bots:internal/brain/attack
execute if entity @s[tag=defense] run function ctf_bots:internal/brain/defense
tag @e[type=rabbit, tag=bot_mylure] remove bot_mylure
tag @a remove bot_want
