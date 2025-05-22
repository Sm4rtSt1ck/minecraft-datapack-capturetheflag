execute positioned as @s run kill @n[tag=trap_display, tag=trap.wither, distance=1.2..1.5]
# tag @s add trap_temp

execute positioned as @s run summon area_effect_cloud ~ ~ ~ {Radius:1f,potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:1,duration:140}, {id: "minecraft:blindness", amplifier:1, duration:140}]}, Duration:20}
# schedule function ctf:match/events/traps/wither/trigger_2 10t

kill @s
