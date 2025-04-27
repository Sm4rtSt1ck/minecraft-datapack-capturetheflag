# Teleport player
spreadplayers 0 0 1 3 under -38 false @s

# Tags
tag @s add lobby
tag @s remove player
tag @s remove spectator

gamemode adventure @s

# Reset vote
scoreboard players reset @s map_vote

# Effects
effect give @s regeneration infinite 127 true
effect give @s jump_boost infinite 1 true
effect give @s speed infinite 1 true