# Explosion look and sound like TNT, at the current position. No damage, no blocks broken
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force @a[tag=!lobby]
particle minecraft:explosion ~ ~ ~ 1 1 1 0 8 force @a[tag=!lobby]
playsound minecraft:entity.generic.explode block @a[tag=!lobby] ~ ~ ~ 4 0.8
