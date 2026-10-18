# Runs as the shooter, at his position. Hitscan (ctf_guns:ray): no travel time and no drop.
# Settings are loaded at match start; load them now if they are missing
execute unless data storage ctf_sniper:config reload run function ctf_sniper:config

clear @s *[custom_data~{ammo:"sniper"}] 1
execute store result score @s sn.reload run data get storage ctf_sniper:config reload

# Accuracy: aimed long enough -> straight, otherwise a random spread
scoreboard players set #s gun.tmp 0
execute store result score #scope sn.tmp run data get storage ctf_sniper:config scope
execute if score @s sn.aim < #scope sn.tmp store result score #s gun.tmp run data get storage ctf_sniper:config spread
function ctf_guns:spread

# Sound for everyone around (the shot gives away the sniper). Volume 6 -> ~96 blocks
playsound minecraft:entity.warden.sonic_boom player @a[tag=!lobby] ~ ~ ~ 6 1.6
playsound minecraft:entity.generic.explode player @a[tag=!lobby] ~ ~ ~ 6 1.9
playsound minecraft:entity.firework_rocket.large_blast player @a[tag=!lobby] ~ ~ ~ 6 0.5

scoreboard players set #gun gun.tmp 1
tag @s add gun.shooter
function ctf_guns:ray/fire with storage ctf_guns:shot
tag @s remove gun.shooter
