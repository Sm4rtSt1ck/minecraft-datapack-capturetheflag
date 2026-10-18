# Runs as the shooter, at his position. Hitscan: the bullet has no travel time and no drop.
# Settings are loaded at match start; load them now if they are missing
execute unless data storage ctf_sniper:config reload run function ctf_sniper:config

clear @s *[custom_data~{ammo:"sniper"}] 1
execute store result score @s sn.reload run data get storage ctf_sniper:config reload
execute store result score #range sn.tmp run data get storage ctf_sniper:config range
scoreboard players set #dist sn.tmp 0

# Accuracy: aimed long enough -> straight, otherwise a random spread
execute store result score #scope sn.tmp run data get storage ctf_sniper:config scope
data modify storage ctf_sniper:shot yaw set value 0f
data modify storage ctf_sniper:shot pitch set value 0f
execute if score @s sn.aim < #scope sn.tmp run function ctf_sniper:internal/spread

# Sound for everyone around (the shot gives away the sniper)
# Volume above 1 is heard further: 6 -> ~96 blocks
playsound minecraft:entity.warden.sonic_boom player @a[tag=!lobby] ~ ~ ~ 6 1.6
playsound minecraft:entity.generic.explode player @a[tag=!lobby] ~ ~ ~ 6 1.9
playsound minecraft:entity.firework_rocket.large_blast player @a[tag=!lobby] ~ ~ ~ 6 0.5

tag @s add sn.shooter
function ctf_sniper:internal/fire with storage ctf_sniper:shot
tag @s remove sn.shooter
tag @a remove sn.hit
