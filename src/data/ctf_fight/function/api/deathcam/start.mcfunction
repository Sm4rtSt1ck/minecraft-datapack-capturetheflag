# DEATH CAMERA (3.5 seconds). Runs as a dead player at his death location (tp_death_location).
# The camera is put into an invisible enderman (the game shows the world in negative from its eyes)
# that keeps turning to the killer. The player is forced to stay in it (ctf_fight:internal/deathcam/player).
# No killer (fall, void, own explosion...) -> no camera, only the darkness and its timing
execute unless score @s dc.killer matches 1.. run return run function ctf_fight:internal/deathcam/start_blind

scoreboard players set @s dc.t 0
tag @s add ctf.dc_on

# Scale 0.1: eyes at 0.255 blocks, so it is put 1.37 blocks up -> the camera is at the player's eye height.
# A tiny invisible enderman: almost nothing of it (the eyes, the portal particles) can be seen
summon enderman ~0.5 ~1.37 ~0.5 {NoAI: 1b, Silent: 1b, Invulnerable: 1b, PersistenceRequired: 1b, NoGravity: 1b, DeathLootTable: "minecraft:empty", Tags: ["ctf.dc", "ctf.dc_new"], active_effects: [{id: "minecraft:invisibility", duration: -1, show_particles: 0b}], attributes: [{id: "minecraft:scale", base: 0.1d}]}
scoreboard players operation @e[type=enderman, tag=ctf.dc_new] dc.owner = @s player_id
scoreboard players operation @e[type=enderman, tag=ctf.dc_new] dc.killer = @s dc.killer
execute as @e[type=enderman, tag=ctf.dc_new] at @s run function ctf_fight:internal/deathcam/face
spectate @e[type=enderman, tag=ctf.dc_new, limit=1] @s
tag @e[type=enderman, tag=ctf.dc_new] remove ctf.dc_new

# Entering through the darkness: the blindness of the death fades out (it fades smoothly)
effect clear @s minecraft:blindness
