# As a bot going to its ladder (bot.clm thinks left, ctf_bots:internal/climb/found): at it (within
# 1.3): it climbs (ctf_bots:internal/climb/start); else its lure there. Not reached in time: no new
# search for CLIMB "wait" thinks
from registry:bots import CLIMB
scoreboard players remove @s bot.clm 1
execute as @e[type=marker, tag=bot_ladder] if score @s bot.own = #me bots run tag @s add bot_dest
execute unless entity @e[type=marker, tag=bot_dest] run scoreboard players set @s bot.clm 0
execute if entity @e[type=marker, tag=bot_dest, distance=..1.3] run function ctf_bots:internal/climb/start
execute if score @s bot.clm matches 1.. at @n[type=marker, tag=bot_dest] run function ctf_bots:internal/brain/lure_here
execute if score @s bot.clm matches 0 unless entity @s[tag=bot_climb] run scoreboard players set @s bot.clw (CLIMB["wait"])
execute if score @s bot.clm matches 0 run kill @e[type=marker, tag=bot_dest]
tag @e[type=marker, tag=bot_dest] remove bot_dest
