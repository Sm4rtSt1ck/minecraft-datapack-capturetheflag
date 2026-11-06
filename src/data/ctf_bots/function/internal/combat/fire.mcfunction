# As a bot: a hitscan shot of ctf_guns (gun 1 sniper, 2 rifle) from its eyes at the eyes of its
# target (bot_tc), with the spread of storage ctf_guns:shot. The bot is the shooter (#bot gun.tmp 1:
# ctf_guns deals the damage "by" it); its teammates (gun.ally) aren't hit
tag @s add gun.shooter
execute if entity @s[tag=attack] run tag @e[type=zombified_piglin, tag=ctf_bot, tag=attack] add gun.ally
execute if entity @s[tag=defense] run tag @e[type=zombified_piglin, tag=ctf_bot, tag=defense] add gun.ally
scoreboard players set #bot gun.tmp 1
$scoreboard players set #gun gun.tmp $(gun)
execute anchored eyes facing entity @a[tag=bot_tc, limit=1] eyes run function ctf_guns:ray/fire with storage ctf_guns:shot
scoreboard players set #bot gun.tmp 0
tag @e[type=zombified_piglin, tag=gun.ally] remove gun.ally
tag @s remove gun.shooter
