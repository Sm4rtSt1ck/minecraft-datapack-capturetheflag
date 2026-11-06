# The bullet hits a bot (BOTS.md). The damage is dealt by the shooter, like to a player: the game
# credits him with the kill (ctf_bots:killed, ctf_econ:kill checks the weapon)
particle minecraft:damage_indicator ~ ~ ~ 0.1 0.1 0.1 0.1 2 force @a[tag=!lobby]
function ctf_guns:ray/damage_bot with storage ctf_guns:config
playsound minecraft:entity.arrow.hit_player player @a[tag=gun.shooter] ~ ~ ~ 0.8 0.8
