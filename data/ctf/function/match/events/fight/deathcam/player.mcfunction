# Runs every tick as a player in the death camera
scoreboard players add @s dc.t 1
execute if score @s dc.t matches 70.. run return run function ctf:match/events/fight/deathcam/stop

scoreboard players operation #me dc.tmp = @s player_id
execute as @e[type=enderman, tag=ctf.dc] if score @s dc.owner = #me dc.tmp run tag @s add ctf.dc_mine
# No camera entity any more: end
execute unless entity @e[type=enderman, tag=ctf.dc_mine, limit=1] run return run function ctf:match/events/fight/deathcam/stop

# Forced: if the player left the enderman (sneak), he is put back (spectating the same entity again does nothing)
spectate @e[type=enderman, tag=ctf.dc_mine, limit=1] @s
execute as @e[type=enderman, tag=ctf.dc_mine] at @s run function ctf:match/events/fight/deathcam/face
tag @e[type=enderman, tag=ctf.dc_mine] remove ctf.dc_mine

# The killer is highlighted only for the victim: particles around him shown to this player only.
# The camera shows the world in negative, so cyan particles are seen as red
scoreboard players operation #k dc.tmp = @s dc.killer
execute as @a if score @s player_id = #k dc.tmp run tag @s add ctf.dc_target
execute at @a[tag=ctf.dc_target, limit=1] run particle minecraft:dust{color:[0.0, 0.9, 0.9], scale: 1.0} ~ ~1 ~ 0.25 0.55 0.25 0 8 force @s
tag @a remove ctf.dc_target

# Leaving through the darkness: the blindness fades in before the end
execute if score @s dc.t matches 60 run effect give @s minecraft:blindness 2 0 true
