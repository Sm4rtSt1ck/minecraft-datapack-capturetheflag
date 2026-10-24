# The damage is dealt by the shooter, so he is the killer of the creeper
particle minecraft:damage_indicator ~ ~ ~ 0.1 0.1 0.1 0.1 2 force @a[tag=!lobby]
function ctf_guns:ray/damage_creeper with storage ctf_guns:config
playsound minecraft:entity.arrow.hit_player player @a[tag=gun.shooter] ~ ~ ~ 0.8 0.8
