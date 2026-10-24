# Runs as the player: the camera goes back to him (he stays a spectator at his death location)
tag @s remove ctf.dc_on
tag @s remove ctf.dc_blind
scoreboard players reset @s dc.killer
scoreboard players reset @s dc.t
scoreboard players operation #me dc.tmp = @s player_id
execute as @e[type=enderman, tag=ctf.dc] if score @s dc.owner = #me dc.tmp run function ctf_fight:internal/deathcam/remove_entity
spectate
effect clear @s minecraft:blindness
effect give @s minecraft:blindness 1 0 true
