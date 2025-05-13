#########################################
# TELEPORT

spreadplayers 0 0 1 3 under -40 false @s

#########################################
# TAGS

tag @s add lobby
tag @s remove player
tag @s remove spectator
tag @s remove attack
tag @s remove defense
tag @s remove dead
tag @s remove just_died
tag @s remove just_killed

#########################################

clear @s
team leave @s
gamemode adventure @s
execute positioned as @s run spawnpoint @s

#########################################
# EFFECTS

effect clear @s
effect give @s minecraft:regeneration 1 127 true
effect give @s minecraft:resistance infinite 127 true
effect give @s minecraft:jump_boost infinite 1 true
effect give @s minecraft:speed infinite 1 true
effect give @s minecraft:saturation infinite 127 true

#########################################
# OTHER

execute at @s run playsound entity.firework_rocket.launch ambient @s ~ ~ ~ 1 1
