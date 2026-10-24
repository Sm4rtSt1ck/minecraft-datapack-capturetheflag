# The marker is summoned in the arena (registry/world.bolt)
from registry:world import ARENA
summon marker (ARENA["death_marker"][0]) (ARENA["death_marker"][1]) (ARENA["death_marker"][2]) {Tags: ["lastDeathMarker"]}
execute store result entity @e[type=marker, tag=lastDeathMarker, limit=1] Pos[0] double 1 run data get entity @s LastDeathLocation.pos[0]
execute store result entity @e[type=marker, tag=lastDeathMarker, limit=1] Pos[1] double 1 run data get entity @s LastDeathLocation.pos[1]
execute store result entity @e[type=marker, tag=lastDeathMarker, limit=1] Pos[2] double 1 run data get entity @s LastDeathLocation.pos[2]
tp @s @e[type=marker, tag=lastDeathMarker, limit=1]
kill @e[type=marker, tag=lastDeathMarker]
