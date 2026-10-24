# The coordinates: registry/world.bolt
from registry:world import ARENA
tp @s (ARENA["spectate"][0]) (ARENA["spectate"][1]) (ARENA["spectate"][2])
gamemode spectator @s
tag @s add spectator
tag @s remove player
tag @s remove lobby
tag @s remove defense
tag @s remove attack
team leave @s
