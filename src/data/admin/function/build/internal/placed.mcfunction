# admin:tick, as a player who has used a bat spawn egg: a new marker A / B removes the old one
scoreboard players reset @s build.place
execute if entity @e[type=armor_stand, tag=build_a, tag=!build_seen] run kill @e[type=armor_stand, tag=build_a, tag=build_seen]
execute if entity @e[type=armor_stand, tag=build_b, tag=!build_seen] run kill @e[type=armor_stand, tag=build_b, tag=build_seen]
tag @e[type=armor_stand, tag=build_marker, tag=!build_seen] add build_seen
