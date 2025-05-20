execute positioned as @e[tag=trap_marker, tag=trap.detector] run effect give @a[tag=defense, distance=..10] minecraft:glowing 5 1 true
execute positioned as @e[tag=trap_marker, tag=trap.detector] run playsound minecraft:entity.allay.ambient_without_item ambient @a ~ ~ ~ 0.15 0.8

# execute positioned as @s run particle cloud ~ ~0.3 ~ 0.3 0.3 0.3 0.005 50 normal

# execute positioned as @s run kill @n[tag=trap_display, tag=trap.detector, distance=1.2..1.5]
# kill @s
