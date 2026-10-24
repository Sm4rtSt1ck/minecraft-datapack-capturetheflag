# Runs as the camera enderman: turns to the eyes of the killer (any online player with this player_id)
scoreboard players operation #k dc.tmp = @s dc.killer
execute as @a if score @s player_id = #k dc.tmp run tag @s add ctf.dc_target
execute if entity @a[tag=ctf.dc_target, limit=1] anchored eyes facing entity @a[tag=ctf.dc_target, limit=1] eyes run tp @s ~ ~ ~ ~ ~
tag @a remove ctf.dc_target
