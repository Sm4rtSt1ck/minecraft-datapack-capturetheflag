execute positioned as @s run kill @n[tag=trap_display, tag=trap.levitation, distance=1.2..1.5]

execute positioned as @s run summon area_effect_cloud ~ ~ ~ {Tags:["kc.cloud", "kc.new"], Radius:2f,potion_contents:{custom_effects:[{id:"minecraft:levitation",amplifier:1,duration:140}]}, Duration:60}

# Kill credit: the cloud gets the owner of the trap (ctf:match/events/credit/cloud)
scoreboard players operation @e[type=area_effect_cloud, tag=kc.new] kc.owner = @s kc.owner
tag @e[type=area_effect_cloud, tag=kc.new] remove kc.new

kill @s
