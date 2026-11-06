# As a bot: on the side of the bot tagged bk_me? (1)
execute if entity @s[tag=attack] if entity @e[type=zombified_piglin, tag=bk_me, tag=attack] run return 1
execute if entity @s[tag=defense] if entity @e[type=zombified_piglin, tag=bk_me, tag=defense] run return 1
return 0
