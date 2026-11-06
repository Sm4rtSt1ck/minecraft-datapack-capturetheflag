# Runs as the camera enderman: turns to the eyes of the killer (any online player or bot with this player_id)
scoreboard players operation #k dc.tmp = @s dc.killer
execute as @e[type=#ctf:fighter] if score @s player_id = #k dc.tmp run tag @s add ctf.dc_target
execute if entity @e[type=#ctf:fighter, tag=ctf.dc_target, limit=1] anchored eyes facing entity @e[type=#ctf:fighter, tag=ctf.dc_target, limit=1] eyes run tp @s ~ ~ ~ ~ ~
tag @e[type=#ctf:fighter] remove ctf.dc_target
