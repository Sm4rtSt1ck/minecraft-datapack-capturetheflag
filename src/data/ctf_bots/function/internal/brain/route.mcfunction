# An attack bot on its route: to its next point; arrived (within 3): the point after it; stuck for
# 10 seconds (40 thinks): the point is skipped; past the last one (bot.w = 0): to the flag
scoreboard players operation #r bots = @s bot.r
scoreboard players operation #w bots = @s bot.w
function ctf_bots:internal/brain/route_find
scoreboard players operation @s bot.w = #w bots
execute if score #w bots matches 0 run return run function ctf_bots:internal/brain/objective
scoreboard players add @s bot.t 1
execute if entity @e[type=marker, tag=bot_dest, distance=..3] run scoreboard players set @s bot.t 41
execute if score @s bot.t matches 41.. run scoreboard players add @s bot.w 1
execute if score @s bot.t matches 41.. run scoreboard players set @s bot.t 0
execute at @n[type=marker, tag=bot_dest] run function ctf_bots:internal/brain/lure_here
tag @e[type=marker, tag=bot_dest] remove bot_dest
