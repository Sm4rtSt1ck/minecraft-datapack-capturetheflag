execute positioned as @s run kill @n[tag=trap_display, tag=trap.levitation, distance=1.2..1.5]
# tag @s add trap_temp

execute positioned as @s run summon area_effect_cloud ~ ~ ~ {Radius:2f,potion_contents:{custom_effects:[{id:"minecraft:levitation",amplifier:1,duration:140}]}, Duration:60}
# schedule function ctf:match/events/traps/levitation/trigger_2 10t

kill @s
