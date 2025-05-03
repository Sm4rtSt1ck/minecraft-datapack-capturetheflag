#########################################
# TELEPORT

spreadplayers 0 0 1 3 under -38 false @s

#########################################
# TAGS

tag @s add lobby
tag @s remove player
tag @s remove spectator
tag @s remove attack
tag @s remove defense

#########################################

clear @s
team leave @s
gamemode adventure @s

#########################################
# EFFECTS

effect give @s regeneration infinite 127 true
effect give @s jump_boost infinite 1 true
effect give @s speed infinite 1 true
effect give @s minecraft:saturation infinite 127 true