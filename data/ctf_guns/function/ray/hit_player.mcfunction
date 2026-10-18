# The damage is dealt by the shooter: the game credits him with the kill (ctf_econ:kill checks the weapon)
particle minecraft:damage_indicator ~ ~ ~ 0.1 0.1 0.1 0.1 2 force @a[tag=!lobby]
execute if score #gun gun.tmp matches 1 run function ctf_guns:ray/damage_sniper with storage ctf_guns:config
execute if score #gun gun.tmp matches 2 run function ctf_guns:ray/damage_rifle with storage ctf_guns:config
playsound minecraft:entity.arrow.hit_player player @a[tag=gun.shooter] ~ ~ ~ 0.8 0.8
