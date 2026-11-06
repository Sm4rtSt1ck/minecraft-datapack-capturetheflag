# The point #w of the route #r gets the tag bot_dest; a number without a point (a removed marker): the
# next number; past 99: the route is done (#w = 0)
execute as @e[type=marker, tag=bot_route] if score @s bot.r = #r bots if score @s bot.idx = #w bots run tag @s add bot_dest
execute if entity @e[type=marker, tag=bot_dest] run return 1
scoreboard players add #w bots 1
execute if score #w bots matches 100.. run return run scoreboard players set #w bots 0
function ctf_bots:internal/brain/route_find
