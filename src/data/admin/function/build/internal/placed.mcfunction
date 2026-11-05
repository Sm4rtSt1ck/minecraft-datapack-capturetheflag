# admin:tick, as a player who has used a bat spawn egg: a new marker A / B removes the old one
scoreboard players reset @s build.place
execute if entity @e[type=armor_stand, tag=build_a, tag=!build_seen] run kill @e[type=armor_stand, tag=build_a, tag=build_seen]
execute if entity @e[type=armor_stand, tag=build_b, tag=!build_seen] run kill @e[type=armor_stand, tag=build_b, tag=build_seen]
# A new route point of the bots (admin:build/bots/get_tools): its number in the route
execute as @e[type=armor_stand, tag=build_route, tag=!build_seen] run function admin:build/bots/internal/route_index
execute if entity @e[type=armor_stand, tag=build_bot, tag=!build_seen] run function admin:build/bots/internal/glow_reset
tag @e[type=armor_stand, tag=build_marker, tag=!build_seen] add build_seen
