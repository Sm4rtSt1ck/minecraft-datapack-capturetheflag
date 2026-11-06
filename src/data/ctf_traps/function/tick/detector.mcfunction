execute positioned as @e[type=frog, tag=trap_marker, tag=trap.detector] run effect give @e[type=#ctf:fighter, tag=player, tag=defense, tag=!invisible, distance=..10] minecraft:glowing 5 1 true
execute positioned as @e[type=frog, tag=trap_marker, tag=trap.detector] run playsound minecraft:entity.allay.ambient_without_item ambient @a[tag=!lobby] ~ ~ ~ 0.02 0.8

