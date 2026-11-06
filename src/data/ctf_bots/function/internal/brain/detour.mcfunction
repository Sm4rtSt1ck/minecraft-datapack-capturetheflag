# As a bot on a detour (bot.det thinks left): to its detour marker (bot.dt = its number + 1); there
# (within 3) or the time is over: the detour ends and it thinks as usual again
scoreboard players remove @s bot.det 1
scoreboard players operation #dt bots = @s bot.n
scoreboard players add #dt bots 1
execute as @e[type=marker, tag=bot_nav] if score @s bot.dt = #dt bots run tag @s add bot_dest
execute unless entity @e[type=marker, tag=bot_dest] run scoreboard players set @s bot.det 0
execute if entity @e[type=marker, tag=bot_dest, distance=..3] run scoreboard players set @s bot.det 0
execute if score @s bot.det matches 1.. at @n[type=marker, tag=bot_dest] run function ctf_bots:internal/brain/lure_here
execute if score @s bot.det matches 0 as @e[type=marker, tag=bot_dest] run scoreboard players reset @s bot.dt
tag @e[type=marker, tag=bot_dest] remove bot_dest
