summon marker -190 0 -190 {Tags: ["lastDeathMarker"]}
execute store result entity @e[type=marker, tag=lastDeathMarker, limit=1] Pos[0] double 1 run data get entity @s LastDeathLocation.pos[0]
execute store result entity @e[type=marker, tag=lastDeathMarker, limit=1] Pos[1] double 1 run data get entity @s LastDeathLocation.pos[1]
execute store result entity @e[type=marker, tag=lastDeathMarker, limit=1] Pos[2] double 1 run data get entity @s LastDeathLocation.pos[2]
tp @s @e[type=marker, tag=lastDeathMarker, limit=1]
kill @e[type=marker, tag=lastDeathMarker]
